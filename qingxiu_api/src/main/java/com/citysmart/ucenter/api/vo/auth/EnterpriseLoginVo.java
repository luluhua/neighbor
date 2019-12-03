package com.citysmart.ucenter.api.vo.auth;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;

/**
 * 企业用户登录-业务实体
 */
@Setter
@Getter
public class EnterpriseLoginVo {

    @ApiModelProperty(value="统一社会信用代码",name="username",required = true)
    @NotBlank(message = "统一社会信用代码不能为空")
    String username;
    @ApiModelProperty(value="登录密码",name="password",required = true)
    @NotBlank(message = "密码不能为空")
    String password;
    @ApiModelProperty(value="手机号码(初始非必填)",name="mobile")
//    @Pattern(regexp = "^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$",message = "手机号码格式不正确")
    @Pattern(regexp = "^\\d*$", message = "手机号码格式不正确")
    @Length(min = 11, max = 11, message = "手机号码格式不正确")
    String mobile;
    @ApiModelProperty(value="验证码(初始非必填)",name="code")
    String code;
    @ApiModelProperty(value = "滑块验证码")
    String ticket;
    @ApiModelProperty(value = "滑块随机串")
    String rand;


}
