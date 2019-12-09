package com.citysmart.ucenter.mybatis.enums;

import com.baomidou.mybatisplus.enums.IEnum;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * app应用 热点
 */
public enum AppShareVerifyType implements IEnum {
    分享码验证(1,"分享码验证"),
    设备参数验证(2,"设备参数验证");
    private int value;
    private String desc;

    AppShareVerifyType(final int value, final String desc){
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
