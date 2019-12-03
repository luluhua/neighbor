package com.citysmart.ucenter.common.util;

import com.citysmart.common.util.Encryption3DEsUtil;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;

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
//    public final static String ENCRYPTION_KEY ="qingxiuParentEncryptionMode2019";
    private static Pattern numberPattern = Pattern.compile(".*\\d+.*");
    private static Pattern lowerCasePattern = Pattern.compile(".*[a-z]+.*");
    private static Pattern upperCasePattern = Pattern.compile(".*[A-Z]+.*");
    static {
        pwdPatternList.add(Pattern.compile(".{6,}"));//6位以上
        pwdPatternList.add(numberPattern);//包含数字
        pwdPatternList.add(lowerCasePattern);//包含小写字母
        pwdPatternList.add(upperCasePattern);//包含大写字母
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
     * 是否满足密码规则：<br/>
     * 8~20位，由大写字母、小写字母和数字组成
     * @param orgPwd
     * @return true不通过，false通过
     */
    public static boolean failedPwdStrong(String orgPwd) {
        if(StringUtils.isBlank(orgPwd)){
            return true;
        }
        if(orgPwd.length() < 8 && orgPwd.length() > 20){
            return true;
        }
        int modes = 0;
        if (numberPattern.matcher(orgPwd).matches()) {
            modes++;
        }
        if (lowerCasePattern.matcher(orgPwd).matches()) {
            modes++;
        }
        if (upperCasePattern.matcher(orgPwd).matches()) {
            modes++;
        }
        if(modes < 3){
            return true;
        }
        return false;
    }

    /**
     * 加密
     *
     * @param obj
     * @return
     */
    public static String Encryption3DEs(String obj) {
        String toString = Encryption3DEsUtil
                .encryptMode(obj, ENCRYPTION_KEY);
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

    public static void main(String[] args) {
//        String simp = "123456";
//        System.out.println("===================================");
//        System.out.println(simp);
//        System.out.println(pwdStrongModes(simp));
//        System.out.println("===================================");
//        simp = "12345678asd";
//        System.out.println("===================================");
//        System.out.println(simp);
//        System.out.println(pwdStrongModes(simp));
//        System.out.println("===================================");
//        simp = "12345678asdASD";
//        System.out.println("===================================");
//        System.out.println(simp);
//        System.out.println(pwdStrongModes(simp));
//        System.out.println("===================================");
//        simp = "12345678asdASD/*-";
//        System.out.println("===================================");
//        System.out.println(simp);
//        System.out.println(pwdStrongModes(simp));
//        System.out.println("===================================");
//        System.out.println();
        System.out.println(Encryption3DEs("452502198509103419"));
        System.out.println(Decrypt3DEs("X9gd8His22q0GB116TWWAIpigmEEM8Bv"));

    }
}
