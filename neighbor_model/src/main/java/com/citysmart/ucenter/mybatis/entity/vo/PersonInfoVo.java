package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * 在线办理个人用户信息
 * */
@Getter
@Setter
public class PersonInfoVo{
    private String realname;//姓名
    private Integer gender;//性别
    private String idCard;//身份证号码
    private String mobile;//手机号码
    private String email;//邮箱
    private String address;//地址
}
