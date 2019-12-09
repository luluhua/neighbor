package com.citysmart.ucenter.mybatis.model.oauth2;

import java.util.Date;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author ${author}
 * @since 2019-07-05
 */
@TableName("oauth_clients")
public class OauthClients extends Model<OauthClients> {

    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.AUTO)
    private Integer id;
    /***
     * 对应APPID 提供给第三方应用方
     **/
    private String clientId;
    /***
     * 对应APPSecret (加密后)
     **/
    private String clientSecret;

    /***
     * 对应APPSecret 提供给第三方应用方(加密前)
     **/
    private String clientSecretPlaintext;
    /**
     *  授权资源ID
     **/
    private String resourceIds;
    /**
     *  授权资源
     **/
    private String resources;
    /**
     * 是否加密 1加密
     **/
    private Boolean isSecretRequired;
    private Boolean isScoped;
    /**
     *  授权范围
     **/
    private String scope;
    /**
     *  授权方式 refresh_token,authorization_code,password
     **/
    private String authorizedGrantTypes;
    /**
     *  第三方应用回调地址
     **/
    private String registeredRedirectUri;
    /***
     * 授权角色
     **/
    private String authorities;
    /**
     * 是否可自动授权 0 用户手机授权 1自动授权
     */
    private Boolean isAutoApprove;
    /**
     * accessToken 过期时间（单位：秒）
     */
    private Integer accessTokenValiditySeconds;
    /**
     * 刷新accessToken时间（单位：秒）
     */
    private Integer refreshTokenValiditySeconds;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date modifyTime;
    /**
     * 应用提供商（名称）
     */
    private String applicationProvider;


    @TableField("is_verify_domainName")
    private Boolean isVerifyDomainName;
    @TableField("is_verify_ip")
    private Boolean isVerifyIp;
    @TableField("request_ip")
    private String requestip;

    public String getClientSecretPlaintext() {
        return clientSecretPlaintext;
    }

    public void setClientSecretPlaintext(String clientSecretPlaintext) {
        this.clientSecretPlaintext = clientSecretPlaintext;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getResourceIds() {
        return resourceIds;
    }

    public void setResourceIds(String resourceIds) {
        this.resourceIds = resourceIds;
    }

    public Boolean getSecretRequired() {
        return isSecretRequired;
    }

    public void setSecretRequired(Boolean isSecretRequired) {
        this.isSecretRequired = isSecretRequired;
    }

    public String getClientSecret() {
        return clientSecret;
    }

    public void setClientSecret(String clientSecret) {
        this.clientSecret = clientSecret;
    }

    public Boolean getScoped() {
        return isScoped;
    }

    public void setScoped(Boolean isScoped) {
        this.isScoped = isScoped;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getAuthorizedGrantTypes() {
        return authorizedGrantTypes;
    }

    public void setAuthorizedGrantTypes(String authorizedGrantTypes) {
        this.authorizedGrantTypes = authorizedGrantTypes;
    }

    public String getRegisteredRedirectUri() {
        return registeredRedirectUri;
    }

    public void setRegisteredRedirectUri(String registeredRedirectUri) {
        this.registeredRedirectUri = registeredRedirectUri;
    }

    public String getAuthorities() {
        return authorities;
    }

    public void setAuthorities(String authorities) {
        this.authorities = authorities;
    }

    public Boolean getAutoApprove() {
        return isAutoApprove;
    }

    public void setAutoApprove(Boolean isAutoApprove) {
        this.isAutoApprove = isAutoApprove;
    }

    public Integer getAccessTokenValiditySeconds() {
        return accessTokenValiditySeconds;
    }

    public void setAccessTokenValiditySeconds(Integer accessTokenValiditySeconds) {
        this.accessTokenValiditySeconds = accessTokenValiditySeconds;
    }

    public Integer getRefreshTokenValiditySeconds() {
        return refreshTokenValiditySeconds;
    }

    public void setRefreshTokenValiditySeconds(Integer refreshTokenValiditySeconds) {
        this.refreshTokenValiditySeconds = refreshTokenValiditySeconds;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getVerifyDomainName() {
        return isVerifyDomainName;
    }

    public void setVerifyDomainName(Boolean verifyDomainName) {
        isVerifyDomainName = verifyDomainName;
    }

    public Boolean getVerifyIp() {
        return isVerifyIp;
    }

    public void setVerifyIp(Boolean verifyIp) {
        isVerifyIp = verifyIp;
    }

    public String getRequestip() {
        return requestip;
    }

    public void setRequestip(String requestip) {
        this.requestip = requestip;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }

    public String getApplicationProvider() {
        return applicationProvider;
    }

    public void setApplicationProvider(String applicationProvider) {
        this.applicationProvider = applicationProvider;
    }

    public String getResources() {
        return resources;
    }

    public void setResources(String resources) {
        this.resources = resources;
    }

    @Override
    public String toString() {
        return "OauthClients{" +
        "clientId=" + clientId +
        ", resourceIds=" + resourceIds +
        ", isSecretRequired=" + isSecretRequired +
        ", clientSecret=" + clientSecret +
        ", isScoped=" + isScoped +
        ", scope=" + scope +
        ", authorizedGrantTypes=" + authorizedGrantTypes +
        ", registeredRedirectUri=" + registeredRedirectUri +
        ", authorities=" + authorities +
        ", isAutoApprove=" + isAutoApprove +
        ", accessTokenValiditySeconds=" + accessTokenValiditySeconds +
        ", refreshTokenValiditySeconds=" + refreshTokenValiditySeconds +
        ", createTime=" + createTime +
        ", modifyTime=" + modifyTime +
        "}";
    }
}
