package com.citysmart.ucenter.mybatis.enums;

import com.baomidou.mybatisplus.enums.IEnum;
import com.fasterxml.jackson.annotation.JsonValue;

public enum QccInterfaceCode implements IEnum {
    企业证书查询(1,"ECICertification"),
    公司年报查询(0,"AnnualReportSummary");
    private int value;
    private String desc;

    QccInterfaceCode(final int value, final String desc){
        this.value = value;
        this.desc = desc;
    }
    @Override
    public Integer getValue() {
        return this.value;
    }

    @JsonValue
    public String getDesc(){
        return this.desc;
    }
}
