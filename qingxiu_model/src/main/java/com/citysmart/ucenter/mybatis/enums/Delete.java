package com.citysmart.ucenter.mybatis.enums;

import com.baomidou.mybatisplus.enums.IEnum;
import com.fasterxml.jackson.annotation.JsonValue;

public enum Delete implements IEnum {
    已删除(1,"已删除"),
    未删除(0,"未删除");
    private int value;
    private String desc;

    Delete(final int value, final String desc){
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
