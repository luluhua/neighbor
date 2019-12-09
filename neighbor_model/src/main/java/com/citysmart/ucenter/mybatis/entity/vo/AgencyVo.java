package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * 中介公司信息
 * */
@Getter
@Setter
public class AgencyVo {
    /**
     * 公司名称
     * */
    private String name;
    /**
     * 公司联系电话
     * */
    private String mobile;
    /**
     * 公司地址
     * */
    private String address;
    /**
     * 备注
     * */
    private String remark;
}
