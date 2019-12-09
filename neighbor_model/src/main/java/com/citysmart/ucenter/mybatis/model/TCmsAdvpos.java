package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.citysmart.ucenter.mybatis._Model;
import com.citysmart.ucenter.mybatis.enums.Delete;

import javax.validation.constraints.NotBlank;

import javax.validation.constraints.Pattern;

/**
 * 广告位表
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_cms_advpos")
public class TCmsAdvpos extends _Model<TCmsAdvpos> {

    private static final long serialVersionUID = 1L;


    /**
     * 广告位名称
     */
    @NotBlank(message = "广告位名称不能为空")
    private String name;
    /**
     * 广告位代码，可通过此代码来找到这个广告位
     */
    @NotBlank(message = "广告位代码不能为空")
    private String code;
    /**
     * 广告位备注
     */
    private String remark;
    /**
     * 排序（越大越靠前）
     */
    @TableField("sort_index")
    private Integer sortIndex;

    /**
     * 是否删除 1:已删除 0：未删除
     */

    @TableLogic
    @TableField(value = "is_deleted", fill = FieldFill.INSERT)
    private Integer isDeleted;

    /**
     * 广告位置
     */
    @TableField("layout")
    private Integer layout;

    /**
     * 布局示例图url
     */
    @TableField("layout_pic_url")
    private String layoutPicUrl;


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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getSortIndex() {
        return sortIndex;
    }

    public void setSortIndex(Integer sortIndex) {
        this.sortIndex = sortIndex;
    }

    @Override
    public Integer getIsDeleted() {
        return isDeleted;
    }

    @Override
    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Integer getLayout() {
        return layout;
    }

    public void setLayout(Integer layout) {
        this.layout = layout;
    }

    public String getLayoutPicUrl() {
        return layoutPicUrl;
    }

    public void setLayoutPicUrl(String layoutPicUrl) {
        this.layoutPicUrl = layoutPicUrl;
    }
}
