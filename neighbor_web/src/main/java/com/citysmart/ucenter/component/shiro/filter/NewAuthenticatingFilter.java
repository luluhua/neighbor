package com.citysmart.ucenter.component.shiro.filter;

import com.citysmart.ucenter.mybatis.model.TSysUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

public class NewAuthenticatingFilter extends FormAuthenticationFilter {
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        if (this.isLoginRequest(request, response)) {
            if (this.isLoginSubmission(request, response)) {
                return this.executeLogin(request, response);
            } else {
                return true;
            }
        } else {
            Subject subject = SecurityUtils.getSubject();
            if (subject != null) {
                Object object = subject.getPrincipal();
                if (object != null) {
                    TSysUser sysUser = (TSysUser) object;
                    if (sysUser != null) {
                        return true;
                    }
                }
            }
            this.saveRequestAndRedirectToLogin(request, response);
            return false;

        }
    }

    @Override
    protected void saveRequestAndRedirectToLogin(ServletRequest request, ServletResponse response) throws IOException {
        this.saveRequest(request);
        String url = getLoginUrl();
        WebUtils.issueRedirect(request, response, url);
    }

}
