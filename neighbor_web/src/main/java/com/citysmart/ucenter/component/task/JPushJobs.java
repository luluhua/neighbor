package com.citysmart.ucenter.component.task;
//
//import com.citysmart.ucenter.component.jpush.JPushTask;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.boot.context.properties.ConfigurationProperties;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//import javax.swing.*;
//
//
///**
// * 极光推送监听 30s推送一次
// * nonghg 2019-4-25
// */
//@Component
//public class JPushJobs {
//    private static final Logger logger = LoggerFactory.getLogger(JPushJobs.class);
//
//    @Value("${spring.profiles.active}")
//    public  String active;
//
//    @Scheduled(fixedDelay=30000)
//    public void doJPushTask(){
////        logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>推送消息"+("pro".equals(active)?"正式环境":"开发环境")+"启动中......");
//        JPushTask jPushTask=JPushTask.getInstance();
//        jPushTask.DoJPushTask(active);
//    //        if("dev".equals(active)){
//    //            logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>推送消息结束......");
//    //        }
//    }
//
//}
