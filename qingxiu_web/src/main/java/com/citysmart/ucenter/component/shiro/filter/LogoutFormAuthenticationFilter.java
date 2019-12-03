package com.citysmart.ucenter.component.shiro.filter;

import com.citysmart.common.json.JsonSuccessResult;
import com.citysmart.common.util.CookieUtils;
import com.citysmart.ucenter.common.util.RedisUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * 登出判断是否从手机端发起的请求，
 * 从而跳转到不同的登录页面
 * */
public class LogoutFormAuthenticationFilter extends LogoutFilter {
    private static Logger logger = LoggerFactory.getLogger(LogoutFormAuthenticationFilter.class);

    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest req = (HttpServletRequest) request;
        Subject currentUser = SecurityUtils.getSubject();
        if("/logOutApp".equals(req.getRequestURI())){
            //清空用户的session信息
            if (currentUser!=null&&currentUser.isAuthenticated()) {
                String token = CookieUtils.getCookie("token");
                currentUser.logout();
                RedisUtil.delKey(token);
                CookieUtils.removeCookie("token");
                CookieUtils.removeCookie("gid");
            }
            issueRedirect(request, response, "/loginApp");
        } else if(req.getRequestURI().contains("/indexApp")){
            if(currentUser==null||!currentUser.isAuthenticated()){
                issueRedirect(request, response, "/loginApp");
            }else{
                return true;
            }
        }
        else{
            issueRedirect(request, response, "/login");
        }
        return false;
    }
}
