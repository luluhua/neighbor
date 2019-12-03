package com.citysmart.ucenter.component.freemarker.tag;

import freemarker.template.Configuration;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

@Component
public class TagFreeMarkerConfigurer implements InitializingBean {
    @Autowired
    private Configuration configuration;

    @Autowired
    private FreeMarkerViewResolver resolver;

    @Override
    public void afterPropertiesSet() throws Exception {
        //字典标签
        configuration.setSharedVariable("dictTag", new DictTags());
        //常用标签
        configuration.setSharedVariable("commonTags", new CommonTags());
    }
}
