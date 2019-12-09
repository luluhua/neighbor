package com.citysmart.ucenter.common.anno;

import java.lang.annotation.*;

/**
 * 特殊字符和敏感字符过滤
 * */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ParamFilter {
    /**
     * 是否开启json属性过滤模式
     * */
    boolean openJsonFilter() default false;
    /**
     * josn属性过滤模式下，不需要过滤的字段名
     * 多个字段名之间用“,”隔开
     * */
    String escapeAttributes() default "";
}


