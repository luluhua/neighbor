package com.citysmart.ucenter.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author li
 * @date 2019/7/31
 */
public class qxyMD5 {

    public static void main(String[] args) throws Exception {
        String key1 = "test_name123";
        String md5 = getPhpMd5(key1.getBytes());
        String key2 = md5 + "longsun159456";
        String sign = getPhpMd5(key2.getBytes());
        System.out.println(sign);
    }

    public static String getPhpMd5(byte[] buffer) {
        String s = null;
        MessageDigest md = null;

        char[] hexChars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
        md.update(buffer);
        byte[] datas = md.digest(); //16个字节的长整数
        char[] str = new char[2 * 16];
        int k = 0;
        for (int i = 0; i < 16; i++) {
            byte b = datas[i];
            str[k++] = hexChars[b >>> 4 & 0xf];//高4位
            str[k++] = hexChars[b & 0xf];//低4位
        }
        s = new String(str);
        return s;
    }
}
