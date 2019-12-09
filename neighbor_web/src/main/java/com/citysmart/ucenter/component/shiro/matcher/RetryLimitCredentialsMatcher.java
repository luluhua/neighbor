package com.citysmart.ucenter.component.shiro.matcher;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.ucenter.module.system.service.ISysSettingService;
import com.citysmart.ucenter.mybatis.model.SysSetting;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

/**
 * @author lub
 * shiro的密码比较器，通过ehcache记录密码错误次数、
 * 第一次错误时间戳以及账户开始锁定时间
 */
public class RetryLimitCredentialsMatcher extends SimpleCredentialsMatcher {
    /**
     * 1s=1000ms ,1min=60s
     */
    public final static int TIME_MILLIS = 60000;

    /**
     * 密码输入错误次数就被冻结
     */
    private Cache<String, Object> passwordRetryCache;
    @Autowired
    private ISysSettingService sysSettingService;

    /**
     * 构造方法 创建对象,传入缓存的管理器
     *
     * @param cacheManager
     */
    public RetryLimitCredentialsMatcher(CacheManager cacheManager) {
        passwordRetryCache = cacheManager.getCache("passwordRetryCache");
    }

    /**
     * 方法名: doCredentialsMatch
     * 方法描述: 用户登录错误次数方法.
     *
     * @param token
     * @param info
     * @return boolean
     * @throws
     */
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        String username = (String) token.getPrincipal();
        // retry count + 1
        AtomicInteger retryCount = (AtomicInteger) passwordRetryCache.get(username);
        AtomicLong createTime = (AtomicLong) passwordRetryCache.get(username + "_creat_time");
        AtomicLong lastTime = (AtomicLong) passwordRetryCache.get(username + "_last_time");
        if (retryCount == null) {
            retryCount = new AtomicInteger(0);
            passwordRetryCache.put(username, retryCount);
            passwordRetryCache.put(username + "_creat_time", new AtomicLong(System.currentTimeMillis()));
        }
        SysSetting settings =
                sysSettingService.selectOne(new EntityWrapper<SysSetting>().eq("sysKey", "MAX_LOGIN_RETRY_TIMES"));
        String maxLoginRetryTimes = settings.getSysValue();
        out:
        if (Integer.valueOf(maxLoginRetryTimes) < retryCount.incrementAndGet()) {
            SysSetting settings1 = sysSettingService
                    .selectOne(new EntityWrapper<SysSetting>().eq("sysKey", "ACCOUNT_LOGIN_LOCK_TIMES"));
            // 超过锁定时间，解除锁定
            if (lastTime != null && System.currentTimeMillis() - lastTime.longValue() >
                    TIME_MILLIS * Integer.valueOf(settings1.getSysValue())) {
                retryCount = new AtomicInteger(1);
                passwordRetryCache.put(username, retryCount);
                passwordRetryCache.put(username + "_creat_time", new AtomicLong(System.currentTimeMillis()));
                passwordRetryCache.remove(username + "_last_time");
                break out;
            }
            // 规定时间内连续输入错误，超过规定时间，则重新开始判断
            SysSetting setting =
                    sysSettingService.selectOne(new EntityWrapper<SysSetting>().eq("sysKey", "LOGIN_RETRY_TIMES_IN"));
            long c = System.currentTimeMillis() - createTime.longValue();
            if (lastTime == null && c > TIME_MILLIS * Integer.valueOf(setting.getSysValue())) {
                retryCount = new AtomicInteger(1);
                passwordRetryCache.put(username, retryCount);
                passwordRetryCache.put(username + "_creat_time", new AtomicLong(System.currentTimeMillis()));
                passwordRetryCache.remove(username + "_last_time");
                break out;
            }
            // if retry count > 5 throw
            if (lastTime == null) {
                passwordRetryCache.put(username + "_last_time", new AtomicLong(System.currentTimeMillis()));
            }
            throw new ExcessiveAttemptsException(setting.getSysDesc() + settings.getSysDesc() + settings1.getSysDesc());
        }
        boolean matches = super.doCredentialsMatch(token, info);
        if (matches) {
            // clear retry count
            passwordRetryCache.remove(username);
            passwordRetryCache.remove(username + "_creat_time");
            passwordRetryCache.remove(username + "_last_time");
            return matches;
        } else {
            throw new ExcessiveAttemptsException(
                    "用户名或密码错误，您还可以尝试登录" + (Integer.valueOf(maxLoginRetryTimes) - retryCount.intValue() + 1) + "次");
        }
    }
}
