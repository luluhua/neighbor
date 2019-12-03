package com.citysmart.common.util;


import org.apache.shiro.codec.Base64;

import javax.crypto.*;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.security.*;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.UUID;


/**
 * Created by wkang on 2019/03/12.
 */
/*
示例：
公钥和私钥：
String pubKeyNet  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC03qfFOqswlKDo+wOXu4sUb+tUJKQkP7pkvvSgHFShDBEXDwnKZnj/3+HogloQANNzNs6WQOfzq1vgYXpuodRg8Xt6c6KxvUO4LmKwoo12o4k7KZ1JHDfkSXukqmiSGmwvh4BA4LBbHSRvFLcjB6/I7Rs6po/gh7UOKhWftxIBDQIDAQAB";
String priKeyNet = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALTep8U6qzCUoOj7A5e7ixRv61QkpCQ/umS+9KAcVKEMERcPCcpmeP/f4eiCWhAA03M2zpZA5/OrW+Bhem6h1GDxe3pzorG9Q7guYrCijXajiTspnUkcN+RJe6SqaJIabC+HgEDgsFsdJG8UtyMHr8jtGzqmj+CHtQ4qFZ+3EgENAgMBAAECgYAEDSi85j+Hawzfqx+9eln3LzqaO+fhV/wY3Z4lJ/1NTjPjzFZvzjPPp3gr+R+DVEFoR0YBX5rSfngkYoqXh9B2AcxnzaGZk+LECRWJoCODgnIFAQ5yqEpYcfJfA3+zueJxOw5YgPdr85Noepfu/olKNK0OCFbceHbypsF3LkK+kQJBAOEPATxofAFiImU62dubDBRRSuzJPheIqfv/e3s7QVf7BQ5TfS9NjhREZocxA8xdCkHhG6HJ+A81QEFUlSxHw5MCQQDNvGmDtoLnEbrILwoadDixIbaAlgLeJPwrgvgHpAiirJycIEkLYfF7YncdJZViVhpm/w4IzXCcLPNHmaQM5UzfAkEAvHf2TwIopnfp2eAYxODokrMpDXXRe5/EyfU/EQmkROs/Zqnf8Zb+3lYRjjErvx5DErxSiYA7LXEoqA0PBw/p5QJAUWgYKDHzohL14Xgbe1Q5in1YhZDWGahwz5bHJd7WO+gpH+32eTaMItJXZ4UTkxGW6OJLX1hLEsEGknJM431n6QJABfPSer4SLAAWT0vd0enSuTMFMmnfG85PcdI6fJqLsOLyRdmTDS3M5tnEwjqxT9D2ep/01ABfxnQa/1xKW/zBYA==";

// 原字符串:
String strData = "Is'snowflake My Data";

// 公钥加密:
CryptoData crypto = new CryptoData(pubKeyNet, true);
byte[] encryptedData = crypto.encrypt(str);

// 私钥解密：
CryptoData crypto = new CryptoData(priKeyNet, false);
byte[] orgData = crypto.decrypt(encryptedData);

* */
public class CryptoData {

    boolean isPublicKey = false;
    Key rsaKey;
    final String rsaPadding = "RSA/ECB/PKCS1Padding";
    final String encPadding = "AES/ECB/ISO10126Padding";
    final String chartSet = "utf-8";

    public CryptoData(String keyBase64, boolean isPublicKey) throws Exception {
        byte[] keyBytes = base64Decode(keyBase64.getBytes(chartSet));
        setup(keyBytes, isPublicKey);
    }

    public CryptoData(byte[] key, boolean isPublicKey) throws Exception {
        setup(key, isPublicKey);
    }

    private void setup(byte[] key, boolean isPublicKey) throws Exception {
        this.isPublicKey = isPublicKey;
        if (isPublicKey) {
            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(key);
            rsaKey = KeyFactory.getInstance("RSA").generatePublic(keySpec);
        } else {
            PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(key);
            rsaKey = KeyFactory.getInstance("RSA").generatePrivate(keySpec);
        }
        if (rsaKey == null) {
            throw new Exception("创建失败");
        }
    }

    public String encrypt(String data) throws UnsupportedEncodingException {
        byte[] result = encrypt(data.getBytes(chartSet));
        return base64Encode2String(result);
    }

