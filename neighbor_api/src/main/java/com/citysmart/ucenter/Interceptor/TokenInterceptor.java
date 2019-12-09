package com.citysmart.ucenter.Interceptor;

import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.citysmart.common.component.jwt.JWTUtil;
import com.citysmart.common.util.CookieUtils;
import com.citysmart.common.util.Encryption3DEsUtil;
import com.citysmart.common.util.IpUtil;
import com.citysmart.ucenter.common.HttpHelper;
import com.citysmart.ucenter.common.anno.AppLogin;
import com.citysmart.ucenter.common.anno.RepeatedSubmission;
import com.citysmart.ucenter.common.util.RedisUtil;
import com.citysmart.ucenter.common.util.ShiroUtil;
import com.citysmart.ucenter.component.jwt.JWTToken;
import com.citysmart.ucenter.mybatis.model.TAppUser;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.subject.Subject;
import org.apache.tomcat.util.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;

public class TokenInterceptor implements HandlerInterceptor {
    private Logger LOGGER = LoggerFactory.getLogger(this.getClass());



    //拦截每个请求
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        if(handler instanceof HandlerMethod) {
            HandlerMethod h = (HandlerMethod)handler;
            //重复请求验证
            if(!checkRepeatedSubmission(request,response,h)){
                response601(request,response);
                return false;
            }
            Object o=h.getMethodAnnotation(AppLogin.class);
            if(null==o){return true;}
            boolean fa=h.getMethodAnnotation(AppLogin.class).isLoginIn();
            if(fa) {
                try {
                    response.setCharacterEncoding("utf-8");
                    String token = ShiroUtil.getToken();
                    //token不存在
                    if (StringUtils.isBlank(token)) {
                        response401(request, response);
                        return false;
                    }
                    byte[] src = Base64.decodeBase64(token);
                    DecodedJWT jwt = JWT.decode(new String(src));
                    // 1. 是否过期
                    boolean shouldRefresh = JWTUtil.shouldTokenRefresh(jwt.getExpiresAt(), Long.valueOf(RedisUtil.getValueByKey("jwt.expire.time")));
                    if (shouldRefresh) {
                        //已过期，重新登录
                        response401(request, response);
                        return false;
                    }
                }catch (Exception e){
                    LOGGER.error("验证token异常:"+e.getMessage());
                    response401(request, response);
                    return false;
                }
            }
        }
        return true;
    }


    /***
     * @Author liuguicheng
     * @Description //TODO 验证是否重复提交
     * @Date 18:44 2019/8/21
     **/
    private boolean checkRepeatedSubmission(HttpServletRequest request, HttpServletResponse response,HandlerMethod h){
        RepeatedSubmission repeatedSubmission =h.getMethodAnnotation(RepeatedSubmission.class);
        try {
            if (repeatedSubmission != null) {
                StringBuffer stringBuffer=new StringBuffer();
                //获取request Payload中的值
                String requestPayloadStr=getRequestPams(request);
                //参数不存在，则跳过重复提交验证
                if(StringUtils.isBlank(requestPayloadStr)){return true;}
                //获取请求url
                String url=request.getRequestURI();
                //获取用户GID
                String gid=ShiroUtil.getGidByToken();
                String requestPayloadStrMD5="";
                //获取请求ip
                String ip=IpUtil.getIpAddr(request);
                if(StringUtils.isNotBlank(requestPayloadStr)){
                    //request Payload中的值 md5 加密
                    requestPayloadStrMD5=DigestUtils.md5Hex(requestPayloadStr).toUpperCase();
                }
                stringBuffer.append(url).append(requestPayloadStrMD5).append(ip).append(gid);
                String redisMd5=DigestUtils.md5Hex(stringBuffer.toString()).toUpperCase();
                String redisStr=RedisUtil.getValueByKey(redisMd5);
                if(StringUtils.isBlank(redisStr)){
                    //10秒内自动过期，10秒内相同参数、ip请求认定为重复请求
                    RedisUtil.setKeyValue(redisMd5,stringBuffer.toString(),100);
                    return true;
                }else{
                    return false;
                }
            }
        }catch (Exception e){
            LOGGER.debug("防重复提交异常:" + e.getMessage());
            return false;
        }
        return true;
    }
    /**
     * 将非法请求跳转到 /401
     */
    private void response401(ServletRequest req, ServletResponse resp) {
        try {
            HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
            httpServletResponse.sendRedirect(ShiroUtil.ACCESS_PREFIX+"/common/401");
        } catch (IOException e) {
            LOGGER.error(e.getMessage());
        }
    }
    /**
     * 将非法请求跳转到 /錯誤提示頁面
     */
    private void responseError(ServletRequest req, ServletResponse resp, String errorMsg) {
        try {
            HttpServletRequest request1 = (HttpServletRequest) req;
            request1.getRequestDispatcher("/common/error?msg="+ URLEncoder.encode(errorMsg, "utf-8")).forward(req, resp);
        } catch (Exception e){
            LOGGER.error(e.getMessage());
        }
    }
    /***
     * @Author liuguicheng
     * @Description //TODO  获取请求参数
     * @Date 11:54 2019/8/21
     **/
    private String getRequestPams(HttpServletRequest req) {
        Map<String, String[]> maps = req.getParameterMap();
        Iterator<String> iterator = maps.keySet().iterator();
        StringBuffer stringBuffer=new StringBuffer();
        while (iterator.hasNext()) {
            String key = iterator.next();
            String mapVal = maps.get(key)[0];
            stringBuffer.append(key).append(":").append(mapVal);
        }
        return stringBuffer.toString();
    }
    /***
     * @Author liuguicheng
     * @Description //TODO  重复提交提示
     * @Date 11:26 2019/8/21
     **/
    private void response601(ServletRequest req, ServletResponse resp) {
        try {
            HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
            httpServletResponse.sendRedirect(ShiroUtil.ACCESS_PREFIX+"/common/601");
        } catch (IOException e) {
            LOGGER.error(e.getMessage());
        }
    }

}