package com.citysmart.ucenter.mybatis.enums;

import com.baomidou.mybatisplus.enums.IEnum;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * app应用 热点
 */
public enum AppEntryHot implements IEnum {
    热点(1,"热点"),
    正常(0,"正常");
    private int value;
    private String desc;

    AppEntryHot(final int value, final String desc){
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
