package com.citysmart.ucenter.component.shiro;


import com.citysmart.ucenter.component.shiro.realm.MyRealm;
import net.sf.ehcache.CacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.DefaultSessionStorageEvaluator;
import org.apache.shiro.mgt.DefaultSubjectDAO;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

/**
 * @author lub
 */
@Configuration
public class ShiroConfiguration {

Logger logger = LoggerFactory.getLogger(ShiroConfiguration.class);

    /**
     * 将自己的验证方式加入容器
     * @return
     */
    @Bean
    public MyRealm myShiroRealm() {
        MyRealm myShiroRealm = new MyRealm();
        return myShiroRealm;
    }

    /**
     * 权限管理，配置主要是Realm的管理认证
     * @param ehCacheManager
     * @return
     */
    @Bean
    public SecurityManager securityManager(EhCacheManager ehCacheManager) {
        logger.info("--------------shiro已经加载----------------");
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(myShiroRealm());

        /*
         * 关闭shiro自带的session，详情见文档
         * http://shiro.apache.org/session-management.html#SessionManagement-StatelessApplications%28Sessionless%29
         */
        DefaultSubjectDAO subjectDAO = new DefaultSubjectDAO();
        DefaultSessionStorageEvaluator defaultSessionStorageEvaluator = new DefaultSessionStorageEvaluator();
        defaultSessionStorageEvaluator.setSessionStorageEnabled(false);
        subjectDAO.setSessionStorageEvaluator(defaultSessionStorageEvaluator);
        securityManager.setSubjectDAO(subjectDAO);
        return securityManager;
    }

    @Bean
    public EhCacheManager ehCacheManager(CacheManager cacheManager) {
        EhCacheManager em = new EhCacheManager();
        //将ehcacheManager转换成shiro包装后的ehcacheManager对象
        em.setCacheManager(cacheManager);
        return em;
    }


    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        Map<String, String> filterRuleMap = new HashMap<>(6);
        // 访问401页面不通过我们的Filter
        filterRuleMap.put("/common/401", "anon");
        filterRuleMap.put("/swagger**/**", "anon");
        filterRuleMap.put("/auth/login_1", "anon");
        filterRuleMap.put("/auth/login_1", "anon");
        filterRuleMap.put("/auth/register_personal", "anon");
        filterRuleMap.put("/auth/register_enterprise", "anon");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterRuleMap);
        return shiroFilterFactoryBean;
    }

    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    @Bean
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator creator = new DefaultAdvisorAutoProxyCreator();
        creator.setProxyTargetClass(true);
        return creator;
    }

    /***
     * 加入注解的使用，不加入这个注解不生效
     **/
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor =
                new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }
}
