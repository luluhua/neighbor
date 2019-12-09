package com.citysmart.ucenter.common.util;

import com.citysmart.ucenter.common.HttpHelper;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Shiro工具类
 *
 * @author jameszhou
 */
@Configuration
public class ShiroUtil {
    static Logger logger = LoggerFactory.getLogger(ShiroUtil.class);

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
