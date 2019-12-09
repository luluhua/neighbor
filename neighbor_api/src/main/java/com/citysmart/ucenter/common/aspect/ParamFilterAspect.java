package com.citysmart.ucenter.common.aspect;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.citysmart.ucenter.common.anno.ParamFilter;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 过滤参数中特殊字符和敏感字符
 * */
@Order(2)
@Aspect
@Component
public class ParamFilterAspect {

    public static Logger logger = Logger.getLogger(ParamFilterAspect.class);

    /**
     * 过滤器入口
     * */
    @Pointcut("@annotation(com.citysmart.ucenter.common.anno.ParamFilter)")
    public void paramFilterAspect() {

    }

    /**
     * 获取并修改目标函数的参数
     * @param point
     */
    @Around("paramFilterAspect()")
    public Object doBefore(ProceedingJoinPoint point){
        Object retVal = null;
        MethodSignature methodSignature = (MethodSignature) point.getSignature();
        Method method = methodSignature.getMethod();
        ParamFilter filter = method.getAnnotation(ParamFilter.class);
        String[] parameterNames = methodSignature.getParameterNames();
        String[] tmp=null;
        String[] escAttributes=null;
        if(filter.escapeAttributes()!=null){
            tmp=filter.escapeAttributes().split(",");
        }
        String ds="";
        for(String s:tmp){
            if(s.trim().length()>0){
                ds+=s.trim()+",";
            }
        }
        if(ds.length()>0){
            ds=ds.substring(0,ds.length()-1);
            escAttributes=ds.split(",");
        }
        try {
            Object[] objs=point.getArgs();
            for(int i=0;i<objs.length;i++){
                boolean isExists=false;
                if(escAttributes!=null){
                    for(String s:escAttributes){
                        if(s.equals(parameterNames[i])){
                            isExists=true;
                        }
                    }
                }
                if(!isExists){
                    if(objs[i] != null && objs[i] instanceof String){
                        objs[i]=formateRequestContent(objs[i],
                                                      filter.openJsonFilter(),
                                                      escAttributes).toString();
                    }else if(objs[i] != null && !(objs[i] instanceof String)){
                        objs[i]=mineReflect(objs[i],
                                            filter.openJsonFilter(),
                                            escAttributes);
                    }else{
                        //不做处理
                    }
                }
            }
            retVal = point.proceed(point.getArgs());
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            return null;
        }
        return retVal;
    }

    /**
     * 特殊字符转换
     * @param value 需要过滤的字符串
     * @param openJson 是否开启json字符串属性内部过滤
     * @param escapeAttributes 不需要做字符过滤的属性名称，多个属性用“,”隔开
     * */
    private Object formateRequestContent(Object value,boolean openJson,String[] escapeAttributes){
        if (value == null) {
            return null;
        }
        //先做全角转半角的操作
        value=formateFullAngle(value.toString());
        //先做敏感字符处理
        value = value.toString().replaceAll("script", "");
        value = value.toString().replaceAll("select", "");
        value = value.toString().replaceAll(" and ", "");
        value = value.toString().replaceAll(" or ", "");
        //后做特殊字符处理
        if(!openJson){
            value = StringEscapeUtils.escapeHtml3(value.toString());
        }else{
            value = jsonValueFormat(value,escapeAttributes);
        }
        return value;
    }

    /**
     * json模式属性
     * */
    private Object jsonValueFormat(Object value,String[] escapeAttributes){
        if(value==null){
            return null;
        }

        if(isJson(value)){
            if(isJsonArray(value)){
                List<Object> list_new=new ArrayList<Object>();
                List<Object> list=JSONObject.parseArray(value.toString());
                for(Object obj:list){
                    list_new.add(jsonValueFormat(obj,escapeAttributes));
                }
                value=list_new;
            }else{
                Map<String,Object> objs=(Map<String,Object>)JSONObject.parse(value.toString());
                if(objs!=null){
                    for(Map.Entry<String, Object> entry : objs.entrySet()){
                        if(escapeAttributes!=null&&escapeAttributes.length>0){
                            for(String attributes : escapeAttributes){
                                if(!"".equals(attributes.trim())){
                                    //判断是否属于被标识为不处理的属性
                                    if(!entry.getKey().equals(attributes)){
                                        if(isJson(entry.getValue().toString())){
                                            entry.setValue(jsonValueFormat(entry.getValue(),
                                                                           escapeAttributes));
                                        }else{
                                            entry.setValue(StringEscapeUtils.escapeHtml3(entry.getValue().toString()));
                                        }
                                    }
                                }
                            }
                        }else{
                            if(isJson(entry.getValue().toString())){
                                entry.setValue(jsonValueFormat(entry.getValue()
                                        ,escapeAttributes));
                            }else{
                                entry.setValue(StringEscapeUtils.escapeHtml3(entry.getValue().toString()));
                            }
                        }
                    }
                    value=objs;
                }
            }
        }else{
            value = StringEscapeUtils.escapeHtml3(value.toString());
        }
        return value;
    }

    /**
     * 判定字符串是否json格式
     * */
    private boolean isJson(Object content) {
        if(content==null){
            return false;
        }
        try {
            JSONObject.parseObject(content.toString());
        } catch (Exception e) {
            try {
                JSONObject.parseArray(content.toString());
            } catch (JSONException ex1) {
                return false;
            }
        }
        return true;
    }

    /**
     * 判定字符串是否是json数组
     * */
    private boolean isJsonArray(Object content) {
        if(content==null){
            return false;
        }
        try {
            JSONObject.parseArray(content.toString());
        } catch (JSONException ex1) {
            return false;
        }
        return true;
    }

    /**
     * 对字符串属性做敏感字符过滤
     * */
    public Object mineReflect(Object model,boolean openJson,String[] escapeAttributes) throws Exception {
        Field[] field = model.getClass().getDeclaredFields();
        String[] modelName = new String[field.length];
        String[] modelType = new String[field.length];
        for (int i = 0; i < field.length; i++) {
            String name = field[i].getName();
            modelName[i] = name;
            String type = field[i].getGenericType().toString();
            modelType[i] = type;
            field[i].setAccessible(true);
            name = name.replaceFirst(name.substring(0, 1), name.substring(0, 1).toUpperCase());
            boolean isExists=false;
            if(escapeAttributes!=null){
                for(String s:escapeAttributes){
                    s = s.replaceFirst(s.substring(0, 1), s.substring(0, 1).toUpperCase());
                    if(name.equals(s)){
                        isExists=true;
                    }
                }
            }
            if(!isExists){
                if (type.equals("class java.lang.String")) {
                    Method m = model.getClass().getMethod("get" + name);
                    String value = (String) m.invoke(model);
                    if (value != null) {
                        value=formateFullAngle(value);
                        m = model.getClass().getMethod("set" + name,String.class);
                        m.invoke(model,formateRequestContent(value,
                                                             openJson,
                                                             escapeAttributes).toString());
                    }
                }
            }
        }
        return model;
    }

    /**
     * 全角转半角
     * */
    public String formateFullAngle(String str) {
        char c[] = str.toCharArray();
        for (int i = 0; i < c.length; i++) {
            if (c[i] == '\u3000') {
                c[i] = ' ';
            } else if (c[i] > '\uFF00' && c[i] < '\uFF5F') {
                c[i] = (char) (c[i] - 65248);
            }
        }
        String returnString = new String(c);
        return returnString;
    }
}
