package com.citysmart.ucenter.api.vo.auth;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;

/**
 * 个人用户登录-业务实体
 */
@Setter
@Getter
public class PersonalLoginVo {

    @ApiModelProperty(value="身份证号码或手机号码",name="idCard",required = true)
    @NotBlank(message = "登录名不能为空")
    String idCard;
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
