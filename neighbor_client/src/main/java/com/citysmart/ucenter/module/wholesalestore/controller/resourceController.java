package com.citysmart.ucenter.module.wholesalestore.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.json.JsonFailResult;
import com.citysmart.common.json.JsonResult;
import com.citysmart.common.util.CommonUtil;
import com.citysmart.ucenter.common.Util.ShiroUtil;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.commodity.service.ITGoodsGradeService;
import com.citysmart.ucenter.module.commodity.service.ITGoodsService;
import com.citysmart.ucenter.module.system.service.ITNavigationService;
import com.citysmart.ucenter.module.system.service.ITTagService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.SysMenu;
import com.citysmart.ucenter.mybatis.model.TNavigation;
import com.citysmart.ucenter.mybatis.model.TSmsSendLog;
import com.citysmart.ucenter.mybatis.model.TTag;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.commodity.TGoods;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsGrade;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
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
            goodsService.insert(entity);
            return Rest.ok();
        }
        return Rest.ok("未登录");
    }


}
