package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
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
@TableName("t_sys_permis")
public class TSysPermis extends Model<TSysPermis> {

    private static final long serialVersionUID = 1L;

    /**
     * 权限id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 父权限，预留
     */
	private Integer pid;
    /**
     * 权限代码，用于方便获取权限值
     */
	private String code;
    /**
     * 名称
     */
	private String name;
    /**
     * 显示顺序
     */
	@TableField("sort_index")
	private Integer sortIndex;
    /**
     * 备注
     */
	private String remark;
    /**
     * 是否启用此权限
     */
	@TableField("is_enabled")
	private Boolean isEnabled;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSortIndex() {
		return sortIndex;
	}

	public void setSortIndex(Integer sortIndex) {
		this.sortIndex = sortIndex;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Boolean isIsEnabled() {
		return isEnabled;
	}

	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
