package com.citysmart.ucenter.common.util;

import com.alibaba.fastjson.JSONObject;
import com.citysmart.common.util.HttpClientUtil;
import com.citysmart.ucenter.api.vo.MapVo;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.system.service.ITThirdInterfaceLogService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.TThirdInterfaceLog;
import com.citysmart.ucenter.mybatis.model.TianqiCity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * @Description //天气接口工具类
 * @email 282303392@qq.com
 * @author:liuguicheng
 * @date: 2019/6/21
 * @time: 10:25
 */
public class WeatherUtil {
    private static Logger logger = LoggerFactory.getLogger(WeatherUtil.class);
    private static final String WEATHER_BAIDU_API="http://api.map.baidu.com/telematics/v3/weather";
    public static ITThirdInterfaceLogService
            itThirdInterfaceLogService=SpringUtil.getBean(ITThirdInterfaceLogService.class);
    /***
     * @Author liuguicheng
     * @Description 根据客户端传递坐标，获取当前坐标城市的天气。使用百度地图api
     * @Date 10:41 2019/6/21
     * @Param 坐标
     * @return 百度地图api返回json
     **/
    public static String getWeatherForBaidu(MapVo mapVo){
        try {
            //默认城市南宁
            String cityName = "南宁";
            //根据坐標获取城市
            if(mapVo!=null&&mapVo.getLng()!=null&&mapVo.getLat()!=null){
                TianqiCity tianqiCity=ThirdInterFaceUtil.getTianqiCityByLatLon(mapVo.getLat(), mapVo.getLng());
                if(tianqiCity!=null){
                    cityName=tianqiCity.getCityZh();
                }
            }
            Map<String, Object> map = new HashMap(3);
            map.put("location", cityName);
            map.put("output", "json");
            map.put("ak", "GMGAvOCI4vHHUdYINMC54wp9");
            return HttpClientUtil.doGet(WEATHER_BAIDU_API, map);
        }catch (Exception e){
            logger.error("获取百度天气接口异常："+e.getMessage());
        }
        return null;
    }


    public static void main(String[] args){
        String jsonStr= getWeatherForBaidu(null);
        System.out.println("返回结果:"+jsonStr);
    }
}
