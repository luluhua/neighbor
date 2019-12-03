package com.citysmart.ucenter.mybatis.enums;

import com.baomidou.mybatisplus.enums.IEnum;
import com.fasterxml.jackson.annotation.JsonValue;

public enum RequestMode implements IEnum {
    GET(0,"GET"),
    POST(1,"POST");
    private int value;
    private String desc;

    RequestMode(final int value, final String desc){
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