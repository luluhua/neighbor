package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;


/**
 * <p>
 * 菜单表
 * </p>
 *
 * @author GaoJun.Zhou
 * @since 2017-03-06
 */
@TableName("t_sys_menu")
public class SysMenu extends Model<SysMenu> {

    private static final long serialVersionUID = 1L;

	@TableId(type = IdType.UUID)
	private String id;
	/**
	 * 创建日期
	 */
	@TableField(value = "dt_create", fill = FieldFill.INSERT)
	private Date dtCreate;
	/**
	 * 是否删除 1:已删除 0：未删除
	 */
	@TableLogic
	@TableField(value = "is_deleted", fill = FieldFill.INSERT)
	private Integer isDeleted;

	@TableField(value = "service_type")
	private String serviceType;

	@TableField(value = "is_enabled")
	private Integer isEnabled;

    /**
     * 菜单名称
     */
	private String menuName;
    /**
     * 父级菜单ID
     */
	private String pid;
    /**
     * 连接地址
     */
	private String url;
    /**
     * 图标
     */
	private String icon;
    /**
     * 排序
     */
	private Integer sort;
    /**
     * 深度
     */
	private Integer deep;
    /**
     * 编码
     */
	private String code;
    /**
     * 资源名称
     */
	private String resource;




	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getDeep() {
		return deep;
	}

	public void setDeep(Integer deep) {
		this.deep = deep;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

	public Integer getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getDtCreate() {
		return dtCreate;
	}

	public void setDtCreate(Date dtCreate) {
		this.dtCreate = dtCreate;
	}

	public void setServiceType(String serviceType) {this.serviceType = serviceType;	}

	public String getServiceType() {return serviceType;	}

	public Integer getIsEnabled() {	return isEnabled;}

	public void setIsEnabled(Integer isEnabled) {this.isEnabled = isEnabled;}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