    public byte[] encrypt(byte[] data) throws UnsupportedEncodingException {
        if (data == null || data.length == 0) {
            return null;
        }

        String rndKey = UUID.randomUUID().toString();
        byte[] rndKeyData = encryptMD5(rndKey.getBytes(chartSet));

        byte[] rsaKeyData = rsaTemplate(rndKeyData, true);
        int rsaKeyLength = rsaKeyData.length;

        byte[] encData = symmetricTemplate(data, rndKeyData, "AES", encPadding, null, true);
        int encDataLength = encData.length;

        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        byte[] bytesKeyLength = intToByte4(rsaKeyLength);
        bos.write(bytesKeyLength, 0, bytesKeyLength.length);
        bos.write(rsaKeyData, 0, rsaKeyLength);

        byte[] bytesDataLength = intToByte4(encDataLength);
        bos.write(bytesDataLength, 0, bytesDataLength.length);
        bos.write(encData, 0, encDataLength);

        return bos.toByteArray();
    }

    public byte[] decrypt(String encData) {
        return decrypt(base64Decode(encData));
    }

    public byte[] decrypt(byte[] data) {
        if (data == null || data.length == 0) {
            return null;
        }
        ByteArrayInputStream input = new ByteArrayInputStream(data);
        // key size
        byte[] bytesKeyLength = new byte[4];
        input.read(bytesKeyLength, 0, 4);
        int keyLength = byte4ToInt(bytesKeyLength, 0);
        // key bytes
        byte[] rsaKeyData = new byte[keyLength];
        input.read(rsaKeyData, 0, keyLength);

        // data size
        byte[] bytesDataLength = new byte[4];
        input.read(bytesDataLength, 0, 4);
        int dataLen = byte4ToInt(bytesDataLength, 0);
        // data
        byte[] bytesData = new byte[dataLen];
        input.read(bytesData, 0, dataLen);

        // 解密
        byte[] rndKeyData = rsaTemplate(rsaKeyData, false);
        byte[] encData = symmetricTemplate(bytesData, rndKeyData, "AES", encPadding, null, false);

        return encData;
    }

    public static byte[] intToByte4(int i) {
        byte[] targets = new byte[4];
        targets[3] = (byte) (i & 0xFF);
        targets[2] = (byte) (i >> 8 & 0xFF);
        targets[1] = (byte) (i >> 16 & 0xFF);
        targets[0] = (byte) (i >> 24 & 0xFF);
        return targets;
    }

    public static int byte4ToInt(byte[] bytes, int off) {
        int b0 = bytes[off] & 0xFF;
        int b1 = bytes[off + 1] & 0xFF;
        int b2 = bytes[off + 2] & 0xFF;
        int b3 = bytes[off + 3] & 0xFF;
        return (b0 << 24) | (b1 << 16) | (b2 << 8) | b3;
    }

    public static byte[] base64Decode(final String input) {
        if (input == null || input.length() == 0) {
            return new byte[0];
        }
        return Base64.decode(input);
    }

    public static byte[] base64Decode(final byte[] input) {
        if (input == null || input.length == 0) {
            return new byte[0];
        }
        return Base64.decode(input);
    }

    public static String base64Encode2String(final byte[] input) {
        if (input == null || input.length == 0) {
            return "";
        }
        return Base64.encodeToString(input);
    }

    public static byte[] encryptMD5(final byte[] data) {
        return hashTemplate(data, "MD5");
    }

