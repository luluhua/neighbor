package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * 在线办理企业信息
 * */
@Getter
@Setter
public class EnterpriseInfoVo{
    private String realname; //企业名称
    private String corporationsName;//法人姓名
    private String socialCreditCode;//社会信用代码
    private String idCard;//身份证
    private String mobile;//手机号码
    private String address;//联系地址
}
