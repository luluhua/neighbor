package com.citysmart.ucenter.mybatis.enums;

import com.baomidou.mybatisplus.enums.IEnum;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * <p>
 * 设备类型
 * </p>
 *
 * @author zhouyanjian
 * @Date 2019/6/26 18:01
 */
public enum PlatformEnum implements IEnum {
    /**
     * 苹果设备
     */
    IOS("ios"),
    /**
     *  安卓设备
     */
    ANDROID("android");
    private String value;
    private String label;

    PlatformEnum(final String value) {
        this.value = value;
        this.label = value;
    }

    @Override
    public String getValue() {
        return this.value;
    }

    @JsonValue
    public String getLabel() {
        return this.label;
    }
}
