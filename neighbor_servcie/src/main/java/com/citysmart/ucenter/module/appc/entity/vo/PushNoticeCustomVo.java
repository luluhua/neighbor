package com.citysmart.ucenter.module.appc.entity.vo;

import com.citysmart.ucenter.mybatis.enums.PushChannelEnum;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * <p>
 * 添加/编辑推送通知
 * </p>
 *
 * @author zhouyanjian
 * @Date 2019/7/2 9:15
 */
@Getter
@Setter
public class PushNoticeCustomVo {
    /**
     * Android 客户端 标识
     */
    private String clientId;
    /**
     * ios 客户端token
     */
    private String deviceToken;
    /**
     * 推送通道：jiguang（极光推送），javapns（ios原生推送）
     */
    private PushChannelEnum pushChannel;
    /**
     * 优先级：1~5，1最高
     */
    private Integer priority;
    /**
     * 当前重试次数：默认0，开始为1
     */
    private Integer retryCount;
    /**
     * 下次发送时间：默认创建时间
     */
    private Date nextSendTime;
    /**
     * 信息标题：最大50字符
     */
    private String msgTitle;
    /**
     * 消息文本
     */
    private String msgText;

    /**
     * 拓展参数
     */
    private String extrasJson;

    private Date createTime;
    private Date updateTime;

    private String actionId;
}
