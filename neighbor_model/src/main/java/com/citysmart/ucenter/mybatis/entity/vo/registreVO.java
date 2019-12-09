package com.citysmart.ucenter.mybatis.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

/**
 * @author li
 * @date 2019/12/9
 */
@Getter
@Setter
public class registreVO {

    @ApiModelProperty(value = "手机号码", name = "username", required = true)
    @Length(min = 11, max = 11, message = "手机号码格式不正确")
    @NotBlank(message = "手机号码格式不正确")
    String username;

    @ApiModelProperty(value = "新密码", name = "password", required = true)
    @NotBlank(message = "新密码不能为空")
    String password;

    @ApiModelProperty(value = "确认密码", name = "password", required = true)
    @NotBlank(message = "确认密码不能为空")
    String password1;

    @ApiModelProperty(value = "验证码", name = "code", required = true)
    @NotBlank(message = "验证码不能为空")
    String code;


}
