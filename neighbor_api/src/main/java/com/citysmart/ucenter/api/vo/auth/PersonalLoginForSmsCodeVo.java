package com.citysmart.ucenter.api.vo.auth;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.NotBlank;


@Setter
@Getter
public class PersonalLoginForSmsCodeVo {

    @ApiModelProperty(value="身份证号码或手机号码",name="idCard",required = true)
    @NotBlank(message = "登录名不能为空")
    String idCard;
    @ApiModelProperty(value="登录密码",name="password",required = true)
    @NotBlank(message = "密码不能为空")
    String password;

}
