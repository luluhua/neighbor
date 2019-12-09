package com.citysmart.ucenter.api.vo.auth;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
public class LoginCheckSmsCodeVo {
    @ApiModelProperty(value="gid",name="gid",required = true)
    @NotBlank(message = "gid不能为空")
    private String gid;
    @ApiModelProperty(value="验证码",name="code",required = true)
    @NotBlank(message = "验证码不能为空")
    private String code;
}
