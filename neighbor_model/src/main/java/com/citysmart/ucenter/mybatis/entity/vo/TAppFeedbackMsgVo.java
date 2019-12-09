package com.citysmart.ucenter.mybatis.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @author li
 * @date 2019/8/20
 */
@Getter
@Setter
public class TAppFeedbackMsgVo {

    @ApiModelProperty(value = "反馈信息", required = true)
    @NotNull(message = "反馈信息不能为空")
    private String deviceToken;
    @ApiModelProperty(value = "回复内容", required = true)
    @NotBlank(message = "回复内容不能为空")
    private String content;
}
