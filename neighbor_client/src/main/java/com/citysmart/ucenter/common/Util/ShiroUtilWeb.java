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
public class ShiroUtilWeb {
    static Logger logger = LoggerFactory.getLogger(ShiroUtilWeb.class);

    /**
     * 获取当前Session中的用户
     *
     * @return
     */
    public static final String COOKIE_NAME = "token";

    public static TSysUser getSessionUser() {
        try {
            Subject subject = SecurityUtils.getSubject();
            if (subject != null) {
                Object object = subject.getPrincipal();
                if (object != null) {
                    TSysUser sysUser = (TSysUser) object;
                    HttpHelper.getHttpServletRequest().getSession().setAttribute("user", sysUser);
                    /*秒为单位*/
//                    HttpHelper.getHttpServletRequest().getSession().setMaxInactiveInterval(60);
                    return sysUser;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取当前用户ID
     *
     * @return
     */
    public static Integer getSessionUid() {

        TSysUser sysUser = getSessionUser();

        if (sysUser != null) {

            return sysUser.getId();
        }

        return null;
    }

}
