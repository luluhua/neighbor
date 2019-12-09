package com.citysmart.ucenter.module.appc.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.common.util.PWDStrongUtil;
import com.citysmart.ucenter.module.appc.service.ITAppUserService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.TAppUser;
import com.google.gson.Gson;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 * app 注册用户信息表 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Controller
@RequestMapping("/appc/tAppUser")
public class TAppUserController extends SuperController {

    @Autowired
    public ITAppUserService service;

    /**
     * 分页查询
     */
//    @RequiresPermissions("listTAppUser")
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Integer userType, Integer status, Integer authStatus, Model model) {
        Page<TAppUser> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TAppUser> ew = new EntityWrapper<TAppUser>();
        ew.eq("is_deleted", Delete.未删除);
        ew.orderBy("dt_create", false);
        if (userType != null) {
            ew.eq("user_type", userType);
            model.addAttribute("userType", userType);
        }
        if (status != null) {
            ew.eq("status", status);
            model.addAttribute("status", status);
        }
        if (authStatus != null) {
            ew.eq("auth_status", authStatus);
            model.addAttribute("authStatus", authStatus);
        }
        if (StringUtils.isNotBlank(search)) {
            ew.where("(mobile like CONCAT('%',{0},'%'))", PWDStrongUtil.Encryption3DEs(search));
            model.addAttribute("search", search);
        }
        Page<TAppUser> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/appc/user/list";
    }

    /**
     * 编辑企业用户信息表
     */
    @RequiresPermissions("detailTAppUser")
    @RequestMapping("/detail/{id}")
    public String detail(@PathVariable String id, Model model) {
        TAppUser entity = service.selectById(id);
        model.addAttribute("entity", entity);
        return "/appc/user/edit";
    }

    /**
     * 执行账户类型修改
     */
    @RequestMapping("/changeAccountType")
    @ResponseBody
    @Log("执行账户类型修改")
    public Rest changeAccountType(Integer id, Integer accountType) {
        TAppUser entity = service.selectById(id);
        if (entity == null) {
            return Rest.failure("用户不存在");
        }
        try {
            entity.setAccountType(accountType);
            service.updateById(entity);
            return Rest.ok("修改成功");
        } catch (Exception e) {
            return Rest.failure("修改失败");
        }
    }

    /**
     * 删除手机用户
     */
    @Log("刪除app用戶")
    @RequiresPermissions("deleteTAppUser")
    @RequestMapping("/delete")
    @ResponseBody
    public  Rest delete(Integer id){
        if (id == null||id==0) {
            return Rest.failure("用户不存在");
        }
        try{
            service.deleteById(id);
            return Rest.ok("删除成功");
        }
        catch (Exception e){
            return Rest.failure("删除失败");
        }
    }
    @RequestMapping("/appUserJson")
    @ResponseBody
    public String projectJson(Integer userType, String search, Model model) {
        model.addAttribute("search", search);
        EntityWrapper<TAppUser> ew = new EntityWrapper<TAppUser>();
        ew.eq("is_deleted", Delete.未删除);
        ew.orderBy("dt_create", false);
        if (userType != null) {
            ew.eq("user_type", userType);
            model.addAttribute("userType", userType);
        }
        if (StringUtils.isNotBlank(search)) {
            ew.where("(mobile like CONCAT('%',{0},'%'))", PWDStrongUtil.Encryption3DEs(search));
            model.addAttribute("search", search);
        }
        List<TAppUser> appUserList=service.selectList(ew);
        if(appUserList!=null&&!appUserList.isEmpty()){
            for (TAppUser appUser:appUserList){
                appUser.setMobile(PWDStrongUtil.Decrypt3DEs(appUser.getMobile()));
            }
        }
        return new Gson().toJson(appUserList);
    }

}
