package com.citysmart.ucenter.module.wholesalestore.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.json.JsonFailResult;
import com.citysmart.ucenter.common.Util.PWDStrongUtil;
import com.citysmart.ucenter.module.appc.service.ITLjUserInfoService;
import com.citysmart.ucenter.module.wholesalestore.vo.userVo;
import com.citysmart.common.util.CommonUtil;
import com.citysmart.ucenter.common.Util.ShiroUtil;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.appc.service.ITLjUserAddressService;
import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import com.citysmart.ucenter.module.commodity.service.ITGoodsGradeService;
import com.citysmart.ucenter.module.commodity.service.ITGoodsService;
import com.citysmart.ucenter.module.system.service.ITNavigationService;
import com.citysmart.ucenter.module.system.service.ITTagService;
import com.citysmart.ucenter.mybatis.entity.vo.GoodsGradeVo;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.SysMenu;
import com.citysmart.ucenter.mybatis.model.TNavigation;
import com.citysmart.ucenter.mybatis.model.TSmsSendLog;
import com.citysmart.ucenter.mybatis.model.TTag;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUserAddress;
import com.citysmart.ucenter.mybatis.model.app.TLjUserInfo;
import com.citysmart.ucenter.mybatis.model.commodity.TGoods;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsGrade;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 资源管理
 *
 * @author li
 * @date 2019/12/16
 */
@Controller
@RequestMapping("/resource")
public class resourceController extends SuperController {
    @Autowired
    private ITNavigationService navigationService;
    @Autowired
    private ITTagService tagService;

    @Autowired
    private ITGoodsGradeService goodsGradeService;

    @Autowired
    private ITGoodsService goodsService;

    @Autowired
    private ITLjUserService userService;

    @Autowired
    private ITLjUserInfoService userInfoService;

    @Autowired
    private ITLjUserAddressService addressService;


    @RequestMapping("/form")
    public String show(Model model) {
        List<TNavigation> navigationsList = navigationService.selectList(new EntityWrapper<TNavigation>().eq("is_deleted", Delete.未删除).orderBy("sort_index", false));
        List navigation = new ArrayList();
        for (TNavigation navigations : navigationsList) {
            Map<String, Object> map = new HashMap(16);
            map.put("navigationName", navigations.getName());
            map.put("navigationId", navigations.getId());
            map.put("code", navigations.getCode());
            navigation.add(map);
        }
        model.addAttribute("list", navigation);
        model.addAttribute("uuId", CommonUtil.UUID());
        return "/wholesalestore/resource/resource";
    }

    /**
     * 根据父节点获取子菜单
     */
    @RequestMapping("/json")
    @ResponseBody
    public Rest json(String navigationCode) {
        List tagListyt = new ArrayList();
        TNavigation navigation = navigationService.selectOne(new EntityWrapper<TNavigation>().eq("is_deleted", Delete.未删除).eq("code", navigationCode));
        if (navigation != null) {
            List<TTag> tagList = tagService.selectList(new EntityWrapper<TTag>().eq("is_deleted", Delete.未删除).orderBy("sort_index", false).eq("navigation_id", navigation.getId()));
            for (TTag tag : tagList) {
                Map<String, Object> tagmap = new HashMap(16);
                tagmap.put("tagName", tag.getName());
                tagmap.put("id", tag.getId());
                tagListyt.add(tagmap);
            }
        }
        return Rest.okData(tagListyt);
    }

    /**
     * 执行新增
     */
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增资源")
    public Rest doAdd(@Valid TGoods entity, BindingResult result) {
        TLjUser ljUser = ShiroUtil.getSessionUser();
        if (ljUser != null) {
            if (StringUtils.isNotBlank(entity.getFiles())) {
                String[] strs = entity.getFiles().split(",");
                entity.setImages(strs[0].toString());
            }
            entity.setUserId(ljUser.getId());
            goodsService.insert(entity);
            return Rest.ok();
        }
        return Rest.ok("未登录");
    }

    /**
     * 详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/particulars/{id}")
    public String particulars(@PathVariable String id, Model model) {
        TGoods goods = goodsService.selectById(id);
        EntityWrapper<TLjUser> userEw = new EntityWrapper<TLjUser>();
        userEw.eq("id", goods.getUserId());
        TLjUser user = userService.selectOne(userEw);
        TLjUserInfo userInfo = userInfoService.selectOne(new EntityWrapper<TLjUserInfo>().eq("user_id", goods.getUserId()));
        EntityWrapper<TLjUserAddress> addressEw = new EntityWrapper<TLjUserAddress>();
        addressEw.eq("user_id", goods.getUserId());
        addressEw.where("state=0");
        addressEw.eq("is_deleted", Delete.未删除);
        TLjUserAddress address = addressService.selectOne(addressEw);
        userVo vo = new userVo();
        vo.setId(user.getId());
        vo.setMobile(PWDStrongUtil.Decrypt3DEs(user.getMobile()));
        if (userInfo != null) {
            vo.setNickname(userInfo.getNickname());
            vo.setAvatarUrl(userInfo.getAvatarUrl());
            vo.setEmail(userInfo.getEmail());
        }
        vo.setAddress(address);
        model.addAttribute("goods", goods);
        model.addAttribute("users", vo);

        return "/wholesalestore/resource/productDetails";
    }


}
