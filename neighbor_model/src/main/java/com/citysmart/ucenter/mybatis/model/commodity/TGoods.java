package com.citysmart.ucenter.mybatis.model.commodity;

import java.math.BigDecimal;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;

import javax.validation.Valid;
import java.io.Serializable;

/**
 * <p>
 * 物品信息表
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@TableName("t_goods")
public class TGoods extends Model<TGoods> {

    private static final long serialVersionUID = 1L;
    private String id;
    /**
     * 标签id
     */
    @TableField("tag_id")
    private String tagId;
    /**
     * 用户Id
     */
    @TableField("user_id")
    private String userId;
    /**
     * 物品名称
     */
    private String name;
    /**
     * 描述
     */
    private String describe;
    /**
     * 数量
     */
    private Integer quantity;
    /**
     * 规格
     */
    private String specification;
    /**
     * 介绍
     */
    private String intro;
    /**
     * 价格
     */
    private BigDecimal price;
    /**
     * 图片
     */
    private String Images;
    /**
     * 价格类型 0单价 1总价
     */
    @TableField("price_type")
    private Integer priceType;
    @TableField("sort_index")
    private Integer sortIndex;
    /**
     * 导航code
     */
    @TableField("navigation_code")
    private String navigationCode;
    @TableField(value = "dt_create", fill = FieldFill.INSERT)
    private Date dtCreate;
    /**
     * 是否删除 1:已删除 0：未删除
     */
    @TableLogic
    @TableField(value = "is_deleted", fill = FieldFill.INSERT)
    private Integer isDeleted;
    private String files;

    @TableField("sell_stale")
    private Integer sellStale;

    @TableField("sell_price")
    private Integer sellPrice;

    /**
     * 位置地址
     */
    private String location;
    /**
     * 经度
     */
    private Double lng;
    /**
     * 纬度
     */

    private Double lat;

    private Integer status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTagId() {
        return tagId;
    }

    public void setTagId(String tagId) {
        this.tagId = tagId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getImages() {
        return Images;
    }

    public void setImages(String Images) {
        this.Images = Images;
    }

    public Integer getPriceType() {
        return priceType;
    }

    public void setPriceType(Integer priceType) {
        this.priceType = priceType;
    }

    public Integer getSortIndex() {
        return sortIndex;
    }

    public void setSortIndex(Integer sortIndex) {
        this.sortIndex = sortIndex;
    }

    public String getNavigationCode() {
        return navigationCode;
    }

    public void setNavigationCode(String navigationCode) {
        this.navigationCode = navigationCode;
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

    public Integer getSellStale() {
        return sellStale;
    }

    public void setSellStale(Integer sellStale) {
        this.sellStale = sellStale;
    }

    public Integer getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(Integer sellPrice) {
        this.sellPrice = sellPrice;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "TGoods{" +
                "tagId=" + tagId +
                ", userId=" + userId +
                ", name=" + name +
                ", describe=" + describe +
                ", quantity=" + quantity +
                ", specification=" + specification +
                ", intro=" + intro +
                ", price=" + price +
                ", Images=" + Images +
                ", priceType=" + priceType +
                ", sortIndex=" + sortIndex +
                ", navigationCode=" + navigationCode +
                ", dtCreate=" + dtCreate +
                ", isDeleted=" + isDeleted +
                ", sellStale=" + sellStale +
                ", sellPrice=" + sellPrice +
                "}";
    }
}
