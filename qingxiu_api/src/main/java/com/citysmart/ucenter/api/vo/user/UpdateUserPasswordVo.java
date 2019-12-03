package com.citysmart.ucenter.api.vo.user;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;

/**
 * @author li
 * @date 2019/3/15
 */
@Setter
@Getter
public class UpdateUserPasswordVo {

    @ApiModelProperty(value="原密码",name="oldPassword",required = true)
    @NotBlank(message = "原密码不能为空")
    private String oldPassword;

    @ApiModelProperty(value="新密码",name="newPassword",required = true)
    @NotBlank(message = "新密码不能为空")
    private String newPassword;

    @ApiModelProperty(value="手机号码",name="mobile",required = true)
//    @Pattern(regexp = "^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$",message = "手机号码格式不正确")
    @Pattern(regexp = "^\\d*$", message = "手机号码格式不正确")
    @Length(min = 11, max = 11, message = "手机号码格式不正确")
    @NotBlank(message = "手机号码不能为空")
    private String mobile;

    @ApiModelProperty(value="验证码",name="code",required = true)
    @NotBlank(message = "验证码不能为空")
    String code;
}
