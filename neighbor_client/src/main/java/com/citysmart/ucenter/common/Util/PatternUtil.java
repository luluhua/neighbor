package com.citysmart.ucenter.common.Util;

import org.apache.commons.lang3.StringUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author lub
 */
public class PatternUtil {
    /**
     * 1、密码必须由数字、字符、特殊字符(_、#、@)三种中的两种组成；
     * 2、密码长度不能少于6个字符；
     */
    public static boolean validatorPassword(String password) {
        String str = "^(?![A-Z]+$)(?![a-z]+$)(?![0-9]+$)\\S{6,16}$";
        Pattern pattern = Pattern.compile(str);
        return pattern.matcher(password).matches();
    }

    /**
     * 手机号验证
     *
     * @param phone
     * @return 验证通过返回true
     */
    public static boolean isMobile(String phone) {
        if (StringUtils.isEmpty(phone)) {
            return false;
        }
        String regex = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";
        if (phone.length() != 11) {
            return false;
        } else {
            Pattern p = Pattern.compile(regex);
            Matcher m = p.matcher(phone);
            boolean isMatch = m.matches();
            return isMatch;
        }
    }

    /***
     * 判断是否是对应的格式的日期字符串
     * @param dateStr
     * @param datePattern
     * @return
     */
    public static boolean isRightDateStr(String dateStr, String datePattern) {
        DateFormat dateFormat = new SimpleDateFormat(datePattern);
        try {
            //采用严格的解析方式，防止类似 “2017-05-35” 类型的字符串通过
            dateFormat.setLenient(false);
            dateFormat.parse(dateStr);
//            Date date = (Date)dateFormat.parse(dateStr);
//            //重复比对一下，防止类似 “2017-5-15” 类型的字符串通过
//            String newDateStr = dateFormat.format(date);
//            if(dateStr.equals(newDateStr)){
//                return true;
//            }else {
//                return false;
//            }
            return true;
        } catch (ParseException e) {
            return false;
        }
    }

    public static String sdfFormat(String dateStr, String datePattern) {
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dateFormat.setLenient(false);
            dateFormat.parse(dateStr);
            Date date = (Date) dateFormat.parse(dateStr);
            dateFormat = new SimpleDateFormat(datePattern);
            return dateFormat.format(date);
        } catch (Exception e) {
            return "";
        }
    }

    public static void main(String[] args) {
        System.out.println(sdfFormat("2019-1-11", "yyyy年MM月dd日"));
    }
}
