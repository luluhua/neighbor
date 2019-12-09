package com.citysmart.ucenter.api.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * @author li
 * @date 2019/6/18
 */
@Setter
@Getter
public class SendSmsNoPhone {


    @ApiModelProperty(value = "短信类型", name = "smsType", required = true)
    @NotNull(message = "短信类型不能为空")
    private Integer smsType;
}
