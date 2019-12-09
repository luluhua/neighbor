package com.citysmart.ucenter.module.appc.controller;

import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.module.appc.service.ITLjUserAddressService;
import com.citysmart.ucenter.module.appc.service.ITLjUserInfoService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUserAddress;
import com.citysmart.ucenter.mybatis.model.app.TLjUserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.common.bean.Rest;
import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.commons.lang3.StringUtils;

import javax.validation.Valid;
import java.util.List;


/**
 * <p>
 * 平台用户表 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Controller
@RequestMapping("/appc/tLjUser")
public class TLjUserController extends SuperController {

    @Autowired
    public ITLjUserService service;
    @Autowired
    public ITLjUserInfoService infoService;

    @Autowired
    public ITLjUserAddressService addressService;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TLjUser> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TLjUser> ew = new EntityWrapper<TLjUser>();
        ew.orderBy("dt_create", false);
        if (StringUtils.isNotBlank(search)) {
            ew.like("username", search).or().like("mobile", search);
            model.addAttribute("search", search);
        }
        Page<TLjUser> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/appc/tljuser/list";
    }

    /**
     * 新增平台用户表
     */
    @RequiresPermissions("addTLjUser")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/appc/tljuser/edit";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTLjUser")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增平台用户表")
    public Rest doAdd(@Valid TLjUser entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 禁用/开启 用户
     */
    @RequiresPermissions("operationUser")
    @RequestMapping("/operationUser")
    @ResponseBody
    @Log("禁用/开启 用户")
    public Rest operation(Integer id) {
        EntityWrapper<TLjUser> ew = new EntityWrapper<TLjUser>();
        TLjUser user = service.selectById(id);
        ew.eq("status", user.getStatus() == 0 ? 1 : 0);
        service.update(user, ew);
        return Rest.ok();
    }

    /**
     * 编辑平台用户表
     */
    @RequiresPermissions("editTLjUser")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TLjUser entity = service.selectById(id);
        EntityWrapper<TLjUserInfo> infoew = new EntityWrapper<TLjUserInfo>();
        infoew.eq("user_id", id);
        TLjUserInfo info = infoService.selectOne(infoew);
        EntityWrapper<TLjUserAddress> addressew = new EntityWrapper<TLjUserAddress>();
        addressew.eq("user_id", id);
        addressew.eq("is_deleted", Delete.未删除);
        List<TLjUserAddress> address = addressService.selectList(addressew);
        model.addAttribute("entity", entity);
        model.addAttribute("info", info);
        model.addAttribute("address", address);
        return "/appc/tljuser/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTLjUser")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑平台用户表")
    public Rest doEdit(@Valid TLjUser entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.updateById(entity);
        return Rest.ok();
    }

}
