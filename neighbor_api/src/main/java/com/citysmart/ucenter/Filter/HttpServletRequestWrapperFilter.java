//package com.citysmart.ucenter.Filter;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import java.io.IOException;
//
//@WebFilter(filterName = "httpServletRequestWrapperFilter", urlPatterns = { "/*" })
//public class HttpServletRequestWrapperFilter implements Filter {
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//
//        ServletRequest requestWrapper = null;
//        if (request instanceof HttpServletRequest) {
//            HttpServletRequest httpRequest = (HttpServletRequest) request;
//
//            // 遇到post方法才对request进行包装
//            String methodType = httpRequest.getMethod();
//            // 上传文件时同样不进行包装
//            String servletPath = httpRequest.getRequestURI().toString();
//            if ("POST".equals(methodType) && !servletPath.contains("/material/upload")) {
//                requestWrapper = new BodyReaderHttpServletRequestWrapper(
//                        (HttpServletRequest) request);
//            }
//        }
//
//        if (null == requestWrapper) {
//            chain.doFilter(request, response);
//        } else {
//            chain.doFilter(requestWrapper, response);
//        }
//
//    }
//
//    @Override
//    public void destroy() {
//
//    }
//}