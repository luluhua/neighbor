package com.citysmart.ucenter.mybatis.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.citysmart.ucenter.mybatis._Model;

import java.io.Serializable;

/**
 * <p>
 * app接口调用日志
 * </p>
 *
 * @author lub
 * @since 2019-04-04
 */
@TableName("t_app_api_log")
public class TAppApiLog extends _Model<TAppApiLog> {

    private static final long serialVersionUID = 1L;

    private String ip;
    private String title;
    /**
     * api路径
     */
    private String url;
    /**
     * 请求参数
     */
    private String parameter;
    /**
     * 耗时
     */
    private Long taking;
    /**
     * 成功标识 
     */
    @TableField("is_ok")
    private Integer isOk;
    /**
     * 来源
     */
    private Integer origin;

    /**
     * 客户端类型
     */
    @TableField("app_type")
    private Integer appType;

    private String clientId;
    private String deviceToken;
    private String mobileSystemVersion;
    private String mobileModel;
    private String appVersion;

    private String errmsg;
    private Integer packageName;

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }


    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getParameter() {
        return parameter;
    }

    public void setParameter(String parameter) {
        this.parameter = parameter;
    }

    public Long getTaking() {
        return taking;
    }

    public void setTaking(Long taking) {
        this.taking = taking;
    }

    public Integer getIsOk() {
        return isOk;
    }

    public void setIsOk(Integer isOk) {
        this.isOk = isOk;
    }

    public Integer getOrigin() {
        return origin;
    }

    public void setOrigin(Integer origin) {
        this.origin = origin;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getAppType() {
        return appType;
    }

    public void setAppType(Integer appType) {
        this.appType = appType;
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

    public String getAppVersion() {
        return appVersion;
    }

    public void setAppVersion(String appVersion) {
        this.appVersion = appVersion;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }

    public Integer getPackageName() {
        return packageName;
    }

    public void setPackageName(Integer packageName) {
        this.packageName = packageName;
    }

    @Override
    public String toString() {
        return "TAppApiLog{" + "ip='" + ip + '\'' + ", title='" + title + '\'' + ", url='" + url + '\'' +
                ", parameter='" + parameter + '\'' + ", taking=" + taking + ", isOk=" + isOk + ", origin=" + origin +
                ", appType=" + appType + ", clientId='" + clientId + '\'' + ", deviceToken='" + deviceToken + '\'' +
                ", mobileSystemVersion='" + mobileSystemVersion + '\'' + ", mobileModel='" + mobileModel + '\'' +
                ", appVersion='" + appVersion + '\'' + ", errmsg='" + errmsg + '\'' + ", packageName=" + packageName +
                '}';
    }
}
