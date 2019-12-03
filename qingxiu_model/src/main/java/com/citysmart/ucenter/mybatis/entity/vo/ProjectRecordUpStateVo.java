package com.citysmart.ucenter.mybatis.entity.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import jdk.nashorn.internal.ir.annotations.Ignore;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@ApiModel
public class ProjectRecordUpStateVo {
    @ApiModelProperty(value = "办事记录ID",required = true)
    private Integer id;
    @ApiModelProperty(value = "操作状态 0 配送 1自取",required = true)
    private Integer state;
    @ApiModelProperty(value = "配送地址ID")
    private Integer addressId;
    @ApiModelProperty(value = "支付记录ID(暂留)")
    private Integer paymentId;
    @JsonIgnore
    private Integer userId;

}
