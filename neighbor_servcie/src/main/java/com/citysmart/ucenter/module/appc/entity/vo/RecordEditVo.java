package com.citysmart.ucenter.module.appc.entity.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@ApiModel
public class RecordEditVo {
    @ApiModelProperty(value = "事项编号id",required = true)
    private Integer proId;
    @ApiModelProperty(value = "办事记录Id")
    private Integer matId;
    @ApiModelProperty(value = "表单参数列表")
    private List<MaterialEditVo> form;
    @ApiModelProperty(hidden = true)
    private Integer apuId;
}
