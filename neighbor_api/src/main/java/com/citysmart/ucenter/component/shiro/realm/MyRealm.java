package com.citysmart.ucenter.component.shiro.realm;

import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.component.jwt.JWTUtil;
import com.citysmart.ucenter.common.util.RedisUtil;
import com.citysmart.ucenter.component.jwt.JWTToken;
import com.citysmart.ucenter.module.appc.service.ITAppUserService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.TAppUser;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.tomcat.util.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;

/**
 * shiro Realm
 *
 * @author liuguicheng
 */
public class MyRealm extends AuthorizingRealm {
    private Logger logger = LoggerFactory.getLogger(MyRealm.class);
    /**
     * app用户服务
     */
    @Autowired
    private ITAppUserService appUserService;

    /**
     * 必须重写此方法，不然Shiro会报错
     */
    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JWTToken;
    }

    /**
     * 认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken auth) throws AuthenticationException {
        String token = (String) auth.getCredentials();
        byte[] src = Base64.decodeBase64(token);
        DecodedJWT jwt = JWT.decode(new String(src));
        // 1. 是否过期
        boolean shouldRefresh = JWTUtil.shouldTokenRefresh(jwt.getExpiresAt(), Long.valueOf(RedisUtil.getValueByKey("jwt.expire.time")));
        logger.info("过期时间=" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(jwt.getExpiresAt()));
        logger.info("是否过期=" + shouldRefresh);
        if (shouldRefresh) {
            RedisUtil.delKey(token);
//            CookieUtils.removeCookie(ShiroUtil.COOKIE_NAME);
            throw new AuthenticationException("请重新登录");
        }
        // 2. 还原 gid
        String gid = JWTUtil.getGid(token);
        // 3. 查询用户 user
        TAppUser tAppUser = getUser(gid);
        if (tAppUser == null) {
            throw new AuthenticationException("请重新登录");
        }
        if (!JWTUtil.verify(token, gid, tAppUser.getPassword())) {
            throw new AuthenticationException("请重新登录");
        }
        return new SimpleAuthenticationInfo(tAppUser, token, gid);
    }

    private TAppUser getUser(String gid) {
        return appUserService.selectOne(new EntityWrapper<TAppUser>().eq("gid", gid).eq("is_deleted", Delete.未删除));
    }


    /**
     * 授权(暂未用到)
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        // TODO Auto-generated method stub
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        return simpleAuthorizationInfo;
    }

    /**
     * 更新用户授权信息缓存.
     */
    public void clearCachedAuthorizationInfo(String principal) {
        SimplePrincipalCollection principals = new SimplePrincipalCollection(principal, getName());
        clearCachedAuthorizationInfo(principals);
    }

    /**
     * 清除所有用户授权信息缓存.
     */
    public void clearAllCachedAuthorizationInfo() {
        Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
        if (cache != null) {
            for (Object key : cache.keys()) {
                cache.remove(key);
            }
        }
    }

}
