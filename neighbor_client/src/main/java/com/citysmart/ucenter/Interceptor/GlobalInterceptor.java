package com.citysmart.ucenter.Interceptor;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.ucenter.common.Util.PWDStrongUtil;
import com.citysmart.ucenter.common.Util.RedisUtil;
import com.citysmart.ucenter.common.Util.SpringUtil;
import com.citysmart.ucenter.module.appc.service.ITLjUserInfoService;
import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import com.citysmart.ucenter.module.system.service.ISysSettingService;
import com.citysmart.ucenter.module.system.service.ITNavigationService;
import com.citysmart.ucenter.module.system.service.ITSysUserLogService;
import com.citysmart.ucenter.module.system.service.ITTagService;
import com.citysmart.ucenter.mybatis.entity.vo.LjUserVO;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.SysCity;
import com.citysmart.ucenter.mybatis.model.SysSetting;
import com.citysmart.ucenter.mybatis.model.TNavigation;
import com.citysmart.ucenter.mybatis.model.TTag;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUserInfo;
import com.citysmart.ucenter.mybatis.model.app.TLjUserSecurity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 全局拦截器
 */
@Component
public class GlobalInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private ITLjUserInfoService infoService;
    public final static String ICON_PREFIX = RedisUtil.getValueByKey("http.img.url");

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
            if (me != null) {
                TLjUserInfo info = infoService.selectOne(new EntityWrapper<TLjUserInfo>().eq("user_id", me.getId()));
                LjUserVO user = new LjUserVO();
                user.setId(me.getId());
                user.setMobile(me.getMobile());
                user.setUserName(PWDStrongUtil.Decrypt3DEs(me.getUsername()));
                if (info != null) {
                    user.setNickname(info.getNickname());
                    user.setAvatarUrl(ICON_PREFIX + info.getAvatarUrl());
                }
                request.setAttribute("me", user);
            }


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
    @Autowired
    private ITNavigationService navigationService;
    @Autowired
    private ITTagService tagService;

    public void getOthenData(HttpServletRequest request) {
        List<TNavigation> navigationsList = navigationService.selectList(new EntityWrapper<TNavigation>().eq("is_deleted", Delete.未删除).orderBy("sort_index", false));
        List navigation = new ArrayList();
        Map<String, Object> maps = new HashMap(16);
        for (TNavigation navigations : navigationsList) {
            Map<String, Object> map = new HashMap(16);
            List<TTag> tagList = tagService.selectList(new EntityWrapper<TTag>().eq("is_deleted", Delete.未删除).orderBy("sort_index", false).eq("navigation_id", navigations.getId()));
            List tagListyt = new ArrayList();
            for (TTag tag : tagList) {
                Map<String, Object> tagmap = new HashMap(16);
                tagmap.put("tagName", tag.getName());
                tagmap.put("tagIcon", tag.getIcon());
                tagmap.put("id", tag.getId());
                tagmap.put("tagSkipUrl", tag.getSkipUrl());
                tagListyt.add(tagmap);
            }

            map.put("navigationName", navigations.getName());
            map.put("navigationIcon", navigations.getIcon());
            map.put("navigationId", navigations.getId());
            map.put("code", navigations.getCode());
            map.put("tagList", tagListyt);
            navigation.add(map);
        }

        request.setAttribute("navigation", navigation);

    }

}
