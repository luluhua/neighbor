package com.citysmart.ucenter.module.appc.controller;

import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.mybatis.model.app.TLjUserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.common.bean.Rest;
import com.citysmart.ucenter.module.appc.service.ITLjUserInfoService;
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
 * 用户扩展表 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Controller
@RequestMapping("/appc/tLjUserInfo")
public class TLjUserInfoController extends SuperController {

    @Autowired
    public ITLjUserInfoService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TLjUserInfo> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TLjUserInfo> ew = new EntityWrapper<TLjUserInfo>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        Page<TLjUserInfo> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/appc/tLjUserInfo/list";
    }

    /**
     * 新增用户扩展表
     */
    @RequiresPermissions("addTLjUserInfo")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/appc/tLjUserInfo/edit";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTLjUserInfo")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增用户扩展表")
    public Rest doAdd(@Valid TLjUserInfo entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除用户扩展表
     */
    @RequiresPermissions("deleteTLjUserInfo")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除用户扩展表")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑用户扩展表
     */
    @RequiresPermissions("editTLjUserInfo")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TLjUserInfo entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/appc/tLjUserInfo/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTLjUserInfo")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑用户扩展表")
    public Rest doEdit(@Valid TLjUserInfo entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.updateById(entity);
        return Rest.ok();
    }

}
