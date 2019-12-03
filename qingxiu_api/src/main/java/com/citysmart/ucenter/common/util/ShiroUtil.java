package com.citysmart.ucenter.common.util;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.component.jwt.JWTUtil;
import com.citysmart.common.util.CookieUtils;
import com.citysmart.ucenter.common.HttpHelper;
import com.citysmart.ucenter.module.appc.service.ITAppUserService;
import com.citysmart.ucenter.mybatis.model.TAppUser;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;

/**
 * Shiro工具类
 * @author jameszhou
 *
 */
public class ShiroUtil {

    private static  ITAppUserService appUserService=SpringUtil.getBean(ITAppUserService.class);
    private static Logger logger = LoggerFactory.getLogger(ShiroUtil.class);
    public static  final  String COOKIE_NAME="token";
    public static final String ACCESS_PREFIX="/api";
    public static TAppUser getTAppUser(){
        String token = getToken();
        if(StringUtils.isBlank(token)){
            return null;
        }
        String gid= JWTUtil.getGid(token);
        if(StringUtils.isBlank(gid)){
            return null;
        }
        TAppUser tAppUser=  appUserService.selectOne(new EntityWrapper<TAppUser>().eq("gid",gid));
        return tAppUser;
    }

    /**
     * 获取 客户端token
     * @return
     */
    public static String getToken(){
        String token =  HttpHelper.getHttpServletRequest().getHeader(ShiroUtil.COOKIE_NAME);
        return  token;
    }

    /**
     * 根据token 还原 gid
     * @return
     */
    public static String getGidByToken(){
        String token = getToken();
        if(StringUtils.isBlank(token)){
            return null;
        }
        String gid= JWTUtil.getGid(token);
        if(StringUtils.isBlank(gid)){
            return null;
        }
        return  gid;
    }
}
