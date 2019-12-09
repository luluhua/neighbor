package com.citysmart.ucenter.mybatis.model.app;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 新用戶訪問记录相关信息表
 * </p>
 *
 * @author liuguicheng
 * @since 2019-09-02
 */
@TableName("t_app_user_sharedetail")
public class TAppUserSharedetail extends Model<TAppUserSharedetail> {

    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.AUTO)
    private String id;
    /**
     * 创建时间
     */
    @TableField("dt_create")
    private Date dtCreate;
    /**
     * 删除标识
     */
    @TableField("is_deleted")
    private Integer isDeleted;
    /**
     * 下载时间
     */
    @TableField("dt_download")
    private Date dtDownload;
    /**
     * 激活时间
     */
    @TableField("dt_activation")
    private Date dtActivation;
    /**
     * 浏览时间
     */
    @TableField("dt_browse")
    private Date dtBrowse;
    /**
     * 分享码
     */
    @TableField("share_code")
    private String shareCode;
    /**
     * 用户设备标识
     */
    private String equipmentToken;
    /***
     * @Author liuguicheng
     * @Description //TODO  手机号码 激活时才会存入
     * @Date 10:33 2019/10/22
     **/
    private String mobile;
    /**
     * app客户端操作系统版本
     */
    private String mobileSystemVersion;
    /**
     * app版本
     */
    private String appVersion;
    /**
     * app客户端手机型号
     */
    private String mobileModel;

    /**
     * app客户端类型 1 Android 2 ios
     */
    private String mobilePlatform;
    /**
     * 当前版本app客户端包名
     */
    private String packageName;
    /**
     * 客户端ip
     */
    private String clientIp;
    /**
     * 屏幕宽度
     */
    @TableField("screen_width")
    private Integer screenWidth;
    /**
     * 屏幕高度
     */
    @TableField("screen_height")
    private Integer screenHeight;
    /**
     * webgl版本
     */
    @TableField("webgl_version")
    private String webglVersion;
    private String context;
    /**
     * 浏览器版本
     */
    private String vendor;
    /**
     * Web版本
     */
    @TableField("webgl_sl_version")
    private String webglSlVersion;
    /**
     * 最大纹理尺寸
     */
    @TableField("max_texture_size")
    private Double maxTextureSize;
    /**
     * 显卡版本
     */
    private String renderer;

    /***
     * 验证类型 1分享码验证 2设备参数验证
     **/
    @TableField("verify_type")
    private Integer verifyType;
    /***
     * '验证状态 0未验证 1已验证
     **/
    @TableField("verify_state")
    private Integer verifyState;

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
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

    public Date getDtDownload() {
        return dtDownload;
    }

    public void setDtDownload(Date dtDownload) {
        this.dtDownload = dtDownload;
    }

    public Date getDtActivation() {
        return dtActivation;
    }

    public void setDtActivation(Date dtActivation) {
        this.dtActivation = dtActivation;
    }

    public Date getDtBrowse() {
        return dtBrowse;
    }

    public void setDtBrowse(Date dtBrowse) {
        this.dtBrowse = dtBrowse;
    }

    public String getShareCode() {
        return shareCode;
    }

    public void setShareCode(String shareCode) {
        this.shareCode = shareCode;
    }

    public String getEquipmentToken() {
        return equipmentToken;
    }

    public void setEquipmentToken(String equipmentToken) {
        this.equipmentToken = equipmentToken;
    }

    public String getMobileSystemVersion() {
        return mobileSystemVersion;
    }

    public void setMobileSystemVersion(String mobileSystemVersion) {
        this.mobileSystemVersion = mobileSystemVersion;
    }

    public String getAppVersion() {
        return appVersion;
    }

    public void setAppVersion(String appVersion) {
        this.appVersion = appVersion;
    }

    public String getMobileModel() {
        return mobileModel;
    }

    public void setMobileModel(String mobileModel) {
        this.mobileModel = mobileModel;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getClientIp() {
        return clientIp;
    }

    public void setClientIp(String clientIp) {
        this.clientIp = clientIp;
    }

    public Integer getScreenWidth() {
        return screenWidth;
    }

    public void setScreenWidth(Integer screenWidth) {
        this.screenWidth = screenWidth;
    }

    public Integer getScreenHeight() {
        return screenHeight;
    }

    public void setScreenHeight(Integer screenHeight) {
        this.screenHeight = screenHeight;
    }

    public String getWebglVersion() {
        return webglVersion;
    }

    public void setWebglVersion(String webglVersion) {
        this.webglVersion = webglVersion;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public String getWebglSlVersion() {
        return webglSlVersion;
    }

    public void setWebglSlVersion(String webglSlVersion) {
        this.webglSlVersion = webglSlVersion;
    }

    public Double getMaxTextureSize() {
        return maxTextureSize;
    }

    public void setMaxTextureSize(Double maxTextureSize) {
        this.maxTextureSize = maxTextureSize;
    }

    public String getRenderer() {
        return renderer;
    }

    public void setRenderer(String renderer) {
        this.renderer = renderer;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMobilePlatform() {
        return mobilePlatform;
    }

    public void setMobilePlatform(String mobilePlatform) {
        this.mobilePlatform = mobilePlatform;
    }

    public Integer getVerifyType() {
        return verifyType;
    }

    public void setVerifyType(Integer verifyType) {
        this.verifyType = verifyType;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }

    public Integer getVerifyState() {
        return verifyState;
    }

    public void setVerifyState(Integer verifyState) {
        this.verifyState = verifyState;
    }

    @Override
    public String toString() {
        return "TAppUserSharedetail{" +
        "dtCreate=" + dtCreate +
        ", isDeleted=" + isDeleted +
        ", dtDownload=" + dtDownload +
        ", dtActivation=" + dtActivation +
        ", dtBrowse=" + dtBrowse +
        ", shareCode=" + shareCode +
        ", equipmentToken=" + equipmentToken +
        ", mobileSystemVersion=" + mobileSystemVersion +
        ", appVersion=" + appVersion +
        ", mobileModel=" + mobileModel +
        ", packageName=" + packageName +
        ", clientIp=" + clientIp +
        ", screenWidth=" + screenWidth +
        ", screenHeight=" + screenHeight +
        ", webglVersion=" + webglVersion +
        ", context=" + context +
        ", vendor=" + vendor +
        ", webglSlVersion=" + webglSlVersion +
        ", maxTextureSize=" + maxTextureSize +
        ", renderer=" + renderer +
        "}";
    }
}
