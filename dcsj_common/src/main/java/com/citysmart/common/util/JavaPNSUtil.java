package com.citysmart.common.util;

import com.alibaba.fastjson.JSONException;
import javapns.Push;
import javapns.communication.exceptions.CommunicationException;
import javapns.communication.exceptions.KeystoreException;
import javapns.devices.Device;
import javapns.devices.exceptions.InvalidDeviceTokenFormatException;
import javapns.devices.implementations.basic.BasicDevice;
import javapns.notification.PushNotificationPayload;
import javapns.notification.PushedNotification;
import javapns.notification.ResponsePacket;
import javapns.notification.transmission.PushQueue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/***
 * @Author liuguicheng
 * @Description //TODO  ios 消息推送
 * @Date 19:31 2019/6/24
 **/
public class JavaPNSUtil {
//    /***
//     * @Author liuguicheng
//     * @Description //TODO  单条推送
//     * @Date 19:28 2019/6/24
//     * @Param
//     * @return
//     **/
    public static  void send(final String token,final String title, final Map<String,String> parmas, final Object keystore,final String password,final boolean production)
            throws Exception {
        PushNotificationPayload payload = PushNotificationPayload.complex();
        payload.addAlert(title);
        if(parmas!=null&&parmas.size()>0){
            for (Map.Entry<String,String> entry : parmas.entrySet()) {
                payload.addCustomDictionary(entry.getKey(),entry.getValue());
            }
        }
        List<PushedNotification> notifications = Push.payload(payload, keystore, password, production, token);
        for ( PushedNotification notification:notifications){
            if (notification.isSuccessful()) {
                ResponsePacket theErrorResponse = notification.getResponse();
                if (theErrorResponse != null && theErrorResponse.isValidErrorMessage()) {
                    throw new Exception("APNS服务器无法向iOS发送消息："+theErrorResponse.getMessage());
                }
            } else {
                throw new Exception("无法向APNS服务器发送消息:"+ notification.getException().getMessage());
            }
        }
    }
//
//    /***
//     * @Author liuguicheng
//     * @Description //TODO 定制消息内容推送 多线程
//     * @Date 11:46 2019/6/24
//     * @Param [devices 设备集合, title 推送标题, parmas 推送参数, keystore 证书, password 证书密码, production 生产或测试]
//     * @return void
//     **/
    public static  void sends(final List<Device> devices,final String title,final Map<String,String> parmas,final Object keystore, final String password, final boolean production)
            throws Exception {
        PushNotificationPayload payload = PushNotificationPayload.complex();
        payload.addAlert(title);
        if(parmas!=null&&parmas.size()>0){
            for (Map.Entry<String,String> entry : parmas.entrySet()) {
                payload.addCustomDictionary(entry.getKey(),entry.getValue());
            }
        }
        List<PushedNotification> notifications = Push.payload(payload, keystore, password, production, devices);
        for ( PushedNotification notification:notifications){
            if (notification.isSuccessful()) {
                ResponsePacket theErrorResponse = notification.getResponse();
                if (theErrorResponse != null && theErrorResponse.isValidErrorMessage()) {
                    throw new Exception("APNS服务器无法向iOS发送消息："+theErrorResponse.getMessage());
                }
            } else {
                throw new Exception("无法向APNS服务器发送消息:"+ notification.getException().getMessage());
            }
        }
    }
//    /***
//     * @Author liuguicheng
//     * @Description //TODO  消息列表推送
//     * @Date 11:50 2019/6/24
//     * @Param [token 推送设备token, title 推送消息标题, keystore 证书, password 证书密码,  production 生产环境（是/否）]
//     * @return void
//     **/
    public static void send (final String token,final String title,final Object keystore,final String password,final boolean production)
            throws KeystoreException, InvalidDeviceTokenFormatException {
        PushNotificationPayload payload = PushNotificationPayload.alert(title);
        int threads = 30;
        PushQueue queue = Push.queue(keystore, password, production, threads);
        queue.start();
        queue.add(payload, token);
    }

    /***
     * @Author liuguicheng
     * @Description //TODO  檢測非活動设备（ios）
     * @Date 19:03 2019/6/24
     * @Param [keystore 证书, password 证书密码 ,production 是否生成环境]
     **/
    private static  List<Device> getFeedback(final String keystore, final String password, final boolean production)
            throws CommunicationException, KeystoreException {
        final List<Device> devices = Push.feedback(keystore, password, production);
        return devices;
    }


    public static  void main(String[] args) {
        try {
            String token = "0f48e90196e18a4bb467364d4dffe239d852301c674285320d006640a20b78a3";
            String pushIosCertificat = "D:\\ssqx\\APS_release.p12";
            String pushIosCertificatPassWord = "123456789";
            String title="测试消息,消息内容主体的详细,您有一条新的事项待处理,消息内容主体的详细,您有一条新的事项待处理;";
            List<Device> devices=new ArrayList<Device>();
            Device device=new BasicDevice();
            device.setToken(token);
            devices.add(device);
            Map<String,String> parmas=new HashMap<String,String>(2);
            parmas.put("key1","http://www.baidu.com");
            parmas.put("key2","123456");
            //多线程推送
            send(token,title,parmas,pushIosCertificat,pushIosCertificatPassWord,true);
            //检测非活动设备
//            final List<Device> devices2 = getFeedback(pushIosCertificat, pushIosCertificatPassWord,false);
//            for (final Device device2 : devices2) {
//                System.out.println("非活动设备：" + device2.getToken());
//            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (CommunicationException e) {
            e.printStackTrace();
        } catch (KeystoreException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
