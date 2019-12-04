package com.citysmart.ucenter.module.system.controller;

import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.TNavigation;
import com.citysmart.ucenter.mybatis.model.TTag;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.common.bean.Rest;
import com.citysmart.ucenter.module.system.service.ITTagService;
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
 * 标签表 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Controller
@RequestMapping("/system/tTag")
public class TTagController extends SuperController {

    @Autowired
    public ITTagService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{navigationId}")
    public String list(@PathVariable String navigationId, @RequestParam(defaultValue = "15") Integer pageSize, @RequestParam(defaultValue = "0") String pid, String search, Model model) {

        Page<TTag> page = getPage(1, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TTag> ew = new EntityWrapper<TTag>();
        ew.eq("is_deleted", Delete.未删除);
        ew.eq("navigation_id", navigationId);
        if (pid != "0") {
            ew.eq("pid", pid);
            model.addAttribute("pid", pid);
        }
        ew.orderBy("sort_index", false);
        if (StringUtils.isNotBlank(search)) {
            ew.eq("name", search);
            model.addAttribute("search", search);
        }
        Page<TTag> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        model.addAttribute("navigationId", navigationId);
        model.addAttribute("pid", pid);
        return "/system/ttag/list";
    }

    /**
     * 新增标签表
     */
    @RequiresPermissions("addTTag")
    @RequestMapping("/add/{navigationId}")
    public String add(@PathVariable String navigationId, String pid, Model model) {
        EntityWrapper<TTag> ew = new EntityWrapper<TTag>();
        ew.eq("is_deleted", Delete.未删除);
        ew.orderBy("sort_index", false);
        ew.eq("navigation_id", navigationId);
        TTag tag = service.selectOne(ew);
        model.addAttribute("sortIndex", (tag != null ? tag.getSortIndex() : 0) + 10);
        model.addAttribute("navigationId", navigationId);
        model.addAttribute("pid", pid);
        return "/system/ttag/edit";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTTag")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增标签表")
    public Rest doAdd(@Valid TTag entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除标签表
     */
    @RequiresPermissions("deleteTTag")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除标签表")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑标签表
     */
    @RequiresPermissions("editTTag")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TTag entity = service.selectById(id);

        model.addAttribute("entity", entity);
        model.addAttribute("pid", entity.getPid());
        model.addAttribute("navigationId", entity.getNavigationId());
        return "/system/ttag/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTTag")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑标签表")
    public Rest doEdit(@Valid TTag entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.updateById(entity);
        return Rest.ok();
    }

}