    private static byte[] hashTemplate(final byte[] data, final String algorithm) {
        if (data == null || data.length <= 0) {
            return null;
        }
        try {
            MessageDigest md = MessageDigest.getInstance(algorithm);
            md.update(data);
            return md.digest();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] rsaTemplate(final byte[] data, final boolean isEncrypt) {
        if (data == null || data.length == 0) {
            return null;
        }
        try {
            if (rsaKey == null) {
                return null;
            }
            Cipher cipher = Cipher.getInstance(rsaPadding);
            cipher.init(isEncrypt ? Cipher.ENCRYPT_MODE : Cipher.DECRYPT_MODE, rsaKey);
            int len = data.length;
            int maxLen = isEncrypt ? 117 : 128;
            int count = len / maxLen;
            if (count > 0) {
                byte[] ret = new byte[0];
                byte[] buff = new byte[maxLen];
                int index = 0;
                for (int i = 0; i < count; i++) {
                    System.arraycopy(data, index, buff, 0, maxLen);
                    ret = joins(ret, cipher.doFinal(buff));
                    index += maxLen;
                }
                if (index != len) {
                    int restLen = len - index;
                    buff = new byte[restLen];
                    System.arraycopy(data, index, buff, 0, restLen);
                    ret = joins(ret, cipher.doFinal(buff));
                }
                return ret;
            } else {
                return cipher.doFinal(data);
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static byte[] symmetricTemplate(final byte[] data, final byte[] key, final String algorithm,
                                            final String transformation, final byte[] iv, final boolean isEncrypt) {
        if (data == null || data.length == 0 || key == null || key.length == 0) {
            return null;
        }
        try {
            SecretKey secretKey;
            if ("DES".equals(algorithm)) {
                DESKeySpec desKey = new DESKeySpec(key);
                SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(algorithm);
                secretKey = keyFactory.generateSecret(desKey);
            } else {
                secretKey = new SecretKeySpec(key, algorithm);
            }
            Cipher cipher = Cipher.getInstance(transformation);
            if (iv == null || iv.length == 0) {
                cipher.init(isEncrypt ? Cipher.ENCRYPT_MODE : Cipher.DECRYPT_MODE, secretKey);
            } else {
                AlgorithmParameterSpec params = new IvParameterSpec(iv);
                cipher.init(isEncrypt ? Cipher.ENCRYPT_MODE : Cipher.DECRYPT_MODE, secretKey, params);
            }
            return cipher.doFinal(data);
        } catch (Throwable e) {
            e.printStackTrace();
            return null;
        }
    }

    private static byte[] joins(final byte[] prefix, final byte[] suffix) {
        byte[] ret = new byte[prefix.length + suffix.length];
        System.arraycopy(prefix, 0, ret, 0, prefix.length);
        System.arraycopy(suffix, 0, ret, prefix.length, suffix.length);
        return ret;
    }

    /**
     * 工具测试
     */
    public static void main(String[] args) {
        String msg = "{" + "\"idCard\":\"320924199103262114\"," + "  \"password\":\"123456\"," +
                "\"phone\":\"15177198241\"," + "\"userType\":1," + "  \"verifyCode\":123456" + "}";
//        String msg="{"+"\"idCard\":\"320924199103262114\"," + "\"password\":\"123456\","+
//                "phone\":\"15177198241\"," + "\"userType\":1," + "\"verifyCode\":123456"+"}";
        String pubKeyNet =
                "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC03qfFOqswlKDo+wOXu4sUb+tUJKQkP7pkvvSgHFShDBEXDwnKZnj/3+HogloQANNzNs6WQOfzq1vgYXpuodRg8Xt6c6KxvUO4LmKwoo12o4k7KZ1JHDfkSXukqmiSGmwvh4BA4LBbHSRvFLcjB6/I7Rs6po/gh7UOKhWftxIBDQIDAQAB";
        String priKeyNet =
                "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALTep8U6qzCUoOj7A5e7ixRv61QkpCQ/umS+9KAcVKEMERcPCcpmeP/f4eiCWhAA03M2zpZA5/OrW+Bhem6h1GDxe3pzorG9Q7guYrCijXajiTspnUkcN+RJe6SqaJIabC+HgEDgsFsdJG8UtyMHr8jtGzqmj+CHtQ4qFZ+3EgENAgMBAAECgYAEDSi85j+Hawzfqx+9eln3LzqaO+fhV/wY3Z4lJ/1NTjPjzFZvzjPPp3gr+R+DVEFoR0YBX5rSfngkYoqXh9B2AcxnzaGZk+LECRWJoCODgnIFAQ5yqEpYcfJfA3+zueJxOw5YgPdr85Noepfu/olKNK0OCFbceHbypsF3LkK+kQJBAOEPATxofAFiImU62dubDBRRSuzJPheIqfv/e3s7QVf7BQ5TfS9NjhREZocxA8xdCkHhG6HJ+A81QEFUlSxHw5MCQQDNvGmDtoLnEbrILwoadDixIbaAlgLeJPwrgvgHpAiirJycIEkLYfF7YncdJZViVhpm/w4IzXCcLPNHmaQM5UzfAkEAvHf2TwIopnfp2eAYxODokrMpDXXRe5/EyfU/EQmkROs/Zqnf8Zb+3lYRjjErvx5DErxSiYA7LXEoqA0PBw/p5QJAUWgYKDHzohL14Xgbe1Q5in1YhZDWGahwz5bHJd7WO+gpH+32eTaMItJXZ4UTkxGW6OJLX1hLEsEGknJM431n6QJABfPSer4SLAAWT0vd0enSuTMFMmnfG85PcdI6fJqLsOLyRdmTDS3M5tnEwjqxT9D2ep/01ABfxnQa/1xKW/zBYA==";
        try {
            String sm = "I m lgc";
// 公钥加密:
            CryptoData crypto = new CryptoData(pubKeyNet, true);
            byte[] encryptedData = crypto.encrypt(sm.getBytes());
            String encoded = Base64.encodeToString(encryptedData);
            System.out.println(encoded);
// 私钥解密：
            CryptoData crypto2 = new CryptoData(priKeyNet, false);
            byte[] orgData = crypto2.decrypt(encryptedData);
            System.out.println(new String(orgData));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
