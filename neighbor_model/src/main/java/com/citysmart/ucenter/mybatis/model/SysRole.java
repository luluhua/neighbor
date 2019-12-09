package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;


/**
 * <p>
 * 角色表
 * </p>
 *
 * @author GaoJun.Zhou
 * @since 2017-03-06
 */
@TableName("t_sys_role")
public class SysRole extends Model<SysRole> {

	/**
	 * 角色id
	 */
	@TableId(value = "id", type = IdType.AUTO)
	private Integer id;
	/**
	 * 角色代码，可以通过代码方便查询角色信息
	 */
	private String code;
	/**
	 * 显示顺序
	 */
	@TableField("sort_index")
	private Integer sortIndex;
	/**
	 * 角色名
	 */
	private String name;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 是否系统内置角色，内置角色不可删除
	 */
	@TableField("is_system")
	private Integer isSystem;
	/**
	 * 状态,1-启用,-1禁用
	 */
	@TableField("role_state")
	private int roleState;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleState() {
		return roleState;
	}

	public void setRoleState(Integer roleState) {
		this.roleState = roleState;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getSortIndex() {
		return sortIndex;
	}

	public void setSortIndex(Integer sortIndex) {
		this.sortIndex = sortIndex;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public void setRoleState(int roleState) {
		this.roleState = roleState;
	}

	public Integer getIsSystem() {
		return isSystem;
	}

	public void setIsSystem(Integer isSystem) {
		this.isSystem = isSystem;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
