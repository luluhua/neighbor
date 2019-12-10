package com.citysmart.ucenter.component.shiro;


import com.citysmart.ucenter.component.shiro.filter.LogoutFormAuthenticationFilter;
import com.citysmart.ucenter.component.shiro.filter.NewAuthenticatingFilter;
import com.citysmart.ucenter.component.shiro.matcher.RetryLimitCredentialsMatcher;
import com.citysmart.ucenter.component.shiro.realm.MyRealm;
import net.sf.ehcache.CacheManager;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author lub
 */
@Configuration
public class ShiroConfiguration {
    /**
     * 密码重试验证器
     *
     * @param ehCacheManager
     * @return
     */
    @Bean
    public CredentialsMatcher retryLimitCredentialsMatcher(EhCacheManager ehCacheManager) {
        RetryLimitCredentialsMatcher
                retryLimitCredentialsMatcher = new RetryLimitCredentialsMatcher(ehCacheManager);
        return retryLimitCredentialsMatcher;
    }

    /**
     * 将自己的验证方式加入容器
     *
     * @return
     */
    @Bean
    public MyRealm myShiroRealm(CredentialsMatcher retryLimitCredentialsMatcher) {
        MyRealm myShiroRealm = new MyRealm();
        myShiroRealm.setCredentialsMatcher(retryLimitCredentialsMatcher);
        return myShiroRealm;
    }

    /**
     * 权限管理，配置主要是Realm的管理认证
     *
     * @param ehCacheManager
     * @return
     */
    @Bean
    public SecurityManager securityManager(EhCacheManager ehCacheManager, MyRealm myShiroRealm) {
        System.err.println("--------------shiro已经加载----------------");
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(myShiroRealm);
        securityManager.setCacheManager(ehCacheManager);
        return securityManager;
    }

    /**
     * 缓存管理器
     *
     * @param cacheManager
     * @return
     */
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
        //登录
        shiroFilterFactoryBean.setLoginUrl("/login");
        shiroFilterFactoryBean.setUnauthorizedUrl("/eec/index");
        //首页
        shiroFilterFactoryBean.setSuccessUrl("/index");
        //错误页面，认证不通过跳转
        shiroFilterFactoryBean.setUnauthorizedUrl("/error/illegalAccess");
        //配置访问权限
//        LinkedHashMap<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
//        filterChainDefinitionMap.put("/logout", "logout");
//        filterChainDefinitionMap.put("/login", "authc");
//        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        Map<String, Filter> filtersMap = new LinkedHashMap<String, Filter>();
        //自定义退出的过滤器
        filtersMap.put("app", new LogoutFormAuthenticationFilter());
        filtersMap.put("authc", new NewAuthenticatingFilter());
        shiroFilterFactoryBean.setFilters(filtersMap);


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

    /**
     * 加入注解的使用，不加入这个注解不生效
     *
     * @param securityManager
     * @return
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor =
                new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }
}
