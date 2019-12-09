package com.citysmart.ucenter.common.aspect;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.util.IpUtil;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.common.util.SpringUtil;
import com.citysmart.ucenter.module.appc.service.ITAppApiLogService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.TAppApiLog;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.*;

/**
 * 接口日志记录
 *
 * @author lgc
 */
@Order(1)
@Aspect
@Component
public class LogAdvice {

    public static final Logger LOG = Logger.getLogger(LogAdvice.class);

    @Pointcut("@annotation(com.citysmart.ucenter.common.anno.Log)")
    public void controllerAspect() {

    }

    /***
     * @Author liuguicheng
     * @Description //TODO 统计请求的处理时间
     * @Date 14:31 2019/8/21
     **/
    ThreadLocal<Long> startTime = new ThreadLocal<>();
    ThreadLocal<Integer> logIds = new ThreadLocal<>();

    /**
     * 当方法正常返回是执行
     *
     * @param joinPoint
     */
    @Before("controllerAspect()")
    public void doBefore(JoinPoint joinPoint) {
        startTime.set(System.currentTimeMillis());
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Log log = method.getAnnotation(Log.class);
        try {
            if (log != null) {
                addLog(request, log, 1, "");
            }
        } catch (Exception e) {
            addLog(request, log, 0, e.getMessage());
            LOG.debug("记录日志异常:" + e.getMessage());
        }

    }

    /***
     * @Author liuguicheng
     * @Description //TODO 方法执行后 执行以下逻辑
     * @Date 14:34 2019/8/21
     **/
    @AfterReturning(returning = "ret", pointcut = "controllerAspect()")
    public void doAfterReturning(Object ret) {
        //处理完请求后，返回内容
//		LOG.debug("方法返回值:"+ JSON.toJSONString(ret));
        logUpdateMethodTaking(logIds.get(), (System.currentTimeMillis() - startTime.get()));
    }


    public static Map<String, Object> showParams(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>(16);
        Enumeration paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();

            String[] paramValues = request.getParameterValues(paramName);
            if (paramValues.length > 0) {
                String paramValue = paramValues[0];
                if (paramValue.length() != 0) {
                    map.put(paramName, paramValue);
                }
            }
        }
        return map;
    }


    private void addLog(HttpServletRequest request, Log log, Integer isOk, String errmsg) {
        //客户端标识
        String appType = request.getHeader("p");
        String v = request.getHeader("v");
        String cid = request.getHeader("cid");
        String osv = request.getHeader("osv");
        String osm = request.getHeader("osm");
        String deviceToken = request.getHeader("deviceToken");
        String packageValue = request.getHeader("pk");
        if (StringUtils.isBlank(packageValue)) {
            //未知包名
            packageValue = "-1";
        }
        if (StringUtils.isBlank(appType)) {
            appType = "0";
        }
        TAppApiLog sysLog = new TAppApiLog();
        sysLog.setIp(IpUtil.getIpAddr(request));
        sysLog.setDtCreate(new Date());
        sysLog.setUrl(request.getRequestURI());
        sysLog.setIsOk(isOk);
        sysLog.setTitle(log.value());
        sysLog.setOrigin(1);
        sysLog.setAppType(Integer.parseInt(appType));
        sysLog.setIsDeleted(Delete.未删除.getValue());
        if (log.parameter()) {
            sysLog.setParameter(JSON.toJSONString(showParams(request)));
        } else {
            sysLog.setParameter("{}");
        }
        sysLog.setAppVersion(v);
        sysLog.setClientId(cid);
        sysLog.setPackageName(Integer.parseInt(packageValue));
        if (StringUtils.isBlank(errmsg)) {
            sysLog.setErrmsg(errmsg);
        }
        if (StringUtils.isNotBlank(deviceToken)) {
            sysLog.setDeviceToken(deviceToken);
        }
        sysLog.setMobileModel(osm);
        sysLog.setMobileSystemVersion(osv);
        SpringUtil.getBean(ITAppApiLogService.class).insert(sysLog);
//		LOG.error(">>>>>> api接口日志保存结果："+sysLog.toString());
        if (sysLog.getId() != null) {
            logIds.set(sysLog.getId());
        }
    }

    /***
     * @Author liuguicheng
     * @Description //TODO 更新 方法执行耗时
     * @Date 14:49 2019/8/21
     * @Param [logId, taking] 日志记录id 耗时
     **/
    private void logUpdateMethodTaking(Integer logId, Long taking) {
        if (logId == null || taking == null) {
            return;
        }
        TAppApiLog sysLog = new TAppApiLog();
        sysLog.setTaking(taking);
        sysLog.setId(logId);
        SpringUtil.getBean(ITAppApiLogService.class).updateById(sysLog);
    }
}
