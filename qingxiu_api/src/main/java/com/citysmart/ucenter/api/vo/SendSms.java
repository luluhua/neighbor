package com.citysmart.ucenter.api.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Setter
@Getter
public class SendSms {


    @ApiModelProperty(value="手机号码",name="phone",required = true)
    @NotBlank(message = "手机号码不允许为空")
//    @Pattern(regexp = "^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$",message = "手机号码格式不正确")
    @Pattern(regexp = "^\\d*$", message = "手机号码格式不正确")
    @Length(min = 11, max = 11, message = "手机号码格式不正确")
    private String mobile;

    @ApiModelProperty(value="短信类型",name="smsType",required = true)
    @NotNull(message="短信类型不能为空")
    private  Integer smsType;

}
