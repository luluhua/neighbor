package com.citysmart.ucenter.common.util;
//
//import cn.jiguang.common.ClientConfig;
//import cn.jiguang.common.resp.APIConnectionException;
//import cn.jiguang.common.resp.APIRequestException;
//import cn.jpush.api.JPushClient;
//import cn.jpush.api.push.PushResult;
//import cn.jpush.api.push.model.*;
//import cn.jpush.api.push.model.audience.Audience;
//import cn.jpush.api.push.model.notification.AndroidNotification;
//import cn.jpush.api.push.model.notification.IosNotification;
//import cn.jpush.api.push.model.notification.Notification;
//import com.alibaba.fastjson.JSONObject;
//import com.citysmart.common.json.JsonFailResult;
//import com.citysmart.common.json.JsonResult;
//import com.citysmart.common.json.JsonSuccessResult;
//import com.citysmart.common.json.JsonUtil;
//import com.citysmart.ucenter.module.system.service.JPushSendLogService;
//import com.citysmart.ucenter.mybatis.enums.JPushMsgPlatform;
//import com.citysmart.ucenter.mybatis.model.jpush.JPushSendLog;
//import com.google.gson.JsonObject;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//import java.util.*;
//
//
///**
// * 极光推送工具类
// * nonghg 20190424
// */
//public class JpushUtil {
//    private static final Logger logger = LoggerFactory.getLogger(JpushUtil.class);
//    private static JPushSendLogService jPushSendLogService = SpringUtil.getBean(JPushSendLogService.class);
//    private static ClientConfig clientConfig = ClientConfig.getInstance();
//
//    private static String appKey = RedisUtil.getValueByKey("jgpush.app.id");
//    private static String masterSecret = RedisUtil.getValueByKey("jgpush.app.secret");
//    private String Authorization = (appKey + ":" + masterSecret);
//
//    private static JPushClient jpushClient = new JPushClient(masterSecret, appKey);
//
//
//    /**
//     * 极光推送消息至 全部平台 全部设备
//     *
//     * @param msg
//     * @return
//     */
//    public static JsonResult PushMessageToAll(String msg, String title) {
//        PushPayload payload = PushPayload.messageAll(msg);
//        JsonResult jsonResult = JpushUtil.PushMessageByPushPayload(1, 0, msg, title, "all", "", "", payload);
//        return jsonResult;
//    }
//
//    /**
//     * 推送到Android
//     *
//     * @param msg           消息内容
//     * @param title         消息标题
//     * @param audience_type 推送对象类型:all=全部 tag=标签 tag_and=标签且 tag_not=标签并集的补集 alias=别名 registration_id=用户分组
//     * @return
//     * @send_time 推送次数
//     * @send_id t_jpush_send.ID
//     * @audiences 推送对象
//     */
//    public static JsonResult PushMessageToAndroid(int send_time, int send_id, String msg, String title, String audience_type, String audiences, Map msg_map) {
//        JsonResult jsonResult = new JsonSuccessResult();
//        Audience audience = Audience.all();
//        if (null == audience_type || "all".equals(audience_type)) {
//            audience = Audience.all();
//        } else {
//            if ("".equals(audiences)) {
//                audience = Audience.all();
//            }
//            if ("tag".equals(audience_type)) {
//                audience = Audience.tag(audiences);
//            }
//            if ("tag_and".equals(audience_type)) {
//                audience = Audience.tag_and(audiences);
//            }
//            if ("tag_not".equals(audience_type)) {
//                audience = Audience.tag_not(audiences);
//            }
//            if ("alias".equals(audience_type)) {
//                audience = Audience.alias(audiences);
//            }
//            if ("registration_id".equals(audience_type)) {
//                audience = Audience.registrationId(audiences);
//            }
//        }
//        PushPayload payload = null;
//        try {
//            payload = PushPayload.newBuilder().setPlatform(Platform.android())
//                    .setAudience(audience)
//                    .setNotification(Notification.android(msg, title, msg_map))
//                    .setOptions(Options.newBuilder().setApnsProduction(true).build())
//                    .setMessage(Message.newBuilder().setMsgContent(msg)
//                            .setTitle(title)
//                            .build())
//                    .build();
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new JsonFailResult("构建推送对象异常！" + e);
//        }
//        jsonResult = JpushUtil.PushMessageByPushPayload(send_time, send_id, msg, title, JPushMsgPlatform.android + "", audience_type, audiences, payload);
//        return jsonResult;
//    }
//
//    /**
//     * 推送至iOS
//     *
//     * @param msg           消息内容
//     * @param title         消息标题
//     * @param audience_type 推送对象类型:all=全部 tag=标签 tag_and=标签且 tag_not=标签并集的补集 alias=别名 registration_id=用户分组
//     * @return
//     * @send_time 推送次数
//     * * @send_time   推送次数
//     * @send_id t_jpush_send.ID
//     */
//    public static JsonResult PushMessageToIOS(int send_time, int send_id, String msg, String title, String audience_type, String audiences, Map map) {
//        JsonResult jsonResult = new JsonSuccessResult();
//        Audience audience = Audience.all();
//        if (null == audience_type || "all".equals(audience_type)) {
//            audience = Audience.all();
//        } else {
//            if ("".equals(audiences)) {
//                audience = Audience.all();
//            }
//            if ("tag".equals(audience_type)) {
//                audience = Audience.tag(audiences);
//            }
//            if ("tag_and".equals(audience_type)) {
//                audience = Audience.tag_and(audiences);
//            }
//            if ("tag_not".equals(audience_type)) {
//                audience = Audience.tag_not(audiences);
//            }
//            if ("alias".equals(audience_type)) {
//                audience = Audience.alias(audiences);
//            }
//            if ("registration_id".equals(audience_type)) {
//                audience = Audience.registrationId(audiences);
//            }
//        }
//        PushPayload payload = PushPayload.newBuilder()
//                //指定要推送的平台，all代表当前应用配置了的所有平台，也可以传android等具体平台
//                .setPlatform(Platform.ios())
//                //指定推送的接收对象，all代表所有人，也可以指定已经设置成功的tag或alias或该应应用客户端调用接口获取到的registration id
//                .setAudience(audience)
//                //jpush的通知，android的由jpush直接下发，iOS的由apns服务器下发，Winphone的由mpns下发
//                .setNotification(Notification.newBuilder()
//                        //指定当前推送的android通知
//                        .addPlatformNotification(IosNotification.newBuilder()
//                                //传一个IosAlert对象，指定apns title、title、subtitle等
//                                .setAlert(msg)
//                                //直接传alert
//                                //此项是指定此推送的badge自动加1
//                                .incrBadge(1)
//                                //此字段的值default表示系统默认声音；传sound.caf表示此推送以项目里面打包的sound.caf声音来提醒，
//                                // 如果系统没有此音频则以系统默认声音提醒；此字段如果传空字符串，iOS9及以上的系统是无声音提醒，以下的系统是默认声音
//                                .setSound("default")
//                                //此字段为透传字段，不会显示在通知栏。用户可以通过此字段来做一些定制需求，如特定的key传要指定跳转的页面（value）
//                                .addExtras(map)
//                                //此项说明此推送是一个background推送，想了解background看：http://docs.jpush.io/client/ios_tutorials/#ios-7-background-remote-notification
//                                // .setContentAvailable(true)
//                                .build())
//                        .build()
//                )
//                //Platform指定了哪些平台就会像指定平台中符合推送条件的设备进行推送。 jpush的自定义消息，
//                // sdk默认不做任何处理，不会有通知提示。建议看文档http://docs.jpush.io/guideline/faq/的
//                // [通知与自定义消息有什么区别？]了解通知和自定义消息的区别
//                .setMessage(Message.newBuilder()
//                        .setMsgContent(msg)
//                        .setTitle("")
//                        .addExtra("message extras key", "无拓展字段")
//                        .build())
//
//                .setOptions(Options.newBuilder()
//                        //此字段的值是用来指定本推送要推送的apns环境，false表示开发，true表示生产；对android和自定义消息无意义
//                        .setApnsProduction(true)
//                        //此字段是给开发者自己给推送编号，方便推送者分辨推送记录
//                        .setSendno(1)
//                        //此字段的值是用来指定本推送的离线保存时长，如果不传此字段则默认保存一天，最多指定保留十天，单位为秒
//                        .setTimeToLive(86400)
//                        .build())
//                .build();
//
//        jsonResult = JpushUtil.PushMessageByPushPayload(send_time, send_id, msg, title, JPushMsgPlatform.ios + "", audience_type, audiences, payload);
//        return jsonResult;
//    }
//
//    /**
//     * 同时推送iOS和Android
//     * 推送到Android
//     *
//     * @param msg           消息内容
//     * @param title         消息标题
//     * @param audience_type 推送对象类型:all=全部 tag=标签 tag_and=标签且 tag_not=标签并集的补集 alias=别名 registration_id=用户分组
//     * @send_id t_jpush_send.ID
//     * @audiences 推送对象
//     */
//    public static JsonResult PushMessageToIOSAndAndroid(int send_time, int send_id, String msg, String title, String audience_type, String audiences, Map<String, String> map) {
//        JsonResult jsonResult;
//        Audience audience = Audience.all();
//        if (null == audience_type || "all".equals(audience_type)) {
//            audience = Audience.all();
//        } else {
//            if ("".equals(audiences)) {
//                audience = Audience.all();
//            }
//            if ("tag".equals(audience_type)) {
//                audience = Audience.tag(audiences);
//            }
//            if ("tag_and".equals(audience_type)) {
//                audience = Audience.tag_and(audiences);
//            }
//            if ("tag_not".equals(audience_type)) {
//                audience = Audience.tag_not(audiences);
//            }
//            if ("alias".equals(audience_type)) {
//                audience = Audience.alias(audiences);
//            }
//            if ("registration_id".equals(audience_type)) {
//                audience = Audience.registrationId(audiences);
//            }
//        }
//        PushPayload payload = null;
//        try {
//            payload = PushPayload.newBuilder()
//                    .setPlatform(Platform.android_ios())
//                    .setAudience(audience)
//                    .setMessage(Message.newBuilder()
//                            .setMsgContent(msg)
//                            .setTitle(title)
//                            .build())
//                    .setNotification(Notification.newBuilder()
//                            .addPlatformNotification(AndroidNotification.newBuilder()
//                                    .addExtras(map)
//                                    .setAlert(title)
//                                    .build())
//                            .addPlatformNotification(
//                                    IosNotification.newBuilder()
//                                            .setSound("default")
//                                            .setBadge(1)
//                                            .setAlert(title)
//                                            .addExtras(map)
//                                            .build())
//
//                            .build()).build();
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new JsonFailResult("构建推送对象出错！" + e);
//        }
//        jsonResult = JpushUtil.PushMessageByPushPayload(send_time, send_id, msg, title, JPushMsgPlatform.android_and_ios + "", audience_type, audiences, payload);
//        return jsonResult;
//    }
//
//
//    /**
//     * 推送
//     *
//     * @param msg
//     * @param payload 推送对象
//     * @return
//     */
//    private static JsonResult PushMessageByPushPayload(int send_time, int send_id, String msg, String msg_title, String platform, String audience_type, String audience, PushPayload payload) {
//        JsonResult jsonResult = new JsonSuccessResult();
//        JPushSendLog jPushSendLog = new JPushSendLog();
//        jPushSendLog.setIsDeleted(0);
//        jPushSendLog.setSendId(send_id);
//        jPushSendLog.setPlatform(platform);
//        jPushSendLog.setAudience(audience);
//        jPushSendLog.setAudienceType(audience_type);
//        jPushSendLog.setMessage(msg);
//        jPushSendLog.setSendTime(new Date());
//        jPushSendLog.setMessageTitle(msg_title);
//        try {
//            PushResult pushResult = jpushClient.sendPush(payload);
//            jPushSendLog.setReturnMsgAll(pushResult.toString());
//            jPushSendLog.setReturnMsgId(pushResult.msg_id + "");
//            jPushSendLog.setReturnSendno(pushResult.sendno + "");
//            jPushSendLog.setReturnStatusCode(pushResult.statusCode);
//            if (pushResult.statusCode != 0) {
//                if (send_time < 5) {
//                    jsonResult = new JsonFailResult("极光推送异常！", pushResult.error);
//
//                } else {
//                    jsonResult = new JsonFailResult(pushResult.sendno);
//                }
//            }
//
//        } catch (APIConnectionException e) {
//            e.printStackTrace();
//            jPushSendLog.setReturnMsgAll("超时时间：" + e.getDoneRetriedTimes() + ",是否超时:" + e.isReadTimedout() + ",信息:" + e.getMessage());
//            if (send_time < 5) {
//                jsonResult = new JsonFailResult("极光推送异常！", e.getStackTrace());
//            }
//        } catch (APIRequestException e) {
//            logger.info("机关推送异常(send_id=" + send_id + ")：" + e);
////            e.printStackTrace();
//            jPushSendLog.setReturnMsgId(e.getMsgId() + "");
//            jPushSendLog.setReturnMsgAll(e.getErrorMessage());
//            jPushSendLog.setReturnStatusCode(e.getErrorCode());
//            if (send_time < 5) {
//                jsonResult = new JsonFailResult("极光推送异常！", e.getStackTrace());
//            }
//        } finally {
//            jPushSendLogService.insert(jPushSendLog);
////            Thread.sleep(5000);
//            // 请求结束后，调用 NettyHttpClient 中的 close 方法，否则进程不会退出。
//            jpushClient.close();
//        }
//        return jsonResult;
//    }
//
//
//    public static boolean isJson(String content) {
//        try {
//            JSONObject jsonStr = JSONObject.parseObject(content);
//            return true;
//        } catch (Exception e) {
//            return false;
//        }
//    }
//
//    public static void main(String[] args) {
//    }
//
//
//}
