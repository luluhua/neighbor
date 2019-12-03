package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.citysmart.ucenter.mybatis._Model;

/**
 * <p>
 * 
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_sys_user_log")
public class TSysUserLog extends _Model<TSysUserLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 用户名
     */
	@TableField("user_name")
	private String userName;
    /**
     * 登录类型（来源）1:app 2:web
     */
	@TableField("login_type")
	private Integer loginType;
    /**
     * 登录Ip（暂留）
     */
	@TableField("login_ip")
	private String loginIp;
    /**
     * 是否登录成功 1:登录成功 0:登录失败
     */
	@TableField("is_login_ok")
	private Integer isLoginOk;
    /**
     * 失败原因
     */
	@TableField("error_msg")
	private String errorMsg;





	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getLoginType() {
		return loginType;
	}

	public void setLoginType(Integer loginType) {
		this.loginType = loginType;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public Integer getIsLoginOk() {
		return isLoginOk;
	}

	public void setIsLoginOk(Integer isLoginOk) {
		this.isLoginOk = isLoginOk;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}



}
