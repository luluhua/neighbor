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
@TableName("t_sys_role2permis")
public class TSysRole2permis extends Model<TSysRole2permis> {

    private static final long serialVersionUID = 1L;

	@TableField("role_id")
	private Integer roleId;
	@TableField("permis_id")
	private Integer permisId;


	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getPermisId() {
		return permisId;
	}

	public void setPermisId(Integer permisId) {
		this.permisId = permisId;
	}

	@Override
	protected Serializable pkVal() {
		return null;
	}

}
