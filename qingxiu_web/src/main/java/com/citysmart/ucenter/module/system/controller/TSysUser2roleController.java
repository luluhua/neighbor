package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.module.system.service.ITSysUser2roleService;
import com.citysmart.ucenter.mybatis.model.TSysUser2role;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Controller
@RequestMapping("/system/tSysUser2role")
public class TSysUser2roleController extends SuperController {

    @Autowired
    public ITSysUser2roleService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TSysUser2role> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSysUser2role> ew = new EntityWrapper<TSysUser2role>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        Page<TSysUser2role> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/tSysUser2role/list";
    }

    /**
     * 新增
     */
    @RequiresPermissions("addTSysUser2role")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/tSysUser2role/add";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTSysUser2role")
    @RequestMapping("/doAdd")
    @ResponseBody
    public Rest doAdd(TSysUser2role entity, String[] roleId) {

        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除
     */
    @RequiresPermissions("deleteTSysUser2role")
    @RequestMapping("/delete")
    @ResponseBody
    public Rest delete(String id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑
     */
    @RequiresPermissions("editTSysUser2role")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TSysUser2role entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/tSysUser2role/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTSysUser2role")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(TSysUser2role entity, Model model) {
        service.updateById(entity);
        return Rest.ok();
    }

}
