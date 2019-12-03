package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;


/**
 * <p>
 * 用户角色关联表
 * </p>
 *
 * @author GaoJun.Zhou
 * @since 2017-03-06
 */
@TableName("t_sys_user_role")
public class SysUserRole extends Model<SysUserRole> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(type=IdType.UUID)
	private String Id;
    /**
     * 用户主键
     */
	private Integer userId;
    /**
     * 角色主键
     */
	private Integer roleId;


	public String getId() {
		return Id;
	}

	public void setId(String Id) {
		this.Id = Id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Override
	protected Serializable pkVal() {
		return this.Id;
	}

}
