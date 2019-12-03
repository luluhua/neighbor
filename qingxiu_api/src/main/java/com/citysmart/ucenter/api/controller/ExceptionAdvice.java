package com.citysmart.ucenter.api.controller;

import com.citysmart.common.json.JsonFailResult;
import com.citysmart.common.json.JsonResult;
import org.apache.log4j.Logger;
import org.apache.shiro.ShiroException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.ui.Model;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.validation.ValidationException;

/**
 * @author
 * 全局异常处理器
 *
 * @author liuguicheng
 */
@RestControllerAdvice
public class ExceptionAdvice {

    public static final Logger logger = Logger.getLogger(ExceptionAdvice.class);

    /**
     * 400 - Bad Request
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(ValidationException.class)
    public JsonResult handleValidationException(ValidationException e) {
        String errorMsg = "参数验证失败," + e.getMessage();
        logger.error(errorMsg);
        return new JsonFailResult(400, "参数验证失败");
    }

    /**
     * 400 - Bad Request
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public JsonResult handleHttpMessageNotReadableException(HttpMessageNotReadableException e, Model model) {
        String errorMsg = "参数解析失败," + e.getMessage();
        logger.error(errorMsg);
        return new JsonFailResult(400, "参数解析失败");
    }

    /**
     * 405 - Method Not Allowed
     */
    @ResponseStatus(HttpStatus.METHOD_NOT_ALLOWED)
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public JsonResult handleHttpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException e) {
        String errorMsg = "不支持当前请求方法," + e.getMessage();
        logger.error(errorMsg);
        return new JsonFailResult(405, "不支持当前请求方法");
    }

    /**
     * 415 - Unsupported Media Type
     */
    @ResponseStatus(HttpStatus.UNSUPPORTED_MEDIA_TYPE)
    @ExceptionHandler(HttpMediaTypeNotSupportedException.class)
    public JsonResult handleHttpMediaTypeNotSupportedException(Exception e) {
        String errorMsg = "不支持当前媒体类型," + e.getMessage();
        logger.error(errorMsg);
        return new JsonFailResult(415, "不支持当前媒体类型");
    }


    /**
     * 404 - Not Found
     */
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(NoHandlerFoundException.class)
    public JsonResult handleNoHandlerFoundException(NoHandlerFoundException e) {
        String errorMsg = "空指针异常," + e.getMessage();
        logger.error(errorMsg);
        return new JsonFailResult(-1, "接口异常");

    }



    /**
     * 500
     */
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(Exception.class)
    public JsonResult handleException(Exception e){
        try {
            e.printStackTrace();
            logger.error("服务运行异常，部分异常信息："+e.getMessage());
        }finally {
            return new JsonFailResult(-1, "接口异常");
        }
    }
    /***
     * @Author liuguicheng
     * @Description //TODO 502 异常
     * @Date 11:57 2019/10/21
     **/
//    @ResponseStatus(HttpStatus.BAD_GATEWAY)
//    @ExceptionHandler(Exception.class)
//    public JsonResult handle502Exception(Exception e) {
//        try {
//            e.printStackTrace();
//            logger.error("服务运行异常,部分异常信息："+e.getMessage());
//        }finally {
//            return new JsonFailResult(-1, "资源不存在");
//        }
//    }
    /**
     * 捕捉shiro的异常
     * @param e
     * @return
     */
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ExceptionHandler(ShiroException.class)
    public JsonResult handle401(ShiroException e) {
        logger.error(e.getMessage());
        return new JsonFailResult(JsonResult.NO_LOGIN_CODE, "您没有权限访问");
    }

    /**
     * 捕捉UnauthorizedException
     * @return
     */
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ExceptionHandler(UnauthorizedException.class)
    public JsonResult handle401() {
        String errorMsg = "捕捉UnauthorizedException异常";
        logger.error(errorMsg);
        return new JsonFailResult(-1, "接口异常");
    }





}
