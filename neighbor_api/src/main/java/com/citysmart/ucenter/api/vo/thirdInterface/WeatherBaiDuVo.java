package com.citysmart.ucenter.api.vo.thirdInterface;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.citysmart.ucenter.api.vo.BaseVo;
import com.citysmart.ucenter.mybatis.model.TThirdInterfaceLog;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tuyang.beanutils.annotation.BeanCopySource;
import com.tuyang.beanutils.annotation.CopyProperty;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Description //百度地圖 天氣 vo
 * @email 282303392@qq.com
 * @author:liuguicheng
 * @date: 2019/6/21 11:49
 */
@Getter
@Setter
@BeanCopySource(source = TThirdInterfaceLog.class)
public class WeatherBaiDuVo extends BaseVo {

    @CopyProperty(property = "resContent")
    @JsonIgnore
    private String weatherData;

    private String week;
    private String wea;
    private String wea_img;
    private String tem;
    private String win;
    private String win_speed;


    public void setWeatherData(String weatherData) {
        if (StringUtils.isNotBlank(weatherData)) {
            JSONObject jsonObject = JSON.parseObject(weatherData);
            if (jsonObject != null) {
                String date=jsonObject.getString("date").trim();
                String todayWeek=dateToWeek(date);
                JSONArray jsonArray= JSONArray.parseArray(jsonObject.get("results").toString());
                if (jsonArray == null) { return; }
                jsonObject=jsonArray.getJSONObject(0);
                if (jsonObject == null) {return; }
                    jsonArray= JSONArray.parseArray(jsonObject.get("weather_data").toString());
                    if(jsonArray==null) {
                        return;
                    }
                        for(int i=0;i<jsonArray.size();i++){
                            jsonObject=jsonArray.getJSONObject(i);
                            if (jsonObject != null) {
                                //星期
                                String arryWeek=toWeek(jsonObject.getString("date".trim()));
                                if(!todayWeek.equals(arryWeek)){
                                    continue;
                                }
                                setWeek(arryWeek);
                                //天气情况
                                setWea(jsonObject.get("weather").toString());
                                //天气图标
//                            setWea_img(jsonObject.get("dayPictureUrl").toString());
                                //温度（最高）
                                setTem(jsonObject.get("temperature").toString());
                                //风向
                                setWin(jsonObject.get("wind").toString());
                                return;
                            }
                        }
            }
        }
    }
    private String toWeek(String weekStr){
        if(StringUtils.isBlank(weekStr)){
            return "";
        }
        return toCoverWeek(weekStr.substring(0,2));
    }
    private String toCoverWeek(String weekStr){
        if(StringUtils.isBlank(weekStr)){
            return "";
        }
        String week="";
        switch (weekStr){
            case "周一":
                week="星期一";
                break;
            case "周二":
                week="星期二";
                break;
            case "周三":
                week="星期三";
                break;
            case "周四":
                week="星期四";
                break;
            case "周五":
                week="星期五";
                break;
            case "周六":
                week="星期六";
                break;
            case "周日":
                week="星期日";
                break;
            default:
                break;
        }
        return week;

    }

    /*日期转星期*/
    public static String dateToWeek(String datetime) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        // 获得一个日历
        Calendar cal = Calendar.getInstance();
        Date datet = null;
        try {
            datet = f.parse(datetime);
            cal.setTime(datet);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        // 指示一个星期中的某天。
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0) {
            w = 0;
        }
        return weekDays[w];
    }
}
