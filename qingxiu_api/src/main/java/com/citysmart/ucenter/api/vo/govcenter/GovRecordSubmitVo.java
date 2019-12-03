package com.citysmart.ucenter.api.vo.govcenter;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @author lub
 * @description:
 * @date:16:17 2019/7/8
 */
@Data
@ApiModel
public class GovRecordSubmitVo {
    public static final Integer IS_DELIVERY_YES = 1;
    @ApiModelProperty(value = "办事记录id",required = true)
    @NotNull(message = "办事记录id不能为空")
    private Integer matId;
    @ApiModelProperty(value = "上门取件id")
    private Integer recordAddressId;
    @ApiModelProperty(value = "上门取件地址")
    private Integer addressId;
    @ApiModelProperty(value = "备注")
    private String remark;
    @ApiModelProperty(value = "是否上门取件 0 否 1 是")
    private Integer isDelivery = 0;

}
