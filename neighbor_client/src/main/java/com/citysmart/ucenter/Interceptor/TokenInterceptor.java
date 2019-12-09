package com.citysmart.ucenter.Interceptor;

import com.citysmart.ucenter.common.Util.ShiroUtil;
import com.citysmart.ucenter.common.anno.AppLogin;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TokenInterceptor implements HandlerInterceptor {
    private Logger logger = LoggerFactory.getLogger(this.getClass());


    //拦截每个请求
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        if (handler instanceof HandlerMethod) {
            HandlerMethod h = (HandlerMethod) handler;
            Object o = h.getMethodAnnotation(AppLogin.class);
            if (null == o) {
                return true;
            }
            boolean fa = h.getMethodAnnotation(AppLogin.class).isLoginIn();
            if (fa) {
                response.setCharacterEncoding("utf-8");
                String token = ShiroUtil.getToken();
//                logger.info("H5->TOKEN:" + token);
                //是否ajax請求
                if (isAjaxRequest(request)) {
                    if (StringUtils.isBlank(token)) {
                        responseAjax401(request, response);
                        return false;
                    }
                }

                if (StringUtils.isBlank(token)) {
                    response401(request, response);
                    return false;
                }
                //验证token是否合法
                if (!ShiroUtil.tokenVerify()) {
//                    logger.info("H5->TOKEN不合法:");
                    response401(request, response);
                }
            }
        }
        return true;
    }

    /**
     * 将非法请求跳转到 /401
     */
    private void response401(ServletRequest req, ServletResponse resp) {
        try {
            HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
            httpServletResponse.sendRedirect(ShiroUtil.ACCESS_PREFIX + "/common/401");
        } catch (IOException e) {
            logger.error(e.getMessage());
        }
    }

    /**
     * 将非法请求跳转到 /ajax401
     */
    private void responseAjax401(ServletRequest req, ServletResponse resp) {
        try {
            HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
            httpServletResponse.sendRedirect(ShiroUtil.ACCESS_PREFIX + "/common/ajax_401");
        } catch (IOException e) {
            logger.error(e.getMessage());
        }
    }

    /**
     * 是否ajax請求
     *
     * @param request
     * @return
     */
    public static boolean isAjaxRequest(HttpServletRequest request) {
        String requestedWith = request.getHeader("x-requested-with");
        if (requestedWith != null && "XMLHttpRequest".equalsIgnoreCase(requestedWith)) {
            return true;
        } else {
            return false;
        }
    }


}