//package com.citysmart.ucenter.Interceptor;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.Map;
//
///**
// * @author li
// * @date 2019/3/19
// */
//@Controller
//public class ActionLogInterceptor implements HandlerInterceptor {
//
//
//    private boolean open = true;
//
//    private long startTime = 0;
//    private String url = null;
//    private String viewName = null;
//    private Date date = null;
//
//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o) throws Exception {
//        startTime = System.currentTimeMillis();
//        date = new Date();
//        return true;
//    }
//
//    @Override
//    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
//        if (modelAndView != null)
//            viewName = modelAndView.getViewName();
//    }
//
//    @Override
//    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception e) throws Exception {
//        if (!open) {
//            return;
//        }
//
//        url = request.getRequestURI();
//
//        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss S");
//        System.out.println("--------------------------action请求----------------------------:" + dateFormat.format(date));
//        String str = "";
//        if (handler != null) {
//            str = handler.toString().trim();
//            //去掉修饰符和参数
//            int index = str.indexOf(" ");
//            if (index != -1) str = str.substring(index, str.length() - 1).trim();
//            index = str.indexOf(" ");
//            if (index != -1) str = str.substring(index + 1, str.length() - 1).trim();
//            index = str.indexOf("(");
//            if (index != -1) str = str.substring(0, index).trim();
//        }
//        System.out.println("url: " + url);
//        System.out.println("method: " + request.getMethod());
//        System.out.println("调用方法：" + str);
//        System.out.println("参数：");
//        Map parameterMap = request.getParameterMap();
//        for (Object key : parameterMap.keySet()) {
//            String name = (String) key;
//            String value = request.getParameter(name);
//            System.out.println(name + " : " + value);
//        }
//
//        if (viewName != null)
//            System.out.println("viewName: " + viewName);
//        System.out.println("耗时：" + (System.currentTimeMillis() - startTime) + "毫秒");
//        System.out.println("------------------------------------------------------: " + dateFormat.format(new Date()));
//
//    }
//
//}
