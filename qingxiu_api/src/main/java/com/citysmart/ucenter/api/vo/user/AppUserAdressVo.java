package com.citysmart.ucenter.api.vo.user;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;


/**
 * app用戶地址-业务实体
 * 用于接受
 */
@Setter
@Getter
public class AppUserAdressVo {
    //用户地址ID
    @ApiModelProperty(value="用户地址ID",name="userAdressId")
    private Integer userAdressId;

    /**
     * 联系人电话
     */
    @ApiModelProperty(value="联系人电话",name="contactPhone",required = true)
    @NotNull(message = "联系人电话不能为空")
    private String contactPhone;

    /**
     * 联系人名称
     */
    @ApiModelProperty(value="联系人名称",name="contactName",required = true)
    @NotNull(message = "联系人名称不能为空")
    private String contactName;

    //是否默认
    @ApiModelProperty(value = "是否默认 1：默认 0：非默认",required = true)
    private Integer isDefault;

    //行政城市ID
    @ApiModelProperty(value = "行政城市ID",name="areaId",required = true)
    private  Integer areaId;

    //详细地址
    @ApiModelProperty(value = "详细地址")
    private String addressDetail;

}
