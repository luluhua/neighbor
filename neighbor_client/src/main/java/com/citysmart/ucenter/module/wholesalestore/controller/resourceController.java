package com.citysmart.ucenter.module.wholesalestore.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.module.system.service.ITNavigationService;
import com.citysmart.ucenter.module.system.service.ITTagService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.SysMenu;
import com.citysmart.ucenter.mybatis.model.TNavigation;
import com.citysmart.ucenter.mybatis.model.TTag;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("/form")
    public String show(Model model) {
        List<TNavigation> navigationsList = navigationService.selectList(new EntityWrapper<TNavigation>().eq("is_deleted", Delete.未删除).orderBy("sort_index", false));
        List navigation = new ArrayList();
        for (TNavigation navigations : navigationsList) {
            Map<String, Object> map = new HashMap(16);
            map.put("navigationName", navigations.getName());
            map.put("navigationId", navigations.getId());
            navigation.add(map);
        }
        model.addAttribute("list", navigation);

        return "/wholesalestore/resource/resource";
    }

    /**
     * 根据父节点获取子菜单
     */
    @RequestMapping("/json")
    @ResponseBody
    public Rest json(String navigationId) {
        List<TTag> tagList = tagService.selectList(new EntityWrapper<TTag>().eq("is_deleted", Delete.未删除).orderBy("sort_index", false).eq("navigation_id", navigationId));
        List tagListyt = new ArrayList();
        for (TTag tag : tagList) {
            Map<String, Object> tagmap = new HashMap(16);
            tagmap.put("tagName", tag.getName());
            tagmap.put("id", tag.getId());
            tagListyt.add(tagmap);
        }
        return Rest.okData(tagListyt);
    }


}
