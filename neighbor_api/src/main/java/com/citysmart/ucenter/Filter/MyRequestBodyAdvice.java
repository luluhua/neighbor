package com.citysmart.ucenter.Filter;

import com.alibaba.fastjson.JSON;
import com.citysmart.common.util.CryptoData;
import com.citysmart.ucenter.common.anno.SecurityParameter;
import com.citysmart.ucenter.common.util.RedisUtil;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.RequestBodyAdvice;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.nio.charset.Charset;

/**
 * json解密
 */
@ControllerAdvice
public class MyRequestBodyAdvice implements RequestBodyAdvice {

    private static final Logger logger = LoggerFactory.getLogger(MyRequestBodyAdvice.class);

    private static final Charset DEFAULT_CHARSET = Charset.forName("UTF-8");

    //是否解密
    private static boolean ENCODE = false;

    @Override
    public boolean supports(MethodParameter methodParameter, Type type,
                            Class<? extends HttpMessageConverter<?>> aClass) {
        return true;
    }

    @Override
    public Object handleEmptyBody(Object body, HttpInputMessage httpInputMessage, MethodParameter methodParameter,
                                  Type type, Class<? extends HttpMessageConverter<?>> aClass) {
        return body;
    }

    @Override
    public HttpInputMessage beforeBodyRead(HttpInputMessage inputMessage, MethodParameter methodParameter, Type type,
                                           Class<? extends HttpMessageConverter<?>> aClass) throws IOException {
        try {
            if (methodParameter.getMethod().isAnnotationPresent(SecurityParameter.class)) {
                //获取注解配置的包含和去除字段
                SecurityParameter serializedField = methodParameter.getMethodAnnotation(SecurityParameter.class);
                //入参是否需要解密
                ENCODE = serializedField.inDecode();
            }
            return new MyHttpInputMessage(inputMessage);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("对方法method :【" + methodParameter.getMethod().getName() + "】返回数据进行解密出现异常：" + e.getMessage());
            return inputMessage;
        }
    }

    @Override
    public Object afterBodyRead(Object body, HttpInputMessage httpInputMessage, MethodParameter methodParameter,
                                Type type, Class<? extends HttpMessageConverter<?>> aClass) {
        Method method = methodParameter.getMethod();
        logger.info("{}.{}:{}", method.getDeclaringClass().getSimpleName(), method.getName(), JSON.toJSONString(body));
        return body;
    }

    class MyHttpInputMessage implements HttpInputMessage {

        private HttpHeaders headers;

        private InputStream body;

        public MyHttpInputMessage(HttpInputMessage inputMessage) throws Exception {
            this.headers = inputMessage.getHeaders();
            logger.info("什么类型的呢" + headers.getContentType());
            String bodyMessage = FileCopyUtils.copyToString(new InputStreamReader(inputMessage.getBody(), "utf-8"));
            logger.info("bodyMessage=====>"+bodyMessage);
            if (ENCODE) {
                //解密-开始
                CryptoData crypto = new CryptoData(getKey(), false);
                byte[] orgData = crypto.decrypt(bodyMessage);
                logger.info("bodyMessage解密后=====>"+new String(orgData));
                //解密-结束
                this.body = IOUtils.toInputStream(URLDecoder.decode(new String(orgData), "utf-8"));
            } else {
                this.body = IOUtils.toInputStream(URLDecoder.decode(bodyMessage, "utf-8"));
            }
        }

        private Charset getContentTypeCharset(MediaType contentType) {
            if (contentType != null && contentType.getCharset() != null) {
                return contentType.getCharset();
            } else {
                return DEFAULT_CHARSET;
            }
        }

        @Override
        public InputStream getBody() throws IOException {
            return body;
        }

        @Override
        public HttpHeaders getHeaders() {
            return headers;
        }

        /**
         * 获取加密私key
         */
        private String getKey() throws Exception {
            boolean isF = Boolean.valueOf(RedisUtil.getValueByKey("api.key.isapplication"));
            String key = null;
            if (isF) {
                key = RedisUtil.getValueByKey("formal.api.priKey.Net");
            } else {
                key = RedisUtil.getValueByKey("test.api.priKey.Net");
            }
            //加密可以-结束
            if (StringUtils.isBlank(key)) {
                logger.error("获取加密key========>api加密Key可以不存在");
                throw new Exception("api加密Key可以不存在");
            }
            return key;
        }
    }
}
