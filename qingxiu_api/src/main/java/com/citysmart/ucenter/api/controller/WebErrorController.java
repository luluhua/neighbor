package com.citysmart.ucenter.api.controller;

import com.citysmart.common.json.JsonFailResult;
import com.citysmart.common.json.JsonResult;
import io.swagger.annotations.Api;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

/**
 * 错误控制器
 *
 * @author Gaojun.Zhou
 * @date 2016年12月14日 下午6:06:01
 */
@Api(tags = "98、统一错误接口")
@RestController
public class WebErrorController implements ErrorController {
    @RequestMapping(value = "/error",method = {RequestMethod.POST,RequestMethod.GET})
    public JsonResult handleError(HttpServletRequest request) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());
            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                return new JsonFailResult("您所访问的资源不存在");
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                return new JsonFailResult("服务运行异常，请稍后重试");
            }else if(statusCode == HttpStatus.FORBIDDEN.value()){
                return new JsonFailResult("您没有权限访问");
            }
        }
        return new JsonFailResult("系统出错了，请稍后重试");
    }
    @Override
    public String getErrorPath() {
        return "/error";
    }
}
