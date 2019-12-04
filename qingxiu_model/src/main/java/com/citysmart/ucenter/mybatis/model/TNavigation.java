package com.citysmart.ucenter.mybatis.model;

import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 导航表
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@TableName("t_navigation")
public class TNavigation extends Model<TNavigation> {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.UUID)
    private String id;
    /**
     * 名称
     */
    private String name;
    /**
     * code
     */
    private String code;
    /**
     * 图标
     */
    private String icon;
    /**
     * 跳转URL
     */
    @TableField("skip_url")
    private String skipUrl;
    /**
     * 排序
     */
    @TableField("sort_index")
    private Integer sortIndex;
    /**
     * 创建时间
     */
    @TableField(value = "dt_create", fill = FieldFill.INSERT)
    private Date dtCreate;
    /**
     * 是否删除 1:已删除 0：未删除
     */
    @TableLogic
    @TableField(value = "is_deleted", fill = FieldFill.INSERT)
    private Integer isDeleted;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getSkipUrl() {
        return skipUrl;
    }

    public void setSkipUrl(String skipUrl) {
        this.skipUrl = skipUrl;
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

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "TNavigation{" +
                "name=" + name +
                ", code=" + code +
                ", icon=" + icon +
                ", skipUrl=" + skipUrl +
                ", sortIndex=" + sortIndex +
                ", dtCreate=" + dtCreate +
                ", isDeleted=" + isDeleted +
                "}";
    }
}
