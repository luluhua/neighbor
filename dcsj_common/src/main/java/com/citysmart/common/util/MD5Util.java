package com.citysmart.common.util;

import org.apache.shiro.crypto.hash.SimpleHash;

public class MD5Util {
    /**
     * 密码加密
     *
     * @param password
     * @param salt
     * @return
     */

    public static String md51024PwdForShiro(String password, Object salt) {
        return new SimpleHash("MD5", password, salt, 1024).toString();
    }
}
