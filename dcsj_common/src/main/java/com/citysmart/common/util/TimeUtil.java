package com.citysmart.common.util;

public class TimeUtil {

    /**
     * 分钟换算秒
     * @param minute
     * @return
     */
    public static Integer MinuteToSecond(Integer minute){

        return minute*60;
    }

    /**
     * 毫秒换算分钟
     * @param millisecond
     * @return
     */
    public static Integer MillisecondToMinute(Integer millisecond){
        return (millisecond/1000)/60;
    }

    /**
     * 毫秒换算秒
     * @param millisecond
     * @return
     */
    public static Integer MillisecondToSecond(Integer millisecond){
        return millisecond/1000;
    }
}
