package com.citysmart.ucenter.Filter;

import com.citysmart.common.util.Encryption3DEsUtil;
import com.citysmart.ucenter.common.anno.SecurityParameter;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

/**
 * json加密
 */
@ControllerAdvice
public class MyResponseBodyAdvice implements ResponseBodyAdvice {

    private final static Logger logger = LoggerFactory.getLogger(MyResponseBodyAdvice.class);

    //是否加密
    private static boolean encode = false;

    @Override
    public boolean supports(MethodParameter methodParameter, Class aClass) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter methodParameter, MediaType mediaType, Class aClass,
                                  ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
        if (methodParameter.getMethod().isAnnotationPresent(SecurityParameter.class)) {
            //获取注解配置的包含和去除字段
            SecurityParameter serializedField = methodParameter.getMethodAnnotation(SecurityParameter.class);
            //出参是否需要加密
            encode = serializedField.outEncode();
        }
        if (encode) {
            ObjectMapper objectMapper = new ObjectMapper();
            try {
                String result = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(body);
                logger.info("result=" + result);
                return Encryption3DEsUtil
                        .encryptMode(result, "2012PinganVitality075522628888ForShenZhenBelter075561869839");
            } catch (Exception e) {
                e.printStackTrace();
                logger.error(
                        "对方法method :【" + methodParameter.getMethod().getName() + "】返回数据进行解密出现异常：" + e.getMessage());
            }
        }
        return body;
    }

}
