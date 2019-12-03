package com.citysmart.ucenter.common.util;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @author li
 * @date 2019/4/13
 */
@Configuration
public class MyWebAppConfiguration extends WebMvcConfigurerAdapter {
    /**
     * 当前环境配置文件
     */
    public Environment env;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        /**
         * @Description: 对文件的路径进行配置, 创建一个虚拟路径/Path/** ，即只要在<img src="/Path/picName.jpg" />便可以直接引用图片
         *这是图片的物理路径  "file:/+本地图片的地址"
         * @Date： Create in 14:08 2017/12/20
         */
        registry.addResourceHandler("/Path/**").addResourceLocations("file:/D:/qingxiu_ucenter/file/**");
        super.addResourceHandlers(registry);
    }

}
