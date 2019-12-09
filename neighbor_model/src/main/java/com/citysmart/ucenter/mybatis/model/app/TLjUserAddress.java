package com.citysmart.ucenter.mybatis.model.app;

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
 * 用户地址信息表
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@TableName("t_lj_user_address")
public class TLjUserAddress extends Model<TLjUserAddress> {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.UUID)
    private String id;
    /**
     * 用户Id
     */
    @TableField("user_id")
    private String userId;
    /**
     * 省份
     */
    private String province;
    /**
     * 城市
     */
    private String city;
    /**
     * 区域
     */
    private String region;
    /**
     * 详细地址
     */
    @TableField("detailed_address")
    private String detailedAddress;
    /**
     * 是否删除 0:默认
     */
    private Integer state;
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getDetailedAddress() {
        return detailedAddress;
    }

    public void setDetailedAddress(String detailedAddress) {
        this.detailedAddress = detailedAddress;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
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
        return "TLjUserAddress{" +
                "userId=" + userId +
                ", province=" + province +
                ", city=" + city +
                ", region=" + region +
                ", detailedAddress=" + detailedAddress +
                ", state=" + state +
                ", dtCreate=" + dtCreate +
                ", isDeleted=" + isDeleted +
                "}";
    }
}
