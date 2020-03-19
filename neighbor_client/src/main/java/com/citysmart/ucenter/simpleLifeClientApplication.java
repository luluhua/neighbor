package com.citysmart.ucenter;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.ErrorPageFilter;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.servlet.MultipartConfigElement;

@EnableAutoConfiguration
@ServletComponentScan
@EnableTransactionManagement(proxyTargetClass = true)
@EnableCaching(proxyTargetClass = true)
@EnableScheduling
@ComponentScan({"com.citysmart.ucenter.*"})
@SpringBootApplication(scanBasePackages = {"com.citysmart.ucenter.*", "com.ulisesbocchio.jasyptspringboot.*"
}, exclude = SecurityAutoConfiguration.class)
@MapperScan({"com.citysmart.ucenter.mybatis.mapper", "com.citysmart.push.dao"})
public class simpleLifeClientApplication extends SpringBootServletInitializer {

//    @Override
//    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
//        return builder.sources(QingxiuClientApplication.class);
//    }

    public static void main(String[] args) {
        SpringApplication.run(simpleLifeClientApplication.class, args);
    }

    /***
     * @Author liuguicheng
     * @Description //设置上传图片大小
     * @Date 15:02 2019/6/15
     * @Param [maxFileSize, maxRequestSize]
     * @return javax.servlet.MultipartConfigElement
     **/
    @Bean
    public MultipartConfigElement multipartConfigElement(@Value("${multipart.maxFileSize}") String maxFileSize,
                                                         @Value("${multipart.maxRequestSize}") String maxRequestSize) {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        factory.setMaxFileSize(maxFileSize);
        factory.setMaxRequestSize(maxRequestSize);
        return factory.createMultipartConfig();
    }

    @Bean
    public ErrorPageFilter errorPageFilter() {
        return new ErrorPageFilter();
    }

    @Bean
    public FilterRegistrationBean disableSpringBootErrorFilter(ErrorPageFilter filter) {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(filter);
        filterRegistrationBean.setEnabled(false);
        return filterRegistrationBean;
    }


}
