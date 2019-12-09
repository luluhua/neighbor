package com.citysmart.ucenter.mybatis.model.app;

import java.util.Date;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * 用户登录设备记录
 * @author 刘贵成
 * @since 2019-06-21
 */
@TableName("t_app_user_login_client")
public class TAppUserLoginClient extends Model<TAppUserLoginClient> {

    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * app用户ID
     */
    private Integer userId;
    /**
     * APP用户gid
     */
    private String guid;
    /**
     * Android 客户端标识
     */
    private String clientId;
    /**
     * iso客户端标识
     */
    private String deviceToken;
    /**
     * 登录ip
     */
    private String loginIp;
    /**
     * 登录时间
     */
    @TableField(value = "loginTime", fill = FieldFill.INSERT)
    private Date loginTime;
    /**
     * app客户端操作系统版本
     */
    private String mobileSystemVersion;
    /**
     * app客户端手机型号
     */
    private String mobileModel;
    /**
     * app客户端类型 1 Android 2 ios
     */
    private String mobilePlatform;

    /**
     * 登录app版本
     */
    private String appVersion;
    private Integer packageName;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getDeviceToken() {
        return deviceToken;
    }

    public void setDeviceToken(String deviceToken) {
        this.deviceToken = deviceToken;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getMobileSystemVersion() {
        return mobileSystemVersion;
    }

    public void setMobileSystemVersion(String mobileSystemVersion) {
        this.mobileSystemVersion = mobileSystemVersion;
    }

    public String getMobileModel() {
        return mobileModel;
    }

    public void setMobileModel(String mobileModel) {
        this.mobileModel = mobileModel;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMobilePlatform() {
        return mobilePlatform;
    }

    public void setMobilePlatform(String mobilePlatform) {
        this.mobilePlatform = mobilePlatform;
    }

    public String getAppVersion() {
        return appVersion;
    }

    public void setAppVersion(String appVersion) {
        this.appVersion = appVersion;
    }

    public Integer getPackageName() {
        return packageName;
    }

    public void setPackageName(Integer packageName) {
        this.packageName = packageName;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }

    @Override
    public String toString() {
        return "TAppUserLoginClient{" +
        "userId=" + userId +
        ", guid=" + guid +
        ", clientId=" + clientId +
        ", deviceToken=" + deviceToken +
        ", loginIp=" + loginIp +
        ", loginTime=" + loginTime +
        ", mobileSystemVersion=" + mobileSystemVersion +
        ", mobileModel=" + mobileModel +
        ", mobilePlatform=" + mobilePlatform +
        ", appVersion=" + appVersion +
        "}";
    }
}
