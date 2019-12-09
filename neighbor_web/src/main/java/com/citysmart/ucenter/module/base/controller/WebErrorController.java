package com.citysmart.ucenter.module.base.controller;

import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

/**
 * 错误控制器
 *
 * @author Gaojun.Zhou
 * @date 2016年12月14日 下午6:06:01
 */
@Controller
public class WebErrorController extends SuperController implements ErrorController {
    public final static String ERRORMSG_KEY = "errorMsg";

    @RequestMapping(value = "/{code}")
    public String index(@PathVariable String code, Model model) {
        return "/" + code;
    }

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        TSysUser me = (TSysUser) request.getSession().getAttribute("user");
        if(me == null){
            return redirectTo("/login");
        }
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());
            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                return "/error/404";
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                model.addAttribute(ERRORMSG_KEY, "服务器内部错误");
                return "/error/500";
            } else if (statusCode == HttpStatus.FORBIDDEN.value()) {
                return "/error/illegalAccess";
            }
        }
        model.addAttribute(ERRORMSG_KEY, "服务器内部错误");
//        return "/error/error";
        return "/error/500";
    }

    @RequestMapping(value = "/error/illegalAccess")
    public String error() {
        return "/error/illegalAccess";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}
