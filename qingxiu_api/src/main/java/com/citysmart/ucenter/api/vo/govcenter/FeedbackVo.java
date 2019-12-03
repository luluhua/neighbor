package com.citysmart.ucenter.api.vo.govcenter;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

/**
 * @author li
 * @date 2019/8/20
 */
@Getter
@Setter
public class FeedbackVo {

    /**
     * 反馈内容
     */
    @ApiModelProperty(value = "内容", required = true)
    @NotBlank(message = "内容不能为空")
    private String content;

    /**
     * 联系方式
     */
    private String contactWay;
}
