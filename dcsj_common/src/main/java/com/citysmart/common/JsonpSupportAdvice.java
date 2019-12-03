package com.citysmart.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.AbstractJsonpResponseBodyAdvice;

/**
 * JSONP支持，暂时用不到
 *
 * @author liuguicheng
 * @Time：2019.03.09 下午1:29:08
 */
@ControllerAdvice
public class JsonpSupportAdvice extends AbstractJsonpResponseBodyAdvice {
    public JsonpSupportAdvice() {
        //参数包含callback的时候 使用jsonp的反馈形式
        super("callback");
    }
}