package com.citysmart.ucenter.common.Util;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.json.JsonFailResult;
import com.citysmart.common.json.JsonResult;
import com.citysmart.common.json.JsonSuccessResult;
import com.citysmart.common.util.CommonUtil;
import com.citysmart.common.util.TimeUtil;
import com.citysmart.ucenter.module.system.service.ITSmsConfigService;
import com.citysmart.ucenter.module.system.service.ITSmsSendLogService;
import com.citysmart.ucenter.mybatis.model.TSmsConfig;
import com.citysmart.ucenter.mybatis.model.TSmsSendLog;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.lang3.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Date;

/**
 * @author li
 * @date 2019/12/10
 */
public class sendsmsrUtil {
    private static final Logger logger = LoggerFactory.getLogger(sendsmsrUtil.class);

    private static ITSmsConfigService smsConfigService = SpringUtil.getBean(ITSmsConfigService.class);
    private static ITSmsSendLogService smsSendLogService = SpringUtil.getBean(ITSmsSendLogService.class);
    private static final int QXQ_SMS_STATE = 32;

    public static String LOGIN_CODE = "login";
    public static String REGISTER_CODE = "register";
    public static String FORGET_PASSWORD_CODE = "forgetpassword";
    public static String UPDATE_PHONE_CODE = "updatephone";
    public static String EMAIL_CODE = "emailcode";

    public static TSmsConfig getTSmsConfig() {
        TSmsConfig smsConfig = smsConfigService.selectOne(new EntityWrapper<TSmsConfig>().eq("is_enabled", 0));
        return smsConfig;
    }

    /**
     * 验证->验证码是否正确
     *
     * @param phone 手机号码
     * @return ture 正确 false 不正确
     */
    public static boolean verify(String phone, String code, String typeCode) {
        String verificationCode = RedisUtil.getValueByPackageKey("smsCode." + typeCode, phone);
        logger.warn("验证码验证：验证码类型【" + typeCode + "】,输入验证码【" + code + "】,手机号码【" + phone + "】,redis 验证码【" + verificationCode + "】");
        if (StringUtils.isBlank(verificationCode)) {
            return false;
        }
        if (!code.equals(verificationCode)) {
            return false;
        }
        //验证成功后就删除缓存
        RedisUtil.delPackageKey("smsCode." + typeCode, phone);
        return true;
    }

    /**
     * 验证->验证码是否正确
     *
     * @param email 邮箱
     * @return ture 正确 false 不正确
     */
    public static boolean verifyEmailCode(String email, String code, String typeCode) {
        String verificationCode = RedisUtil.getValueByPackageKey("smsCode." + typeCode, email);
        logger.warn("验证码验证：验证码类型【" + typeCode + "】,输入验证码【" + code + "】,邮箱号码【" + email + "】,redis 验证码【" + verificationCode + "】");
        if (StringUtils.isBlank(verificationCode)) {
            return false;
        }
        if (!code.equals(verificationCode)) {
            return false;
        }
        //验证成功后就删除缓存
        RedisUtil.delPackageKey("smsCode." + typeCode, email);
        return true;
    }


