package com.citysmart.ucenter.component.shiro;

import com.citysmart.ucenter.component.shiro.tag.ShiroTags;
import freemarker.template.Configuration;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2016/3/15.
 */
@Component
public class ShiroTagFreeMarkerConfigurer implements InitializingBean {

    @Autowired
    private Configuration configuration;

    @Override
    public void afterPropertiesSet() throws Exception {
        // 加上这句后，可以在页面上使用shiro标签
        configuration.setSharedVariable("shiro", new ShiroTags());
    }
}
