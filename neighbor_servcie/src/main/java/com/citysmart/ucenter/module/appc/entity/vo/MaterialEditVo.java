package com.citysmart.ucenter.module.appc.entity.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@ApiModel
public class MaterialEditVo {
    @ApiModelProperty(value = "材料表单id")
    private Integer field_id;
    @ApiModelProperty(value = "材料内容",dataType = "object")
    private Object field_value;
}
