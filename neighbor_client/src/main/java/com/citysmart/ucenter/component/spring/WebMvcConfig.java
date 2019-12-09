package com.citysmart.ucenter.component.spring;

import com.citysmart.ucenter.Interceptor.TokenInterceptor;
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

    /**
     * 表示这些配置的表示静态文件所处路径， 不用拦截
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/base/**")
                .addResourceLocations("file:" + fileUrl + "/base/");
        registry.addResourceHandler("/bmfw/**")
                .addResourceLocations("file:" + fileUrl + "/bmfw/");
        registry.addResourceHandler("/download/**")
                .addResourceLocations("file:" + fileUrl + "/download/");
        registry.addResourceHandler("/dsflnterface/**")
                .addResourceLocations("file:" + fileUrl + "/dsflnterface/");
        registry.addResourceHandler("/gywm/**")
                .addResourceLocations("file:" + fileUrl + "/gywm/");
        registry.addResourceHandler("/jh.css/**")
                .addResourceLocations("file:" + fileUrl + "/jh.css/");
        registry.addResourceHandler("/qxgk/**")
                .addResourceLocations("file:" + fileUrl + "/qxgk/");
        registry.addResourceHandler("/qxt/**")
                .addResourceLocations("file:" + fileUrl + "/qxt/");
        registry.addResourceHandler("/qxwz/**")
                .addResourceLocations("file:" + fileUrl + "/qxwz/");
        registry.addResourceHandler("/record/**")
                .addResourceLocations("file:" + fileUrl + "/record/");
        registry.addResourceHandler("/user/**")
                .addResourceLocations("file:" + fileUrl + "/user/");
        registry.addResourceHandler("/writ/**")
                .addResourceLocations("file:" + fileUrl + "/writ/");
        registry.addResourceHandler("/wyzx/**")
                .addResourceLocations("file:" + fileUrl + "/wyzx/");
        registry.addResourceHandler("/zhdj/**")
                .addResourceLocations("file:" + fileUrl + "/zhdj/");
        registry.addResourceHandler("/templates/**")
                .addResourceLocations("classpath:/templates/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new TokenInterceptor())
                .addPathPatterns("/**").order(1);

    }

}
