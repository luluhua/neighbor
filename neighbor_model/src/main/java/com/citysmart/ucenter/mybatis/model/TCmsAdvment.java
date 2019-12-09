package com.citysmart.ucenter.mybatis.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 广告附件表
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_cms_advment")
public class TCmsAdvment extends Model<TCmsAdvment> {

    private static final long serialVersionUID = 1L;

	private Integer id;
    /**
     * 广告记录id t_cms_adv.id
     */
	@TableField("adv_id")
	private Integer advId;
    /**
     * 附件地址
     */
	private String url;
    /**
     * 排序（越大越靠前）
     */
	@TableField("sort_index")
	private Integer sortIndex;
    /**
     * 创建日期
     */
	@TableField("dt_create")
	private Date dtCreate;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAdvId() {
		return advId;
	}

	public void setAdvId(Integer advId) {
		this.advId = advId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getSortIndex() {
		return sortIndex;
	}

	public void setSortIndex(Integer sortIndex) {
		this.sortIndex = sortIndex;
	}

	public Date getDtCreate() {
		return dtCreate;
	}

	public void setDtCreate(Date dtCreate) {
		this.dtCreate = dtCreate;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
