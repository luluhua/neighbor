package com.citysmart.ucenter.api.vo.user;

import lombok.Getter;
import lombok.Setter;

/**
 * app用戶地址-业务实体
 * 用于展示
 */
@Setter
@Getter
public class AppUserAdressShowVo {
    /**
     * 用户地址ID
     */
    private Integer id;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 地址名称
     */
    private String addressName;
    /**
     * 联系人电话
     */
    private String contactPhone;

    /**
     * 联系人名称
     */
    private String contactName;


    /**
     * 详细地址
     */
    private String addressDetail;


    /**
     * 省
     */
    private String province;
    private Integer provinceId;
    /**
     * 市
     */
    private String city;
    private Integer cityId;

    /**
     * 区
     */
    private String area;
    private Integer areaId;
    /**
     * 街道
     */
    private String stree;
    private Integer streeId;
    /**
     * 社区
     */
    private String community;
    private Integer communityId;
    /**
     * 是否默认 1:默认 0：非默认
     */
    private Integer isDefault;



}
