package com.citysmart.common.util.oauth2;


import org.apache.commons.lang3.StringUtils;

import java.util.*;

/***
 * @Author liuguicheng
 * @Description //TODO  签名工具
 * @Date 14:49 2019/7/16
 **/
public class SignUtil {


    /***
     * @Author liuguicheng
     * @Description //TODO 验证签名
     * @Date 18:15 2019/7/16
     **/
    public static boolean verifySign_v2(String queryParam,String key,String sign) throws Exception {
        if(StringUtils.isAnyBlank(queryParam,key,sign)){return false;}
        String createSign=HMACSHA256.sha256_HMAC(queryParam,key).toUpperCase();
        if(sign.equals(createSign)){
            return true;
        }
        return false;

    }
    /***
     * @Author liuguicheng
     * @Description //TODO  创建签名
     * @Date 18:15 2019/7/16
     **/
    public static String createSign_v2(String parameters, String key) throws Exception {
        //HMAC-SHA256加密,结果转换为大写字符
        return HMACSHA256.sha256_HMAC(parameters,key).toUpperCase();
    }
    /***
     * @Author liuguicheng
     * @Description //TODO 验证签名
     * @Date 18:15 2019/7/16
     **/
    public static boolean verifySign(Map<String, String> parameters,String key,String sign) throws Exception {
        if(StringUtils.isBlank(sign)||StringUtils.isBlank(key)
                ||parameters==null){return false;}
        String createSign=createSign(parameters, key);
        if(sign.equals(createSign)){
            return true;
        }
        return false;

    }
    /***
     * @Author liuguicheng
     * @Description //TODO  创建签名
     * @Date 18:15 2019/7/16
     **/
    public static String createSign(Map<String, String> parameters, String key) throws Exception {
        String parmasAccsii=paramsAccsii(parameters);
        //HMAC-SHA256加密,结果转换为大写字符
        return HMACSHA256.sha256_HMAC(parmasAccsii,key).toUpperCase();
    }
    /***
     * @Author liuguicheng
     * @Description //TODO  参数排序（accsii排序<字典顺序>）
     * @Date 18:15 2019/7/16
     **/
    public static String paramsAccsii(Map<String, String> parameters) throws Exception {
        if(parameters.size()==0){return "";}
        StringBuffer sb = new StringBuffer();
        //所有参与传参的参数按照accsii排序（字典顺序）
//        Set es = parameters.entrySet();
        List<Map.Entry<String, String>> infoIds = new ArrayList<Map.Entry<String, String>>(parameters.entrySet());
        // 对所有传入参数按照字段名的 ASCII 码从小到大排序（字典序）
        Collections.sort(infoIds, new Comparator<Map.Entry<String, String>>() {
            @Override
            public int compare(Map.Entry<String, String> o1, Map.Entry<String, String> o2) {
                return (o1.getKey()).toString().compareTo(o2.getKey());
            }
        });
        Iterator it = infoIds.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            String k = (String) entry.getKey();
            String v = (String)entry.getValue();
            //空值不传递，不参与签名组串
            if (null != v && !"".equals(v)) {
                sb.append(k + "=" + v + "&");
            }
        }
        //去掉最后一个&
        if(StringUtils.isBlank(sb.toString())) {
            throw new Exception("accsii排序错误");
        }
        if (sb.toString().length() > 0)
        {
            sb.deleteCharAt(sb.length()-1);
        }
        System.out.println("所有参与传参的参数按照accsii排序（字典顺序）:"+sb.toString());
        return sb.toString();
    }

    public static void main(String[] args) throws Exception {
        String key="32f18af61bb442c18fe893f115b30815";
      System.out.println(HMACSHA256.sha256_HMAC("name1=%E5%BC%A0%E4%B8%89&pas1=123&key=32f18af61bb442c18fe893f115b30815",key).toUpperCase());
    }
}
