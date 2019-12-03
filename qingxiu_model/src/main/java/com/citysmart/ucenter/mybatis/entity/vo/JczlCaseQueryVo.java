package com.citysmart.ucenter.mybatis.entity.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@ApiModel
public class JczlCaseQueryVo {
    @ApiModelProperty(value = "用户id")
    private Integer apuId;
}
