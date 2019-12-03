package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.module.system.service.ITSysRole2permisService;
import com.citysmart.ucenter.mybatis.model.TSysRole2permis;
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
@RequestMapping("/system/tSysRole2permis")
public class TSysRole2permisController extends SuperController {

    @Autowired
    public ITSysRole2permisService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TSysRole2permis> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSysRole2permis> ew = new EntityWrapper<TSysRole2permis>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        Page<TSysRole2permis> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/tSysRole2permis/list";
    }

    /**
     * 新增
     */
    @RequiresPermissions("addTSysRole2permis")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/tSysRole2permis/add";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTSysRole2permis")
    @RequestMapping("/doAdd")
    @ResponseBody
    public Rest doAdd(TSysRole2permis entity, String[] roleId) {

        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除
     */
    @RequiresPermissions("deleteTSysRole2permis")
    @RequestMapping("/delete")
    @ResponseBody
    public Rest delete(String id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑
     */
    @RequiresPermissions("editTSysRole2permis")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TSysRole2permis entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/tSysRole2permis/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTSysRole2permis")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(TSysRole2permis entity, Model model) {
        service.updateById(entity);
        return Rest.ok();
    }

}
