package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * 消息
 *
 * @author Asion
 */
@Getter
@Setter
public class MessageVO implements Serializable {
    private static final long serialVersionUID = -6451812593150428369L;

    private String msgId;
    private String sendId;
    private String receiveId;
    private String content;
    private String time;
    private String type; // 1，用户发送的，2，用户接收的
    private String satus;//状态 0 未读，1已读


}
