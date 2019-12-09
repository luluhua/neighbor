package com.citysmart.ucenter.common.anno;

import java.lang.annotation.*;

/**
 *	日志
 * @author liuguicheng
 *
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {

	 String value() ;

	/**
	 * parameter为false时，日志不记录请求参数
	 * @return
	 */
	 boolean parameter() default true;

}
