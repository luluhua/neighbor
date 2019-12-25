package com.citysmart.ucenter.mybatis.model.commodity;

import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 物品评分表
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@TableName("t_goods_grade")
public class TGoodsGrade extends Model<TGoodsGrade> {

    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.UUID)
    private String id;
    @TableField("goods_id")
    private String goodsId;
    @TableField("user_id")
    private String userId;
    @TableField("grade_user_id")
    private String gradeUserId;
    /**
     * 0 不匿名 1匿名
     */
    @TableField("grade_type")
    private Integer gradeType;
    private String explains;
    @TableField("sort_index")
    private Integer sortIndex;

    /**
     * 创建时间
     */
    @TableField("dt_create")
    private Date dtCreate;
    /**
     * 是否删除 1:已删除 0：未删除
     */
    @TableField("is_deleted")
    private Integer isDeleted;

    private String files;

    private Integer score;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getGradeUserId() {
        return gradeUserId;
    }

    public void setGradeUserId(String gradeUserId) {
        this.gradeUserId = gradeUserId;
    }

    public Integer getGradeType() {
        return gradeType;
    }

    public void setGradeType(Integer gradeType) {
        this.gradeType = gradeType;
    }

    public String getExplains() {
        return explains;
    }

    public void setExplains(String explains) {
        this.explains = explains;
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

    public String getFiles() {
        return files;
    }

    public void setFiles(String files) {
        this.files = files;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "TGoodsGrade{" +
                "goodsId=" + goodsId +
                ", userId=" + userId +
                ", gradeUserId=" + gradeUserId +
                ", gradeType=" + gradeType +
                ", explains=" + explains +
                ", sortIndex=" + sortIndex +
                ", dtCreate=" + dtCreate +
                ", isDeleted=" + isDeleted +
                "}";
    }
}
