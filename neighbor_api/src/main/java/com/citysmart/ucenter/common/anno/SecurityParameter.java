package com.citysmart.ucenter.common.anno;

import java.lang.annotation.*;

/**
 * 是否加密
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SecurityParameter {

    boolean inDecode() default false;//请求参数不解密

    boolean outEncode() default false;//输出返回不加密

}

