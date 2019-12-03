package com.citysmart.ucenter;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableAutoConfiguration
@ServletComponentScan
//@EnableTransactionManagement(proxyTargetClass = true)
@EnableCaching(proxyTargetClass = true)
@EnableScheduling
@SpringBootApplication(scanBasePackages = {"com.citysmart.ucenter.*","com.ulisesbocchio.jasyptspringboot.*"}, exclude = SecurityAutoConfiguration.class)
@MapperScan("com.citysmart.ucenter.mybatis.mapper")
@EnableTransactionManagement    //开启事务管理
@EnableAsync(proxyTargetClass = true)
public class QingxiuAPIApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(QingxiuAPIApplication.class);
    }

    public static void main(String[] args) {

        SpringApplication.run(QingxiuAPIApplication.class, args);
    }


}
