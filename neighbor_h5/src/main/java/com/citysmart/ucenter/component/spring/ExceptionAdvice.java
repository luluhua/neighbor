package com.citysmart.ucenter.component.spring;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author lub
 */
@ControllerAdvice
public class ExceptionAdvice {
    private static final Logger logger = LoggerFactory.getLogger(ExceptionAdvice.class);
    /**
     * 异常捕获
     * @param ex
     * @return
     */
    @ExceptionHandler(value = Exception.class)
    public ModelAndView exceptionHandle(Exception ex) {
        logger.error(ex.getMessage());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/base/error");
        modelAndView.addObject("msg", ex.getMessage());
        return modelAndView;
    }
}
