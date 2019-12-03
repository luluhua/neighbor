package com.citysmart.ucenter.common.util;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Spring 工具类
 *
 * @author liuguicheng
 * @Time：2019.03.09 下午1:29:08
 */
@WebListener
public class SpringUtil implements ServletContextListener {

    private static WebApplicationContext springContext;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        springContext = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {

    }

    public static ApplicationContext getApplicationContext() {
        return springContext;
    }

    public SpringUtil() {
    }


    public static <T> T getBean(Class<T> requiredType) {

        if (springContext == null) {

            throw new RuntimeException("springContext is null.");
        }
        return springContext.getBean(requiredType);
    }

}
