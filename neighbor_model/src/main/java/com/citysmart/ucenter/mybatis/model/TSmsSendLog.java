package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.citysmart.ucenter.mybatis._Model;

import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_sms_send_log")
public class TSmsSendLog extends _Model<TSmsSendLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 短信类型(备注：区分验证码短信、其他业务短信)
     */
	@TableField("sms_type")
	private Integer smsType;
    /**
     * 发送时间
     */
	@TableField("send_time")
	private Date sendTime;
    /**
     * 发送内容
     */
	@TableField("send_context")
	private String sendContext;
    /**
     * 接收手机号码
     */
	@TableField("receive_phone")
	private String receivePhone;
    /**
     * 发送状态,0未验证 1已验证 -1 超时 2其他类型短信 -2删除
     */
	@TableField("send_status")
	private Integer sendStatus;
    /**
     * 短信接口返回信息
     */
	@TableField("return_msg")
	private String returnMsg;



	public Integer getSmsType() {
		return smsType;
	}

	public void setSmsType(Integer smsType) {
		this.smsType = smsType;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public String getSendContext() {
		return sendContext;
	}

	public void setSendContext(String sendContext) {
		this.sendContext = sendContext;
	}

	public String getReceivePhone() {
		return receivePhone;
	}

	public void setReceivePhone(String receivePhone) {
		this.receivePhone = receivePhone;
	}

	public Integer getSendStatus() {
		return sendStatus;
	}

	public void setSendStatus(Integer sendStatus) {
		this.sendStatus = sendStatus;
	}

	public String getReturnMsg() {
		return returnMsg;
	}

	public void setReturnMsg(String returnMsg) {
		this.returnMsg = returnMsg;
	}



}
