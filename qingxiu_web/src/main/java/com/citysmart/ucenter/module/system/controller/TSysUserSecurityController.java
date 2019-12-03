package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.module.system.service.ITSysUserSecurityService;
import com.citysmart.ucenter.mybatis.model.TSysUserSecurity;
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
@RequestMapping("/system/tSysUserSecurity")
public class TSysUserSecurityController extends SuperController {

    @Autowired
    public ITSysUserSecurityService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TSysUserSecurity> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSysUserSecurity> ew = new EntityWrapper<TSysUserSecurity>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        Page<TSysUserSecurity> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/tSysUserSecurity/list";
    }

    /**
     * 新增
     */
    @RequiresPermissions("addTSysUserSecurity")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/tSysUserSecurity/add";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTSysUserSecurity")
    @RequestMapping("/doAdd")
    @ResponseBody
    public Rest doAdd(TSysUserSecurity entity, String[] roleId) {

        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除
     */
    @RequiresPermissions("deleteTSysUserSecurity")
    @RequestMapping("/delete")
    @ResponseBody
    public Rest delete(String id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑
     */
    @RequiresPermissions("editTSysUserSecurity")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TSysUserSecurity entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/tSysUserSecurity/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTSysUserSecurity")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(TSysUserSecurity entity, Model model) {
        service.updateById(entity);
        return Rest.ok();
    }

}
