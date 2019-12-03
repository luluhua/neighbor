package com.citysmart.ucenter.common.util;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.json.JsonUtil;
import com.citysmart.common.util.CommonUtil;
import com.citysmart.common.util.HttpClientUtil;
import com.citysmart.ucenter.api.vo.MapVo;
import com.citysmart.ucenter.module.system.service.ITThirdInterfaceConfigService;
import com.citysmart.ucenter.module.system.service.ITThirdInterfaceLogService;
import com.citysmart.ucenter.module.system.service.ITianqiCityService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.enums.RequestMode;
import com.citysmart.ucenter.mybatis.model.TThirdInterfaceConfig;
import com.citysmart.ucenter.mybatis.model.TThirdInterfaceLog;
import com.citysmart.ucenter.mybatis.model.TianqiCity;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class ThirdInterFaceUtil {
    private  static final  Logger logger=  LoggerFactory.getLogger(ThirdInterFaceUtil.class);
    private static ITThirdInterfaceConfigService service=SpringUtil.getBean(ITThirdInterfaceConfigService.class);
    public static ITThirdInterfaceLogService itThirdInterfaceLogService=SpringUtil.getBean(ITThirdInterfaceLogService.class);
    public  static ITianqiCityService iTianqiCityService=SpringUtil.getBean(ITianqiCityService.class);

    //天气api CODE
    public static final  String API_WEATHER_CODE="weather_api";
    //百度天气api CODE
    public static final  String API_WEATHER_BAIDU_CODE="weather_baidu_api";
    /**
     * 获取 第三方接口配置
     * @param code 接口code
     */
    public static TThirdInterfaceConfig getThirdInterFaceConfig(String code) {
        if (StringUtils.isBlank(code)) {
            return null;
        }
        EntityWrapper ew = new EntityWrapper<TThirdInterfaceConfig>();
        ew.eq("interface_code", code);
        ew.eq("is_deleted", Delete.未删除.getValue());
        TThirdInterfaceConfig tThirdInterfaceConfig = service.selectOne(ew);
        if (tThirdInterfaceConfig != null) {
                return tThirdInterfaceConfig;
        }
        return null;
    }

    /**
     * 第三方接口请求
     */
    public static void requestInterface(TThirdInterfaceConfig tThirdInterfaceConfig,String groupLog){
        String result = "";
        try {
            JSONObject jsonObject = null;
            if (tThirdInterfaceConfig.getRequestMode().equals(RequestMode.GET.getValue())) {
                jsonObject = JSONObject.parseObject(HttpClientUtil.doGet(tThirdInterfaceConfig.getInterfaceHref(),
                                                                         JsonUtil.json2map(tThirdInterfaceConfig.getInterfaceParameter())));

            } else if (tThirdInterfaceConfig.getRequestMode().equals(RequestMode.POST.getValue())) {
                jsonObject = JSONObject.parseObject(
                        HttpClientUtil.doPost(tThirdInterfaceConfig.getInterfaceHref(), JsonUtil.json2map(tThirdInterfaceConfig.getInterfaceParameter())));
            }
            if (jsonObject != null) {
                result = jsonObject.toJSONString();
            }
            addThirdInterfaceLog(tThirdInterfaceConfig,tThirdInterfaceConfig.getInterfaceParameter(),result,groupLog);
        }catch (Exception e){
             logger.error("请求第三方接口异常:"+e.getMessage());
        }
    }



    /**
     * 根據接口code查詢接口請求結果（最新一條）
     * @param code 接口code
     */
    public static  TThirdInterfaceLog getLog(String code,String groupLog){
        EntityWrapper<TThirdInterfaceLog> ew = new EntityWrapper<TThirdInterfaceLog>();
        String dateranges = CommonUtil.formatDate(new Date(),"yyyy-MM-dd");
        ew.addFilter(" dt_create >= {0}", dateranges + " 00:00:00");
        ew.addFilter(" dt_create <= {0}", dateranges + " 23:59:59");
        ew.eq("interface_code",code);
        ew.eq("group_log",groupLog);
        ew.eq("is_deleted", Delete.未删除.getValue());
        ew.orderBy("dt_create",false);
        ew.last("limit 1");
        TThirdInterfaceLog tThirdInterfaceLog = itThirdInterfaceLogService.selectOne(ew);
        return  tThirdInterfaceLog;
    }

    /**
     * 根据经度、纬度查询天气城市列表
     * @param lat 纬度
     * @param lon 经度
     */
        public static TianqiCity getTianqiCityByLatLon(BigDecimal lat , BigDecimal lon){
            if(lat==null||lon==null){
                return null;
            }
            EntityWrapper ew=new EntityWrapper<TianqiCity>();
            //先计算查询点的经纬度范围
            double r = 6371;//地球半径千米
            double dis = 100;//0.5千米距离
            double dlng =  2*Math.asin(Math.sin(dis/(2*r))/Math.cos(lat.doubleValue()*Math.PI/180));
            dlng = dlng*180/Math.PI;//角度转为弧度
            double dlat = dis/r;
            dlat = dlat*180/Math.PI;
            double minlat =lat.doubleValue()-dlat;
            double maxlat = lat.doubleValue()+dlat;
            double minlng = lon.doubleValue() -dlng;
            double maxlng = lon.doubleValue() + dlng;
            ew.le("lng",maxlng);
            ew.ge("lng",minlng);
            ew.le("lat",maxlat);
            ew.ge("lat",minlat);
            ew.last("limit 1");
            TianqiCity tianqiCity=  iTianqiCityService.selectOne(ew);
            if(tianqiCity!=null){
                return  tianqiCity;
            }
            return null;
        }


    /***
     * @Author liuguicheng
     * @Description 根据客户端传递坐标，获取当前坐标城市的天气。使用百度地图api
     * @Date 10:41 2019/6/21
     * @Param 坐标
     * @return 百度地图api返回json
     **/
    public static void  getWeatherForBaidu(TThirdInterfaceConfig tThirdInterfaceConfig, String cityName,String cityId){
        try {
            if(tThirdInterfaceConfig==null||StringUtils.isBlank(tThirdInterfaceConfig.getInterfaceHref().trim())){return ;}
            if(StringUtils.isBlank(cityName)){
                cityName = "南宁";
            }
            Map<String, Object> map = new HashMap(3);
            map.put("location", cityName);
            map.put("output", "json");
            map.put("ak", "GMGAvOCI4vHHUdYINMC54wp9");
            String result= HttpClientUtil.doGet(tThirdInterfaceConfig.getInterfaceHref().replace("南宁",cityName), map);
            String parameter="location="+cityName+"&output=json&ak=GMGAvOCI4vHHUdYINMC54wp9";
            addThirdInterfaceLog(tThirdInterfaceConfig,parameter,result,cityId);
        }catch (Exception e){
            logger.error("获取百度天气接口异常："+e.getMessage());
        }
    }

    private static void addThirdInterfaceLog(TThirdInterfaceConfig tThirdInterfaceConfig, String parameter,
                                             String result, String groupLog){
        int isOk=0;
        if(StringUtils.isNotBlank(result)){
            isOk=1;
        }
        //添加第三方接口记录
        TThirdInterfaceLog tThirdInterfaceLog =
                new TThirdInterfaceLog(tThirdInterfaceConfig.getId(), tThirdInterfaceConfig.getInterfaceCode(),
                                       parameter, result, isOk,groupLog);
        tThirdInterfaceLog.setIsDeleted(Delete.未删除.getValue());
        itThirdInterfaceLogService.insert(tThirdInterfaceLog);
    }
}
