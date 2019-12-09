package com.citysmart.ucenter.mybatis.entity.vo;

import com.baomidou.mybatisplus.annotations.TableField;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class TMsgRecordVo {

    public static Integer SEND_STATUS_OK = 1;
    public static Integer SEND_STATUS_ERROR = 2;
    public static Integer SEND_STATUS_UNSENT = 3;

    public static String DICT_TYPE_KEY="station_msg_type";
    public static String DICT_GROUP_KEY="station_msg_group";
    public  TMsgRecordVo(){}
    public  TMsgRecordVo(String msgTitle,String msgContent,Integer msgType,Integer msgGroup,String gid){
        this.msgContent=msgContent;
        this.msgTitle=msgTitle;
        this.msgType=msgType;
        this.msgGroup=msgGroup;
        this.sendTime=new Date();
        this.sendStatus=SEND_STATUS_OK;
        this.gid=gid;
    }

    private Integer msgType;
    private Integer msgGroup;
    private String msgTitle;
    private String msgContent;
    private Date sendTime;
    private Integer sendStatus;
    private String gid;

}
