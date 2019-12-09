package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import com.citysmart.ucenter.mybatis._Model;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_sys_dict")
public class TSysDict extends Model<TSysDict> {

    private static final long serialVersionUID = 1L;

	private String code;
    /**
     * 标签值
     */
	private String value;
    /**
     * 标签名称
     */
	private String label;
    /**
     * 类型
     */
	private String type;
    /**
     * 父级id
     */
	@TableField("parent_id")
	private Integer parentId;
    /**
     * 排序
     */
	@TableField("sort_index")
	private Integer sortIndex;

    /**
     * 备注说明
     */
	private String remark;

	/**
	 * 字典分组 0为顶级分组（目前只设置2级）
	 */
	@TableField("module_id")
	private Integer moduleId;

	@TableId(type = IdType.AUTO)
	private Integer id;
	/**
	 * 创建日期
	 */
	@TableField(value = "dt_create", fill = FieldFill.INSERT)
	private Date dtCreate;
	/**
	 * 是否删除 1:已删除 0：未删除
	 */
	@TableField(value = "is_deleted", fill = FieldFill.INSERT)
	private Integer isDeleted;

	@TableField("project_id")
	private Integer projectId;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
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

	public Integer getModuleId() {
		return moduleId;
	}

	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}

	public Integer getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Date getDtCreate() {
		return dtCreate;
	}

	public void setDtCreate(Date dtCreate) {
		this.dtCreate = dtCreate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}
}
