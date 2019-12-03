package com.citysmart.ucenter.mybatis.enums;

import com.baomidou.mybatisplus.enums.IEnum;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * <p>
 * 推送渠道
 * </p>
 *
 * @author zhouyanjian
 * @Date 2019/6/26 18:06
 */
public enum PushChannelEnum implements IEnum {
    /**
     * jiguang（极光中间件推送）
     */
    jiguang("jiguang", "极光中间件推送"),
    /**
     * javapns（ios原生推送）
     */
    javapns("javapns", "ios原生推送");

    PushChannelEnum(final String value, final String label) {
        this.value = value;
        this.label = label;
    }

    private String value;

    private String label;

    @Override
    public String getValue() {
        return this.value;
    }

    @JsonValue
    public String getLabel() {
        return this.label;
    }
}
