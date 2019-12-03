package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.citysmart.ucenter.mybatis._Model;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 第三方接口请求记录
 * </p>
 *
 * @author lub
 * @since 2019-04-03
 */
@Getter
@Setter
@TableName("t_third_interface_log")
public class TThirdInterfaceLog extends _Model<TThirdInterfaceLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 接口id
     */
    @TableField("interface_id")
    private Integer interfaceId;
    /**
     * 接口标识
     */
    @TableField("interface_code")
    private String interfaceCode;
    /**
     * 接口参数
     */
    @TableField("req_pam")
    private String reqPam;
    /**
     * 接口返回内容
     */
    @TableField("res_content")
    private String resContent;
    /**
     * 請求是否成功
     */
    @TableField("is_ok")
    private Integer isOk;
    /**
     * 第三方接口请求记录分組
     */
    @TableField("group_log")
    private String groupLog;
    /**
     * 调用者
     * */
    @TableField("u_id")
    private Integer uId;

    public TThirdInterfaceLog(){}
    public TThirdInterfaceLog(Integer interfaceId,String interfaceCode,String reqPam,String resContent,Integer isOk,String groupLog){
        this.interfaceId=interfaceId;
        this.interfaceCode=interfaceCode;
        this.reqPam=reqPam.trim();
        this.resContent=resContent.trim();
        this.isOk=isOk;
        this.groupLog=groupLog;
    }

    public TThirdInterfaceLog(Integer interfaceId,String interfaceCode,String reqPam,String resContent,Integer isOk){
        this.interfaceId=interfaceId;
        this.interfaceCode=interfaceCode;
        this.reqPam=reqPam.trim();
        this.resContent=resContent.trim();
        this.isOk=isOk;
    }

    public TThirdInterfaceLog(Integer interfaceId,String interfaceCode,String reqPam,String resContent,Integer isOk,String groupLog,Integer uId){
        this.interfaceId=interfaceId;
        this.interfaceCode=interfaceCode;
        this.reqPam=reqPam.trim();
        this.resContent=resContent.trim();
        this.isOk=isOk;
        this.groupLog=groupLog;
        this.uId=uId;
    }
}
