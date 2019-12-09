package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_sys_user_security")
public class TSysUserSecurity extends Model<TSysUserSecurity> {

    private static final long serialVersionUID = 1L;

    /**
     * 用户编号 sys_user.id
     */
	@TableField("user_id")
	private Integer userId;
    /**
     * 密码
     */
	private String password;
    /**
     * 预留多级密码
     */
	private String password2;
    /**
     * 预留多级密码
     */
	private String password3;

	private String salt;


	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getPassword3() {
		return password3;
	}

	public void setPassword3(String password3) {
		this.password3 = password3;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	@Override
	protected Serializable pkVal() {
		return null;
	}

}
