package com.citysmart.ucenter.component.spring;

import com.citysmart.ucenter.Interceptor.GlobalInterceptor;
import com.citysmart.ucenter.Interceptor.TokenInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * webmvc配置注册
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Value("${file.static.url}")
    private String fileUrl;
    @Autowired
    private GlobalInterceptor globalInterceptor;

    /**
     * 表示这些配置的表示静态文件所处路径， 不用拦截
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/base/**")
                .addResourceLocations("file:" + fileUrl + "/base/");
        registry.addResourceHandler("/wholesalestore/**")
                .addResourceLocations("file:" + fileUrl + "/wholesalestore/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(globalInterceptor)
                .excludePathPatterns("/error")
                .excludePathPatterns("*/login")
                .excludePathPatterns("/clientDoLogin");


    }

}
