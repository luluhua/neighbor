package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * <p>
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_sms_config")
public class TSmsConfig extends Model<TSmsConfig> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 短信接口名称
     */
    @TableField("sms_title")
    private String smsTitle;
    /**
     * 短信接口请求地址
     */
    @TableField("sms_url")
    private String smsUrl;
    /**
     * 短信接口账号
     */
    @TableField("sms_account")
    private String smsAccount;
    /**
     * 短信接口账号密码
     */
    @TableField("sms_password")
    private String smsPassword;
    /**
     * 短信模版
     */
    @TableField("sms_template")
    private Integer smsTemplate;
    /**
     * 签名
     */
    @TableField("sms_sign")
    private String smsSign;
    /**
     * 是否启用,1:启用 0未启用
     */
    @TableField("is_enabled")
    private Integer isEnabled;
    /**
     * 创建日期
     */
    @TableField("dt_create")
    private Date dtCreate;
    /**
     * 是否删除 1:已删除 0：未删除
     */
    @TableField("is_deleted")
    private Integer isDeleted;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSmsTitle() {
        return smsTitle;
    }

    public void setSmsTitle(String smsTitle) {
        this.smsTitle = smsTitle;
    }

    public String getSmsUrl() {
        return smsUrl;
    }

    public void setSmsUrl(String smsUrl) {
        this.smsUrl = smsUrl;
    }

    public String getSmsAccount() {
        return smsAccount;
    }

    public void setSmsAccount(String smsAccount) {
        this.smsAccount = smsAccount;
    }

    public String getSmsPassword() {
        return smsPassword;
    }

    public void setSmsPassword(String smsPassword) {
        this.smsPassword = smsPassword;
    }

    public Integer getSmsTemplate() {
        return smsTemplate;
    }

    public void setSmsTemplate(Integer smsTemplate) {
        this.smsTemplate = smsTemplate;
    }

    public Integer getIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(Integer isEnabled) {
        this.isEnabled = isEnabled;
    }

    public Date getDtCreate() {
        return dtCreate;
    }

    public void setDtCreate(Date dtCreate) {
        this.dtCreate = dtCreate;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getSmsSign() {
        return smsSign;
    }

    public void setSmsSign(String smsSign) {
        this.smsSign = smsSign;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
