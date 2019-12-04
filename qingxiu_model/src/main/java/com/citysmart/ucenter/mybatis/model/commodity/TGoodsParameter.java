package com.citysmart.ucenter.mybatis.model.commodity;

import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

/**
 * <p>
 * 物品参数表
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@TableName("t_goods_parameter")
public class TGoodsParameter extends Model<TGoodsParameter> {

    private static final long serialVersionUID = 1L;

    /**
     * 物品id
     */
    @TableField("goods_id")
    private String goodsId;
    /**
     * 参数名称
     */
    @TableField("key_name")
    private String keyName;
    /**
     * 说明
     */
    @TableField("value_name")
    private String valueName;
    /**
     * 排序
     */
    @TableField("sort_index")
    private String sortIndex;
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


    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getKeyName() {
        return keyName;
    }

    public void setKeyName(String keyName) {
        this.keyName = keyName;
    }

    public String getValueName() {
        return valueName;
    }

    public void setValueName(String valueName) {
        this.valueName = valueName;
    }

    public String getSortIndex() {
        return sortIndex;
    }

    public void setSortIndex(String sortIndex) {
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
        return null;
    }

    @Override
    public String toString() {
        return "TGoodsParameter{" +
                "goods Id=" + goodsId +
                ", keyName=" + keyName +
                ", valueName=" + valueName +
                ", sortIndex=" + sortIndex +
                ", dtCreate=" + dtCreate +
                ", isDeleted=" + isDeleted +
                "}";
    }
}
