package com.citysmart.ucenter.common.anno;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Target(METHOD)
@Retention(RUNTIME)
@Documented
public @interface AppLogin {
    boolean isLoginIn() default true;//是否需要登錄
}
