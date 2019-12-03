package com.citysmart.ucenter.mybatis.entity.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@ApiModel
public class GovConsultMsgEditVo {
    @ApiModelProperty(value = "咨询id",required = true)
    @NotNull(message = "在线咨询不能为空")
    private Integer consultId;
    @ApiModelProperty(value = "回复内容",required = true)
    @NotBlank(message = "回复内容不能为空")
    private String content;
}
