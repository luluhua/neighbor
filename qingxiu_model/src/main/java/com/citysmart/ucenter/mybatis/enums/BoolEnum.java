package com.citysmart.ucenter.mybatis.enums;

import com.baomidou.mybatisplus.enums.IEnum;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * <p>
 * 布尔类型枚举
 * </p>
 *
 * @author zhouyanjian
 * @Date 2019/6/24 18:18
 */
public enum BoolEnum implements IEnum {
    /**
     * true 1
     */
    是(true, "是"),
    /**
     * false 0
     */
    否(false, "否");

    BoolEnum(final boolean value, final String label) {
        this.value = value;
        this.label = label;
    }

    private boolean value;

    private String label;

    @Override
    public Boolean getValue() {
        return this.value;
    }

    @JsonValue
    public String getLabel() {
        return this.label;
    }
}
