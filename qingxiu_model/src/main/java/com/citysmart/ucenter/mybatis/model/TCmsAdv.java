package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.citysmart.ucenter.mybatis.enums.Delete;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.Date;

/**
 * 广告内容表
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_cms_adv")
public class TCmsAdv extends Model<TCmsAdv> {

    private static final long serialVersionUID = 1L;

    private String id;
    /**
     * 所属广告位id
     */
    @TableField("advpos_id")
    private Integer advposId;
    /**
     * 名称
     */
    @NotBlank(message = "广告名称不能为空")
    @TableField("adv_title")
    private String advTitle;
    /**
     * 广告简单说明
     */
    @TableField("adv_remark")
    private String advRemark;
    /**
     * 跳转地址
     */
    @TableField("link_url")
    private String linkUrl;
    /**
     * 跳转方式：”_blank”: 新窗口 默认为当前窗口 跳转方式：”_blank”: 新窗口 默认为当前窗口
     */
    @TableField("link_target")
    private String linkTarget;
    /**
     * 备用：关联类型
     */
    @TableField("ref_type")
    private Integer refType;
    /**
     * 广告类型： 1:图片2：HTML内容 广告类型： 1:图片2：HTML内容
     */
    @TableField("adv_type")
    private Integer advType;
    /**
     * 有效期开始时间
     */
    @TableField("dt_start")
    private Date dtStart;
    /**
     * 有效期结束时间， 不在有效期内的广告不显示
     */
    @TableField("dt_end")
    private Date dtEnd;
    /**
     * 0: 未发布 1：已发布，2：强制下架
     */
    private Integer status;
    /**
     * 排序（越大越靠前）
     */
    @TableField("sort_index")
    private Integer sortIndex;

    /**
     * 创建日期
     */
    @TableField(value = "dt_create", fill = FieldFill.INSERT)
    private Date dtCreate;

    @TableLogic
    @TableField(value = "is_deleted", fill = FieldFill.INSERT)
    private Integer isDeleted;

    /**
     * 广告内容
     */
    private String content;

    @TableField("action_page_1")
    private String actionPage1;

    @TableField("action_page_2")
    private String actionPage2;

    @TableField("web_content")
    private String webContent;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getAdvposId() {
        return advposId;
    }

    public void setAdvposId(Integer advposId) {
        this.advposId = advposId;
    }

    public String getAdvTitle() {
        return advTitle;
    }

    public void setAdvTitle(String advTitle) {
        this.advTitle = advTitle;
    }

    public String getAdvRemark() {
        return advRemark;
    }

    public void setAdvRemark(String advRemark) {
        this.advRemark = advRemark;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public String getLinkTarget() {
        return linkTarget;
    }

    public void setLinkTarget(String linkTarget) {
        this.linkTarget = linkTarget;
    }

    public Integer getRefType() {
        return refType;
    }

    public void setRefType(Integer refType) {
        this.refType = refType;
    }

    public Integer getAdvType() {
        return advType;
    }

    public void setAdvType(Integer advType) {
        this.advType = advType;
    }

    public Date getDtStart() {
        return dtStart;
    }

    public void setDtStart(Date dtStart) {
        this.dtStart = dtStart;
    }

    public Date getDtEnd() {
        return dtEnd;
    }

    public void setDtEnd(Date dtEnd) {
        this.dtEnd = dtEnd;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getActionPage1() {
        return actionPage1;
    }

    public void setActionPage1(String actionPage1) {
        this.actionPage1 = actionPage1;
    }

    public String getActionPage2() {
        return actionPage2;
    }

    public void setActionPage2(String actionPage2) {
        this.actionPage2 = actionPage2;
    }

    public String getWebContent() {
        return webContent;
    }

    public void setWebContent(String webContent) {
        this.webContent = webContent;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }
}
