package com.citysmart.ucenter.Interceptor;

import com.citysmart.ucenter.common.Util.SpringUtil;
import com.citysmart.ucenter.module.system.service.ISysSettingService;
import com.citysmart.ucenter.mybatis.model.SysSetting;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 全局拦截器
 */
@Component
public class GlobalInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

        if (handler instanceof HandlerMethod) {

            /**
             * 加载全局非登录访问常量
             */
            List<SysSetting> list = SpringUtil.getBean(ISysSettingService.class).findAll();
            for (SysSetting setting : list) {
                request.setAttribute(setting.getSysKey(), setting.getSysValue());
            }

            /**
             * 保存登录信息
             */

            TLjUser me = (TLjUser) request.getSession().getAttribute("user");
            request.setAttribute("me", me);

            /**
             * 资源和当前选中菜单
             */
            getOthenData(request);

        }

        /**
         * 通过拦截
         */
        return true;
    }

    /**
     * 封装其他数据
     *
     * @param request
     */
    public void getOthenData(HttpServletRequest request) {
//        TSysUser sysUser = SessionUtil.getSessionUser();
//        request.setAttribute("recordCount", SpringUtil.getBean(ITGovRecordService.class).getRecordCount(1, sysUser));
//        request.setAttribute("taskMyListCount", SpringUtil.getBean(ITGovRecordService.class).getRecordCount(2, sysUser));
//        request.setAttribute("certificateMakingListCount", SpringUtil.getBean(ITGovRecordService.class).getRecordCount(3, sysUser));
//        request.setAttribute("deliveryListCount", SpringUtil.getBean(ITGovRecordService.class).getRecordCount(4, sysUser));
//        Integer consultCount = SpringUtil.getBean(ITGovConsultService.class).consultCount(0, sysUser)
//                + SpringUtil.getBean(ITGovConsultService.class).consultCount(2, sysUser);
//        request.setAttribute("consultCount", consultCount);
//        Integer feedbackMsgCount = SpringUtil.getBean(ITAppFeedbackMsgService.class).countNoReply();
//        request.setAttribute("feedbackMsgCount", feedbackMsgCount);
    }

}
