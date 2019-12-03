package com.citysmart.common.component.jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.apache.tomcat.util.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * jwt加密
 * liuguicheng
 * 2019-03-10
 */
public class JWTUtil {
    private static  Logger logger = LoggerFactory.getLogger(JWTUtil.class);
    private final static String JWT_KEY="gid";
    /**
     * 校验token是否正确
     *
     * @param token  密钥
     * @param secret 用户的密码
     * @return 是否正确
     */
    public static boolean verify(String token, String username, String secret) {
        try {
            byte[] src = Base64.decodeBase64(token);
            Algorithm algorithm = Algorithm.HMAC256(secret);
            JWTVerifier verifier = JWT.require(algorithm).withClaim(JWT_KEY, username).build();
            verifier.verify(new String(src));
            return true;
        } catch (Exception exception) {
            return false;
        }
    }

    /**
     * 获得token中的信息无需secret解密也能获得
     *
     * @return token中包含的用户名
     */
    public static String getGid(String token) {
        try {
            byte[] src = Base64.decodeBase64(token);
            DecodedJWT jwt = JWT.decode(new String(src));
            return jwt.getClaim(JWT_KEY).asString();
        } catch (JWTDecodeException e) {
            return null;
        }
    }

    /**
     * 生成签名
     *
     * @param gid    用户唯一标识
     * @param secret      用户的密码
     * @param EXPIRE_TIME 过期时间
     * @return 加密的token
     */
    public static String sign(String gid, String secret, long EXPIRE_TIME) {
        try {

            Date date = new Date(System.currentTimeMillis() + EXPIRE_TIME);
            System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date) );
            Algorithm algorithm = Algorithm.HMAC256(secret);
            // 附带username信息
            String jwt= JWT.create().withClaim(JWT_KEY, gid).withIssuedAt(new Date()).withExpiresAt(date).sign(algorithm);
            return Base64.encodeBase64String(jwt.getBytes());
        } catch (Exception e) {
            return null;
        }
    }

    /**
     *  是否可以刷新token
     * @param refreshTime 单位为天
     * @return
     */
    public static boolean isRefreshTime(Long expirestAtTime,Long refreshTime) {
        //过期时间
        Calendar calendar2 = Calendar.getInstance();
        calendar2.setTime(new Date(getRefreshTime(expirestAtTime,refreshTime)));
//        logger.info("刷新："+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar2.getTime()));
        Calendar calendar3= Calendar.getInstance();
        calendar3.setTime(new Date(expirestAtTime));
//        logger.info("过期："+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar3.getTime()));
        Calendar calendar1 = Calendar.getInstance();
        calendar1.setTime(new Date());
//        logger.info("当前："+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar1.getTime()));
        if (calendar1.after(calendar2) && calendar1.before(calendar3)){
            return  true;
        }
        return false;
    }
    /**
     * 判断是否需要刷新TOKEN
     * @param issueAt token签发日期
     * @return 是否需要刷新TOKEN
     */
    public static boolean shouldTokenRefresh(Date issueAt,Long expire) {
            long issueTime =  issueAt.getTime()+expire;
            long nowTime = System.currentTimeMillis();
            if(nowTime>issueTime){return true;}
            return false;
    }
    /**
     * 获取刷新时间
     * refreshTime 单位为天
     */
    public static Long getRefreshTime(Long expirestAtTime,Long refreshTime) {
        //过期时间
        Calendar calendar2 = Calendar.getInstance();
        calendar2.setTime(new Date(expirestAtTime));
        return calendar2.getTimeInMillis() -refreshTime;
    }
    /**
     * 工具测试
     */
    public static void main(String[] args) {

        String token = JWTUtil.sign("123","123",60000*60*24*7);
//        logger.info("token=="+token);
//
//        String token="ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5Sm5hV1FpT2lKaU5qVmpNemhtWXpVNU16azBPV1kyT1ROaFpqVm1ZVFk1TkRVMFpUZzFNQ0lzSW1WNGNDSTZNVFUyTVRVME1qRTBNQ3dpYVdGMElqb3hOVFl4TlRReU1EYzVmUS5hdXhuQXJXMGpPUmpSOHA4V2VYeXZUekhMUmkzMTdHZGhfc0NVR25FSnU0";
        byte[] src = Base64.decodeBase64(token);
        DecodedJWT jwt = JWT.decode(new String(src));
//        logger.info("时间="+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(jwt.getIssuedAt()));
//        logger.info("过期时间="+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(jwt.getExpiresAt()));
//        long s=System.currentTimeMillis();
//        logger.info(String.valueOf(s));
//        logger.info(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(s)));
//        s=System.currentTimeMillis()+60*1000;
//        logger.info(String.valueOf(s));
//        logger.info(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(s)));
//        logger.info("刷新时间="+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(getRefreshTime(jwt.getExpiresAt().getTime(),7))));

//        logger.info("是否可刷新："+ isRefreshTime(jwt.getExpiresAt().getTime(),300000l));
        boolean shouldRefresh = JWTUtil.shouldTokenRefresh(jwt.getExpiresAt(), Long.valueOf(60480));
        logger.info("过期时间=" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(jwt.getExpiresAt()));
        logger.info("是否过期=" + shouldRefresh);
        if(shouldRefresh){
            logger.info("过期");
        }else{
            logger.info("未过期");
        }

    }
}
