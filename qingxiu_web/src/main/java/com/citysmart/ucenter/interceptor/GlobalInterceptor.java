package com.citysmart.ucenter.interceptor;

import com.citysmart.ucenter.common.util.SessionUtil;
import com.citysmart.ucenter.common.util.SpringUtil;
import com.citysmart.ucenter.module.system.entity.vo.TreeMenu;
import com.citysmart.ucenter.module.system.service.ISysMenuService;
import com.citysmart.ucenter.module.system.service.ISysSettingService;
import com.citysmart.ucenter.mybatis.model.SysSetting;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import org.apache.commons.lang3.StringUtils;
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
//		//强制页面去除缓存
//		response.setDateHeader("Expires",0);
//		response.setHeader("Buffer","True");
//		response.setHeader("Cache-Control","no-cache");
//		response.setHeader("Cache-Control","no-store");
//		response.setHeader("Expires","0");
//		response.setHeader("ETag",String.valueOf(System.currentTimeMillis()));
//		response.setHeader("Pragma","no-cache");
//		response.setHeader("Date",String.valueOf(new Date()));
//		response.setHeader("Last-Modified",String.valueOf(new Date()));
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

            TSysUser me = (TSysUser) request.getSession().getAttribute("user");
            if (me == null) {
                return false;
            }
            request.setAttribute("me", me);
            /**
             * 资源和当前选中菜单
             */
            String res = request.getParameter("p");
            if (StringUtils.isNotBlank(res)) {
                request.getSession().setAttribute("res", res);
            }
            String cur = request.getParameter("t");
            if (StringUtils.isNotBlank(cur)) {
                request.getSession().setAttribute("cur", cur);
            }
            String cur1 = request.getParameter("p1");
            if (StringUtils.isNotBlank(cur1)) {
                request.getSession().setAttribute("cur1", cur1);
            }
//			getOthenData(request);
            /**
             * 获取当前用户的菜单
             */
            List<TreeMenu> treeMenus = SpringUtil.getBean(ISysMenuService.class).selectTreeMenuByUserId(me.getId());
            request.setAttribute("treeMenus", treeMenus);
        }

        /**
         * 通过拦截
         */
        return true;
    }

    /**
     * 封装其他数据
     * @param request
     */
//	public void getOthenData(HttpServletRequest request){
//		TSysUser sysUser = SessionUtil.getSessionUser();
//		request.setAttribute("recordCount",SpringUtil.getBean(ITGovRecordService.class).getRecordCount(1,sysUser));
//		request.setAttribute("taskMyListCount",SpringUtil.getBean(ITGovRecordService.class).getRecordCount(2,sysUser));
//		request.setAttribute("certificateMakingListCount",SpringUtil.getBean(ITGovRecordService.class).getRecordCount(3,sysUser));
//		request.setAttribute("deliveryListCount",SpringUtil.getBean(ITGovRecordService.class).getRecordCount(4,sysUser));
//		Integer consultCount= SpringUtil.getBean(ITGovConsultService.class).consultCount(0, sysUser)
//				+ SpringUtil.getBean(ITGovConsultService.class).consultCount(2, sysUser);
//		request.setAttribute("consultCount",consultCount);
//		Integer feedbackMsgCount= SpringUtil.getBean(ITAppFeedbackMsgService.class).countNoReply();
//		request.setAttribute("feedbackMsgCount",feedbackMsgCount);
//	}

}
