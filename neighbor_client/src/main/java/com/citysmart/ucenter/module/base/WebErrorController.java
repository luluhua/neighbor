package com.citysmart.ucenter.module.base;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

/**
 * @author lub
 */
@Controller
public class WebErrorController implements ErrorController {
    public final static String ERRORMSG_KEY="msg";
    @Override
    public String getErrorPath() {
        return "/error";
    }
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());
            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                model.addAttribute(ERRORMSG_KEY,"错误码：404，糟糕,您访问的页面不存在");
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                model.addAttribute(ERRORMSG_KEY,"错误码：500，糟糕,服务器异常");
            }else if(statusCode == HttpStatus.FORBIDDEN.value()){
                model.addAttribute(ERRORMSG_KEY,"错误码：403，您没有访问权限");
            }
        }else{
            model.addAttribute(ERRORMSG_KEY,"服务器内部错误");
        }
        return "/base/error";
    }
}
