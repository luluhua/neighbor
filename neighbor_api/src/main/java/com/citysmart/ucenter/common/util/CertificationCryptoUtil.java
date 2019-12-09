package com.citysmart.ucenter.common.util;

import org.apache.commons.codec.digest.DigestUtils;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;
import java.io.UnsupportedEncodingException;
import java.security.Security;
import java.security.spec.AlgorithmParameterSpec;
import java.security.Key;

public class CertificationCryptoUtil {
    private final byte[] DESkey = getASCIIMD5Sgin(AuthIDCardUtil2.sKey);
    private final byte[] DESIV = getASCIIMD5Sgin(AuthIDCardUtil2.sKey);

    // 加密算法的参数接口，IvParameterSpec是它的一个实现
    private AlgorithmParameterSpec iv = null;
    private Key key = null;

    public CertificationCryptoUtil() throws Exception {
        // 设置密钥参数
        DESKeySpec keySpec = new DESKeySpec(DESkey);
        // 设置向量
        iv = new IvParameterSpec(DESIV);
        // 获得密钥工厂
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        // 得到密钥对象
        key = keyFactory.generateSecret(keySpec);
//        Security.addProvider(new BouncyCastleProvider());

    }
    /***
     * @Author liuguicheng
     * @Description //TODO 加密 返回16进制字符串
     * @Date 15:16 2019/8/20
     **/
    public String encode(String data) throws Exception {
        //转字节 编码为gb2312
        byte[] par=data.getBytes("utf-8");
        // 得到加密对象Cipher
        Cipher enCipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
        // 设置工作模式为加密模式，给出密钥和向量
//        System.out.println("DESkey 16进制:"+bytesToHexString(DESkey));
//        System.out.println("DESIV 16进制:"+bytesToHexString(DESIV));
        enCipher.init(Cipher.ENCRYPT_MODE, key, iv);
        byte[] pasByte = enCipher.doFinal(par);
        return bytesToHexString(pasByte);
    }
    /***
     * @Author liuguicheng
     * @Description //TODO 解密
     * @Date 15:16 2019/8/20
     **/
    public String decode(String data) throws Exception {
        byte[] pa=hexToByteArray(data);
        Cipher deCipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
        deCipher.init(Cipher.DECRYPT_MODE, key, iv);
        byte[] pasByte = deCipher.doFinal(pa);
        return new String(pasByte, "GB2312");
    }


    /***
     * @Author liuguicheng
     * @Description //TODO ascii编号 MD5 加密
     * @Date 15:13 2019/8/20
     **/
    private static byte[] getASCIIMD5Sgin(String text){
//        System.out.println(text+" md5:"+DigestUtils.md5Hex(text).toUpperCase());
//        System.out.println(text+" md5 16进制："+bytesToHexString(getContentBytes(DigestUtils.md5Hex(text).toUpperCase().substring(0,8),"ASCII")));
       return getContentBytes(DigestUtils.md5Hex(text).toUpperCase().substring(0,8),"ASCII");
    }
    private static byte[] getContentBytes(String content, String charset) {
        if (charset == null || "".equals(charset)) {
            return content.getBytes();
        }
        try {
            return content.getBytes(charset);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("MD5签名过程中出现错误,指定的编码集错误:" + charset);
        }
    }
    public static String pkcs7padding(String data) {
        int bs = 16;
        int padding = bs - (data.length() % bs);
        String padding_text = "";
        for (int i = 0; i < padding; i++) {
            padding_text += (char)padding;
        }
        return data+padding_text;
    }
    /***
     * @Author liuguicheng
     * @Description //TODO  字节转16进制
     * @Date 15:21 2019/8/20
     **/
    public static String bytesToHexString(byte[] src){
        StringBuilder stringBuilder = new StringBuilder("");
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString().toUpperCase();
    }
    /***
     * @Author liuguicheng
     * @Description //TODO 16 进制转 字节
     * @Date 15:27 2019/8/20
     **/
    public static byte hexToByte(String inHex){
        return (byte)Integer.parseInt(inHex,16);
    }
    public static byte[] hexToByteArray(String inHex){
        int hexlen = inHex.length();
        byte[] result;
        if (hexlen % 2 == 1){
            //奇数
            hexlen++;
            result = new byte[(hexlen/2)];
            inHex="0"+inHex;
        }else {
            //偶数
            result = new byte[(hexlen/2)];
        }
        int j=0;
        for (int i = 0; i < hexlen; i+=2){
            result[j]=hexToByte(inHex.substring(i,i+2));
            j++;
        }
        return result;
    }

//    public static String bytes2HexString(byte[] b) {
//        String ret = "";
//        for (int i = 0; i < b.length; i++) {
//            String hex = Integer.toHexString(b[i] & 0xFF);
//            if (hex.length() == 1) {
//                hex = "0" + hex;
//            }
//            ret += hex;
//        }
//        return ret;
//    }
//    public static String toHex(byte[] buffer) {
//        StringBuffer sb = new StringBuffer(buffer.length * 2);
//        for (int i = 0; i < buffer.length; i++) {
//            sb.append(Character.forDigit((buffer[i] & 240) >> 4, 16));
//            sb.append(Character.forDigit(buffer[i] & 15, 16));
//        }
//        return sb.toString();
//    }
    public static void main(String[] args) {
        try {
//            String idStr="{\"sText\":{\"parasInfo\":{\"pARAMETER\":\"{\\\"certifyID\\\":\\\"2b2fdeab-1e01-4a18-ad65-803adf851558\\\"}\",\"sBH\":\"OtherAuthIDCardInfo\",\"uSERID\":\"Third_shxqx\",\"uSERPWD\":\"shxqx\"}}}";
//            String str="aabb";
            //自定义密钥
            CertificationCryptoUtil des = new CertificationCryptoUtil();
//            System.out.println("加密前的字符："+idStr);
//            System.out.println("加密后的字符："+des.encode(str).toUpperCase());
//            System.out.println("解密后的字符："+des.decode(des.encode(str).toUpperCase()));

            String s="2102D78333A03C18E572D6A8EF0D9141425A0E9ACC337C1D4E41F5E551531556EDBE39C5350205CDAFBF060261F24BB56C4B2470D3D5CE493C9A664B7962F6B7";
//            String s="2C379422DDDA3925E828147047F560EBB4A77042AB635B74E6672E0BF495F2C44A322994A82F46574B833BDF8CB332835401F84D3A12E3827616D189C4993415E4FE82BA75A78579F988DF0577BE5B96471857AD8C81D6332D1DDEA06DE51E4554478E56CC7E18B351841A4EE2D3A5863EB142D167C8C4615697FF6D5AF5A1AC35130A1DAFF3A8C2710B762EA2E273BA7F5D979CAFEBDBF01B99EB837A1C64E210760C2A63CF503E";
            System.out.println("解密后的字符："+des.decode(s));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
