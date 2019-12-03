package com.citysmart.ucenter.mybatis.enums;

import com.baomidou.mybatisplus.enums.IEnum;
import com.fasterxml.jackson.annotation.JsonValue;

public enum LoginType implements IEnum {
    用户名及密码登录(1,"用户名及密码登录"),
    手机号码及密码登录(2,"手机号码及密码登录");
    private int value;
    private String desc;

    LoginType(final int value, final String desc){
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
