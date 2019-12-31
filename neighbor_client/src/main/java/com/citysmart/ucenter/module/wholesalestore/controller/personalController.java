package com.citysmart.ucenter.module.wholesalestore.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.Util.PWDStrongUtil;
import com.citysmart.ucenter.common.Util.ShiroUtil;
import com.citysmart.ucenter.module.appc.service.ITLjUserInfoService;
import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author li
 * @date 2019/12/26
 */
@Controller
@RequestMapping("/resource")
public class personalController extends SuperController {

    @Autowired
    private ITLjUserService userService;

    @Autowired
    private ITLjUserInfoService userInfoService;

    @RequestMapping("/info")
    public String show(Model model) {
        TLjUser ljUser = ShiroUtil.getSessionUser();
        if (ljUser != null) {
            EntityWrapper<TLjUserInfo> userEw = new EntityWrapper<TLjUserInfo>();
            userEw.eq("user_id", ljUser.getId());
            TLjUserInfo info = userInfoService.selectOne(userEw);
//            info.setMobile(PWDStrongUtil.Decrypt3DEs(ljUser.getMobile()));
            model.addAttribute("info", info);
            return "/wholesalestore/personal/memberData";
        }
        return "/wholesalestore/login";
    }
}
