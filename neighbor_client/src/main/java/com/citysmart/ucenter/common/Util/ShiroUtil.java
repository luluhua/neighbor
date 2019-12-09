package com.citysmart.ucenter.common.Util;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.component.jwt.JWTUtil;
import com.citysmart.common.util.CookieUtils;
import com.citysmart.common.util.HttpClientUtil;
import com.citysmart.ucenter.common.HttpHelper;
import com.citysmart.ucenter.module.appc.service.ITAppUserService;
import com.citysmart.ucenter.mybatis.model.TAppUser;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * Shiro工具类
 *
 * @author jameszhou
 */
public class ShiroUtil {
    ;
    private static ITAppUserService appUserService = SpringUtil.getBean(ITAppUserService.class);
    private static Logger logger = LoggerFactory.getLogger(ShiroUtil.class);
    public static final String COOKIE_NAME = "token";
    public static final String ACCESS_PREFIX = "/m";

    public static TAppUser getTAppUser() {
        String token = getToken();
        if (StringUtils.isBlank(token)) {
            return null;
        }
        String gid = JWTUtil.getGid(token);
        if (StringUtils.isBlank(gid)) {
            return null;
        }
        TAppUser tAppUser = appUserService.selectOne(new EntityWrapper<TAppUser>().eq("gid", gid));
        return tAppUser;
    }


    public static boolean tokenVerify() {
        //未登录
        boolean fa = false;
        try {
            String token = getToken();
            Map<String, Object> map = new HashMap(1);
            map.put(ShiroUtil.COOKIE_NAME, token);
            String url = RedisUtil.getValueByKey("api.url") + "/auth/token_verify";
            JSONObject jsonObject = JSONObject.parseObject(HttpClientUtil.doGet(url, map));
            if (jsonObject != null) {
                int code = Integer.parseInt(jsonObject.get("code").toString());
                if (code == 0) {
                    fa = true;
                }
            }
        } catch (Exception e) {
            logger.error("H5->token验证失败,错误提示：" + e.getMessage());
        }
        return fa;

    }

    /**
     * 获取 客户端token
     *
     * @return
     */
    public static String getToken() {
        String token = HttpHelper.getHttpServletRequest().getHeader(ShiroUtil.COOKIE_NAME);
        if (StringUtils.isBlank(token)) {
            //token不存在，从服务器cookice获取
            token = CookieUtils.getCookie(ShiroUtil.COOKIE_NAME);
        } else {
            //token 存在 判断服务器cookice是否存在
            String ct = CookieUtils.getCookie(ShiroUtil.COOKIE_NAME);
            if (StringUtils.isBlank(ct)) {
                //不存在则添加进入 服务器cookice
                //cookice 失效时间为关闭页面就失效
                CookieUtils.addCookieInSession(ShiroUtil.COOKIE_NAME, token);
            }
        }
        return token;
    }

    public static TLjUser getSessionUser() {
        try {
            Subject subject = SecurityUtils.getSubject();
            if (subject != null) {
                Object object = subject.getPrincipal();
                if (object != null) {
                    TLjUser ljUser = (TLjUser) object;
                    HttpHelper.getHttpServletRequest().getSession().setAttribute("user", ljUser);
                    /*秒为单位*/
//                    HttpHelper.getHttpServletRequest().getSession().setMaxInactiveInterval(60);
                    return ljUser;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
