package com.citysmart.ucenter.module.system.controller;

import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.TNavigation;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.common.bean.Rest;
import com.citysmart.ucenter.module.system.service.ITNavigationService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.commons.lang3.StringUtils;

import javax.validation.Valid;


/**
 * <p>
 * 导航表 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Controller
@RequestMapping("/system/tNavigation")
public class TNavigationController extends SuperController {

    @Autowired
    public ITNavigationService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {
        Page<TNavigation> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TNavigation> ew = new EntityWrapper<TNavigation>();
        ew.eq("is_deleted", Delete.未删除);
        ew.orderBy("sort_index", false);
        if (StringUtils.isNotBlank(search)) {
            ew.eq("name", search);
            model.addAttribute("search", search);
        }
        Page<TNavigation> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/system/tnavigation/list";
    }

    /**
     * 新增导航表
     */
    @RequiresPermissions("addTNavigation")
    @RequestMapping("/add")
    public String add(Model model) {
        EntityWrapper<TNavigation> ew = new EntityWrapper<TNavigation>();
        ew.eq("is_deleted", Delete.未删除);
        ew.orderBy("sort_index", false);
        TNavigation navigation = service.selectOne(ew);
        model.addAttribute("sortIndex", (navigation != null ? navigation.getSortIndex() : 0) + 10);
        return "/system/tnavigation/edit";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTNavigation")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增导航表")
    public Rest doAdd(@Valid TNavigation entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除导航表
     */
    @RequiresPermissions("deleteTNavigation")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除导航表")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑导航表
     */
    @RequiresPermissions("editTNavigation")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TNavigation entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/system/tnavigation/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTNavigation")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑导航表")
    public Rest doEdit(@Valid TNavigation entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.updateById(entity);
        return Rest.ok();
    }

}
