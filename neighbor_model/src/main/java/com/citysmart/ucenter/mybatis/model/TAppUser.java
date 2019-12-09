package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.citysmart.ucenter.mybatis._Model;

import java.util.Date;

/**
 * <p>
 * app 注册用户信息表
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_app_user")
public class TAppUser extends _Model<TAppUser> {

    private static final long serialVersionUID = 1L;
	public static final int status_0 = 0;
	public static final int status_1 = 1;
    /**
     * 用户的GUID编号
     */
	@TableField("gid")
	private String gid;
    /**
     * （个人）身份证号码
     */
	@TableField("id_card")
	private String idCard;
	/**
	 * （企业）统一社会信用代码
	 */
	@TableField("social_credit_code")
	private String socialCreditCode;
    /**
     * 手机号码（个人）手机号码/(法人)手机号码
     */
	private String mobile;
    /**
     * 登录密码
     */
	private String password;
    /**
     * 用户类型 个人：1  企业：2
     */
	@TableField("user_type")
	private Integer userType;
    /**
     * 用户头像路径
     */
	private String avatar;
    /**
     * 0:未填写，1：男，2：女
     */
	private Integer gender;
    /**
     * 0:新用户 1：正常使用中
     */
	private Integer status;
    /**
     * 认证状态 0 :未认证 1:已认证
     */
	@TableField("auth_status")
	private Integer authStatus;
    /**
     * 登录次数
     */
	@TableField("login_count")
	private Integer loginCount;
    /**
     * 最后一次登录时间
     */
	@TableField("last_login_date")
	private Date lastLoginDate;
	/**
	 * 用户名
	 */
	@TableField("username")
	private  String username;
	/**
	 * 昵称
	 */
	@TableField("nickname")
	private String nickname;
	/**
	 * 加密盐
	 */
	private String salt;
	/**
	 * 账户类型
	 */
	@TableField("account_type")
	private Integer accountType;

	/***
	 * @Author liuguicheng
	 * @Description //TODO  分享码
	 **/
	@TableField("share_code")
	private String shareCode;

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getAuthStatus() {
		return authStatus;
	}

	public void setAuthStatus(Integer authStatus) {
		this.authStatus = authStatus;
	}

	public Integer getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(Integer loginCount) {
		this.loginCount = loginCount;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public String getSocialCreditCode() {
		return socialCreditCode;
	}

	public void setSocialCreditCode(String socialCreditCode) {
		this.socialCreditCode = socialCreditCode;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public Integer getAccountType() {
		return accountType;
	}

	public void setAccountType(Integer accountType) {
		this.accountType = accountType;
	}

	public String getShareCode() {
		return shareCode;
	}

	public void setShareCode(String shareCode) {
		this.shareCode = shareCode;
	}
}
