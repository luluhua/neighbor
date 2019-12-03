package com.citysmart.common.util;

import com.google.common.collect.Lists;

import java.util.List;
import java.util.regex.Pattern;

/**
 * <p>
 * 密码强壮度工具
 * </p>
 * 共有5个档次，1很弱，2弱，3中，4强，5很强
 *
 * @author zhouyanjian
 * @Date 2019/6/19 15:29
 */
public class PWDStrongUtil {
    //登录密码规则正则
    private static List<Pattern> pwdPatternList = Lists.newArrayList();

    static {
        pwdPatternList.add(Pattern.compile(".{6,}"));//6位以上
        pwdPatternList.add(Pattern.compile(".*\\d+.*"));//包含数字
        pwdPatternList.add(Pattern.compile(".*[a-z]+.*"));//包含小写字母
        pwdPatternList.add(Pattern.compile(".*[A-Z]+.*"));//包含大写字母
        pwdPatternList.add(Pattern.compile(".*[~!@#$%^&*()_+|<>,.?/:;'\\[\\]{}\"]+.*"));//包含特殊字符
    }

    /**
     * 1很弱，2弱，3中，4强，5很强
     *
     * @param orgPwd
     * @return int强度档次
     */
    public static int pwdStrongModes(String orgPwd) {
        int modes = 0;
        for (Pattern p : pwdPatternList) {
            if (p.matcher(orgPwd).matches()) {
                modes++;
            }
        }
        return modes;
    }

    /**
     * 加密
     * @param obj key
     * @return
     */
    public static String Encryption3DEs(String obj,String key) {
        String toString = Encryption3DEsUtil
                .encryptMode(obj, key);
        return toString;
    }

    /**
     * 解密
     * @param obj key
     * @return
     */
    public static String Decrypt3DEs(String obj,String key) {
        String toString = Encryption3DEsUtil.decryptMode(obj, key);
        return toString;
    }

    public static void main(String[] args) {
        String simp = "123456";
        System.out.println("===================================");
        System.out.println(simp);
        System.out.println(pwdStrongModes(simp));
        System.out.println("===================================");
        simp = "12345678asd";
        System.out.println("===================================");
        System.out.println(simp);
        System.out.println(pwdStrongModes(simp));
        System.out.println("===================================");
        simp = "12345678asdASD";
        System.out.println("===================================");
        System.out.println(simp);
        System.out.println(pwdStrongModes(simp));
        System.out.println("===================================");
        simp = "12345678asdASD/*-";
        System.out.println("===================================");
        System.out.println(simp);
        System.out.println(pwdStrongModes(simp));
        System.out.println("===================================");
        System.out.println();
    }
}
