package com.citysmart.common.util;

import org.apache.tomcat.util.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.security.MessageDigest;

/**
 * 3DES加密解密工具
 * liuguicheng
 * 2019-03-10
 */
public class Encryption3DEsUtil {
    private static Logger logger = LoggerFactory.getLogger(Encryption3DEsUtil.class);
    //定义加密算法，有DES、DESede(即3DES)、Blowfish
    private static final String Algorithm = "DES";

    /**
     * 加密方法
     * com/citysmart/common/util/Encryption3DEsUtil.java:19
     *
     * @param tx                 加密参数
     * @param PASSWORD_CRYPT_KEY 加密key
     * @return
     */
    public static String encryptMode(String tx, String PASSWORD_CRYPT_KEY) {
        try {
            byte[] src = tx.getBytes();
//            SecretKey deskey = new SecretKeySpec(build3DesKey(PASSWORD_CRYPT_KEY), Algorithm);    //生成密钥
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(Algorithm);
            DESKeySpec keySpec = new DESKeySpec(PASSWORD_CRYPT_KEY.getBytes());
            Key key = keyFactory.generateSecret(keySpec);
            Cipher c1 = Cipher.getInstance(Algorithm);    //实例化负责加密/解密的Cipher工具类
            c1.init(Cipher.ENCRYPT_MODE, key);    //初始化为加密模式
            String pwd = Base64.encodeBase64String(c1.doFinal(src));
            return pwd;
        } catch (java.security.NoSuchAlgorithmException e1) {
            logger.error(e1.getMessage());
            return "加密异常";
        } catch (javax.crypto.NoSuchPaddingException e2) {
            logger.error(e2.getMessage());
            return "加密异常";
        } catch (java.lang.Exception e3) {
            logger.error(e3.getMessage());
            return "加密异常";
        }
    }


    /**
     * 解密函数
     *
     * @param pwd                密文
     * @param PASSWORD_CRYPT_KEY 加密key
     * @return
     */
    public static String decryptMode(String pwd, String PASSWORD_CRYPT_KEY) {
        try {
            byte[] src = Base64.decodeBase64(pwd);
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(Algorithm);
            DESKeySpec keySpec = new DESKeySpec(PASSWORD_CRYPT_KEY.getBytes());
            Key key = keyFactory.generateSecret(keySpec);
//            SecretKey deskey = new SecretKeySpec(build3DesKey(PASSWORD_CRYPT_KEY), Algorithm);
            Cipher c1 = Cipher.getInstance(Algorithm);
            c1.init(Cipher.DECRYPT_MODE, key);    //初始化为解密模式
            return new String(c1.doFinal(src));
        } catch (java.security.NoSuchAlgorithmException e1) {
            logger.error(e1.getMessage());
            return pwd;
        } catch (javax.crypto.NoSuchPaddingException e2) {
            logger.error(e2.getMessage());
            return pwd;
        } catch (java.lang.Exception e3) {
            logger.error(e3.getMessage());
            return pwd;
        }
    }


    /**
     * 根据字符串生成密钥字节数组
     *
     * @param keyStr 密钥字符串
     * @return
     * @throws UnsupportedEncodingException
     */
    public static byte[] build3DesKey(String keyStr) throws UnsupportedEncodingException {
        byte[] key = new byte[24];    //声明一个24位的字节数组，默认里面都是0
        byte[] temp = keyStr.getBytes("UTF-8");    //将字符串转成字节数组

        /*
         * 执行数组拷贝
         * System.arraycopy(源数组，从源数组哪里开始拷贝，目标数组，拷贝多少位)
         */
        if (key.length > temp.length) {
            //如果temp不够24位，则拷贝temp数组整个长度的内容到key数组中
            System.arraycopy(temp, 0, key, 0, temp.length);
        } else {
            //如果temp大于24位，则拷贝temp数组24个长度的内容到key数组中
            System.arraycopy(temp, 0, key, 0, key.length);
        }
        return key;
    }

    /**
     * 散列算法
     *
     * @param byteSource 需要散列计算的数据
     * @return 经过散列计算的数据
     * @throws Exception
     */
    public static byte[] hashMethod(byte[] byteSource) throws Exception {
        try {
            MessageDigest currentAlgorithm = MessageDigest.getInstance("SHA-1");
            currentAlgorithm.reset();
            currentAlgorithm.update(byteSource);
            return currentAlgorithm.digest();
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * 工具测试
     */


    public static void main(String[] args) {
        String msg = "18269110252";
        String key = "qingxiuParentEncryptionMode2019";
        System.out.println("【加密前】：" + msg);
        //加密
        String secretArr = encryptMode(msg, key);
        System.out.println("【加密后】：" + new String(secretArr));

        //解密
//        key = "1";
        String myMsgArr = decryptMode(secretArr, key);
        System.out.println("【解密后】：" + new String(myMsgArr));
    }

}
