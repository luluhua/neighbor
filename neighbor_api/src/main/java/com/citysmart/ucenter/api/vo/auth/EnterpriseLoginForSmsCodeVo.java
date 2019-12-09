package com.citysmart.ucenter.api.vo.auth;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.NotBlank;

@Setter
@Getter
public class EnterpriseLoginForSmsCodeVo {
    @ApiModelProperty(value="统一社会信用代码",name="username",required = true)
    @NotBlank(message = "统一社会信用代码不能为空")
    String username;
    @ApiModelProperty(value="登录密码",name="password",required = true)
    @NotBlank(message = "密码不能为空")
    String password;
}
