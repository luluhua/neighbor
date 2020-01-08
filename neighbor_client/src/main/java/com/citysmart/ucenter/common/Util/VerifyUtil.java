package com.citysmart.ucenter.common.Util;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.ucenter.mybatis.model.SysSetting;
import org.springframework.stereotype.Component;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author li
 * @date 2020/1/8
 */
@Component
public class VerifyUtil {

    public static Boolean VerifyMail(String mail) {
        String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern regex = Pattern.compile(check);
        Matcher matcher = regex.matcher(mail);
        return matcher.matches();
    }


    /**
     * 电话号码隐藏中间四位数
     */
    public static String getFormatPhone(String phone) {
        if (phone != null) {
            String hiddenPhone = phone.replaceAll("(\\d{3})\\d{4}(\\d{4})", "$1****$2");
            return hiddenPhone;
        }
        return null;
    }

    /**
     * 邮箱只显示@前面的首位跟末位
     */
    public static String getFormatMail(String email) {
        if (email != null) {
            String hiddenEmail = email.replaceAll("(\\w?)(\\w+)(\\w)(@\\w+\\.[a-z]+(\\.[a-z]+)?)", "$1****$3$4");
            return hiddenEmail;
        }
        return null;
    }

}