    /**
     * HTTP接口发送短信
     * nonghg 2019-12-10
     *
     * @return
     */
    public static JsonResult sendMessageByHttp(TSmsConfig smsConfig, String phone, String smsType) {
        HttpClient client = new HttpClient();
        PostMethod method = new PostMethod(smsConfig.getSmsUrl());
        client.getParams().setContentCharset("GBK");
        method.setRequestHeader("ContentType", "application/x-www-form-urlencoded;charset=GBK");
        //六位随机数字
        String verificationCode = CommonUtil.randomNumber().toString();
        String smsTest = RedisUtil.getValueByKey("sms.test");
        //把验证码加入redis缓存
        String userRedispackagekey = RedisUtil.QINGXIU_PACKAGE_KEY + ".smsCode." + smsType + ":" + PWDStrongUtil.Encryption3DEs(phone);
        String verificationCodeTime = RedisUtil.getValueByKey("verification.Code.Time");
        long time_expire = 60;
        //获取剩余时间
        long restTime = JedisUtil.getInstance().new Keys().ttl(userRedispackagekey);//秒
        long existenceTime = Long.valueOf(TimeUtil.MillisecondToSecond(Integer.parseInt(verificationCodeTime)).toString()) - restTime;
        if (existenceTime == 0 || existenceTime >= time_expire) {
            RedisUtil.delPackageKey("smsCode", PWDStrongUtil.Encryption3DEs(phone));
            if ("true".equals(smsTest)) {
                JedisUtil.getInstance().new Strings().setEx(userRedispackagekey,
                        TimeUtil.MillisecondToSecond(Integer.parseInt(verificationCodeTime)),
                        verificationCode);
                int t = smsConfig.getSmsTemplate() / 60;
                String content = new String("欢迎您使用简单生活网，您的验证码是：" + verificationCode
                        + "。有效时间" + t + "分钟。安全提醒：验证码切勿向他人泄露，以防止上当受骗。如有疑问请咨询在线客服。");
                NameValuePair[] data = {//提交短信
                        new NameValuePair("account", smsConfig.getSmsAccount()),
                        new NameValuePair("password", smsConfig.getSmsPassword()),
                        new NameValuePair("mobile", phone),
                        new NameValuePair("content", content),
                };
                method.setRequestBody(data);
                try {
                    client.executeMethod(method);
                    String SubmitResult = method.getResponseBodyAsString();
                    Document doc = DocumentHelper.parseText(SubmitResult);
                    Element root = doc.getRootElement();
                    String code = root.elementText("code");
                    String msg = root.elementText("msg");
                    String smsid = root.elementText("smsid");
                    if ("2".equals(code)) {
                        //把验证码加入缓存
                        JedisUtil.getInstance().new Strings().setEx(userRedispackagekey,
                                TimeUtil.MillisecondToSecond(Integer.parseInt(verificationCodeTime)),
                                verificationCode);

                        addSendMessageLogInfo("您的验证码为：" + verificationCode, phone, "", smsType.toString());
                        logger.warn("验证码发送：验证码类型【验证码】,输入验证码【" + verificationCode + "】,手机号码【" + phone + "】,redis key【" + userRedispackagekey + "】");
                        return new JsonSuccessResult("发送成功", verificationCode);
                    } else {
                        return new JsonFailResult(msg);
                    }

                } catch (HttpException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (DocumentException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } finally {
                    // Release connection
                    method.releaseConnection();
                    //client.getConnectionManager().shutdown();
                }
            } else {
                return new JsonFailResult("已发送过短信");
            }
        }
        return new JsonFailResult("已发送过短信");
    }

    /**
     * 添加短信接口日志表
     *
     * @param message 发送的信息
     * @param phone   号码
     * @param rtvalue 返回值
     * @throws Exception
     */
    private static void addSendMessageLogInfo(String message, String phone, String rtvalue, String type) {
        String status = StringUtils.isBlank(rtvalue) ? "0" : rtvalue.split("&")[0].split("=")[1];
        Integer smstype = 0;
        if (LOGIN_CODE.equals(type)) {
            //登录
            smstype = 2;
        } else if (REGISTER_CODE.equals(type)) {
            //注册、修改密码
            smstype = 1;
        } else if (UPDATE_PHONE_CODE.equals(type)) {
            //修改手机号码
            smstype = 3;
        } else if (FORGET_PASSWORD_CODE.equals(type)) {
            //忘记密码
            smstype = 4;
        }
        TSmsSendLog smslog = new TSmsSendLog();
        smslog.setDtCreate(new Date());
        smslog.setReceivePhone(PWDStrongUtil.Encryption3DEs(phone));
        smslog.setReturnMsg(rtvalue);
        smslog.setSendContext(message);
        smslog.setSendTime(new Date());
        smslog.setSendStatus(Integer.valueOf(status));
        smslog.setSmsType(smstype);
        smslog.setIsDeleted(0);
        smsSendLogService.insert(smslog);
    }
}
