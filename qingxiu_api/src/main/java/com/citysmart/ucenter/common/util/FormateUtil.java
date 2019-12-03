package com.citysmart.ucenter.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author lub
 */
public class FormateUtil {
    public static String formatDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }
}
