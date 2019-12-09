package com.citysmart.ucenter.common.Util;

import com.citysmart.common.util.Encryption3DEsUtil;
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

    public final static String ENCRYPTION_KEY = RedisUtil.getValueByKey("encryption.3DEs.key");

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
     *
     * @param obj
     * @return
     */
    public static String Encryption3DEs(String obj) {

        String toString = Encryption3DEsUtil.encryptMode(obj, ENCRYPTION_KEY);
        return toString;
    }

    /**
     * 解密
     *
     * @param obj
     * @return
     */
    public static String Decrypt3DEs(String obj) {
        String toString = Encryption3DEsUtil.decryptMode(obj, ENCRYPTION_KEY);
        return toString;
    }
}
