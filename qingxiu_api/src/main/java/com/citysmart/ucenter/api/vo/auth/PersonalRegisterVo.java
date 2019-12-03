package com.citysmart.ucenter.api.vo.auth;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;

/**
 *个人用户注册-业务实体
 */
@Setter
@Getter
public class PersonalRegisterVo {

    @ApiModelProperty(value="身份证号码",name="idCard",required = true)
    @NotBlank(message = "身份证号码不能为空")
    String idCard;

    @ApiModelProperty(value="登录密码",name="password",required = true)
    @NotBlank(message = "登录密码不能为空")
    String password;

    @ApiModelProperty(value="手机号码",name="mobile",required = true)
    @NotBlank(message = "手机号码不允许为空")
    @Pattern(regexp = "^\\d*$", message = "手机号码格式不正确")
    @Length(min = 11, max = 11, message = "手机号码格式不正确")
    private String mobile;

    @ApiModelProperty(value="验证码",name="code",required = true)
    @NotBlank(message = "验证码不能为空")
    String code;
}
