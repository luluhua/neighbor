package com.citysmart.ucenter.component.spring;

import com.citysmart.ucenter.interceptor.GlobalInterceptor;
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

    @Autowired
    private GlobalInterceptor globalInterceptor;
    @Value("${file.static.url}")
    private String fileUrl;

    /**
     * 表示这些配置的表示静态文件所处路径， 不用拦截
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**")
                .addResourceLocations("file:" + fileUrl + "/**");
        registry.addResourceHandler("/record/**")
                .addResourceLocations("file:" + fileUrl + "/record/");
        registry.addResourceHandler("/plugins/**")
                .addResourceLocations("file:" + fileUrl + "/plugins/");
        registry.addResourceHandler("/images/**")
                .addResourceLocations("file:" + fileUrl + "/images/");
        registry.addResourceHandler("/base/**")
                .addResourceLocations("file:" + fileUrl + "/base/");
        registry.addResourceHandler("/app/**")
                .addResourceLocations("file:" + fileUrl + "/app/");
        registry.addResourceHandler("/_m/**")
                .addResourceLocations("file:" + fileUrl + "/_m/");
        registry.addResourceHandler("/errors/**")
                .addResourceLocations("file:" + fileUrl + "/errors/");
        registry.addResourceHandler("/error/**")
                .addResourceLocations("file:" + fileUrl + "/error/");
        registry.addResourceHandler("/templates/**")
                .addResourceLocations("classpath:/templates/");
        registry.addResourceHandler("/jcjd/**")
                .addResourceLocations("file:" + fileUrl + "/jcjd/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(globalInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/error")
                .excludePathPatterns("/login")
                .excludePathPatterns("/login/doLogin")
                .excludePathPatterns("/login/forgetPassword")
                .excludePathPatterns("/login/sendVerifCode")
                .excludePathPatterns("/plugins/**")
                .excludePathPatterns("/images/**")
                .excludePathPatterns("/app/**")
                .excludePathPatterns("/download")
                .excludePathPatterns("/loginApp")
                .excludePathPatterns("/loginApp/**")
                .excludePathPatterns("/m/**")
                .excludePathPatterns("/_m/**")
                .excludePathPatterns("/base/**")
                .excludePathPatterns("/errors/**")
                .excludePathPatterns("/loginOutApp/**")
                .excludePathPatterns("/jcjd/**");
    }

}
