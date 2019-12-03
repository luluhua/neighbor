package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.module.system.service.ITSysUserService;
import com.citysmart.ucenter.mybatis.model.TSysUser;
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
@RequestMapping("/system/tSysUser")
public class TSysUserController extends SuperController {

    @Autowired
    public ITSysUserService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TSysUser> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSysUser> ew = new EntityWrapper<TSysUser>();
        if (StringUtils.isNotBlank(search)) {
            ew.where("( username like CONCAT('%',{0},'%')", search)
            .or("realname like CONCAT('%',{0},'%')",search)
              .or("nickname like CONCAT('%',{0},'%'))",search);
            model.addAttribute("search", search);
        }
        Page<TSysUser> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/tSysUser/list";
    }

    /**
     * 新增
     */
    @RequiresPermissions("addTSysUser")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/tSysUser/add";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTSysUser")
    @RequestMapping("/doAdd")
    @ResponseBody
    public Rest doAdd(TSysUser entity, String[] roleId) {

        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除
     */
    @RequiresPermissions("deleteTSysUser")
    @RequestMapping("/delete")
    @ResponseBody
    public Rest delete(String id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑
     */
    @RequiresPermissions("editTSysUser")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TSysUser entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/tSysUser/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTSysUser")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(TSysUser entity, Model model) {
        service.updateById(entity);
        return Rest.ok();
    }

}
