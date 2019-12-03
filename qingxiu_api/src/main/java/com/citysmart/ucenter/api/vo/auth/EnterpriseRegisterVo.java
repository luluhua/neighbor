package com.citysmart.ucenter.api.vo.auth;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * 企业用户注册-业务实体
 */
@Setter
@Getter
public class EnterpriseRegisterVo {


    @ApiModelProperty(value="统一信用代码",name="socialCreditCode",required = true)
    @NotBlank(message = "统一信用代码不能为空")
    String socialCreditCode;

    @ApiModelProperty(value="登录密码",name="password",required = true)
    @NotBlank(message = "登录密码不能为空")
    String password;

    @ApiModelProperty(value="手机号码",name="code",required = true)
    @NotBlank(message = "手机号码不允许为空")
    @Pattern(regexp = "^\\d*$", message = "手机号码格式不正确")
    @Length(min = 11, max = 11, message = "手机号码格式不正确")
    private String mobile;

//    @ApiModelProperty(value="验证码",name="code",required = true)
//    @NotNull(message = "验证码不能为空")
    Integer code;

    @ApiModelProperty(value="法人类型(1:企业法人/2:工商法人)",name="corporationsType",required = true)
    @NotNull(message = "法人类型不能为空")
    Integer corporationsType;

    @ApiModelProperty(value="法人代表姓名",name="corporationsName",required = true)
    @NotBlank(message = "法人代表姓名不能为空")
    String corporationsName;

    @ApiModelProperty(value="法人代表身份证号码",name="corporationsIdcard",required = true)
    @NotBlank(message = "法人代表身份证号码不能为空")
    String corporationsIdcard;

    @ApiModelProperty(value="单位名称",name="companyName",required = true)
    @NotBlank(message = "单位名称不能为空")
    String companyName;


    @ApiModelProperty(value="所属区/县",name="companyArea",required = true)
    @NotNull(message = "所属区/县不能为空")
    Integer companyArea;

    @ApiModelProperty(value="详细地址",name="companyAddress",required = true)
    @NotBlank(message = "详细地址不能为空")
    String companyAddress;

    @ApiModelProperty(value="联系人",name="contacts",required = true)
    @NotBlank(message = "联系人不能为空")
    String contacts;

    @ApiModelProperty(value="联系人电话",name="contactPhone",required = true)
    @Pattern(regexp = "^\\d*$",message = "手机号码格式不正确")
    @Length(min = 11, max = 11, message = "联系人电话手机号码格式不正确")
    private String contactPhone;
}
