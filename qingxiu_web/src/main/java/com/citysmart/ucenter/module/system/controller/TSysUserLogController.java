package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.module.system.service.ITSysUserLogService;
import com.citysmart.ucenter.mybatis.model.TSysUserLog;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Controller
@RequestMapping("/tSysUserLog/log")
public class TSysUserLogController extends SuperController {

    @Autowired
    public ITSysUserLogService service;

    /**
     * 分页查询
     */
    @RequiresPermissions("listUserLog")
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize,
                       String search, Model model,String daterange,String createTimeStart,String createTimeEnd) {

        Page<TSysUserLog> page = getPage(pageNumber, pageSize);
        page.setOrderByField("dtCreate");
        page.setAsc(false);

        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSysUserLog> ew = new EntityWrapper<TSysUserLog>();
        //登录来源
        String loginType=request.getParameter("loginType");
        if (StringUtils.isNotBlank(loginType)) {
            ew.eq("login_type",loginType);
        }
        model.addAttribute("loginType", loginType);
        //模糊搜索
        if (StringUtils.isNotBlank(search)) {
            ew.where("(user_name like CONCAT('%',{0},'%')", search)
                    .or("login_ip like CONCAT('%',{0},'%'))", search);
            model.addAttribute("search", search);
        }
        //日期查询
        //下方为原有查询条件，先做保留
        if (StringUtils.isNotBlank(daterange)) {
            model.addAttribute("daterange", daterange);
            String[] dateranges = StringUtils.split(daterange, "-");
            ew.addFilter(" dt_create >= {0}", dateranges[0].trim().replaceAll("/", "-") + " 00:00:00");
            ew.addFilter(" dt_create <= {0}", dateranges[1].trim().replaceAll("/", "-") + " 23:59:59");
        }
        //上方为原有查询条件，先做保留
        //下方修复：295 优化后台管理端，更换时间控件
        if (StringUtils.isNotBlank(createTimeStart)){
            model.addAttribute("createTimeStart", createTimeStart);
            ew.addFilter(" DATE_FORMAT(dt_create,'%Y-%m-%d') >= {0}", createTimeStart);
        }
        if (StringUtils.isNotBlank(createTimeEnd)){
            model.addAttribute("createTimeEnd", createTimeEnd);
            ew.addFilter(" DATE_FORMAT(dt_create,'%Y-%m-%d') <= {0}", createTimeEnd);
        }
        //上方修复：295 优化后台管理端，更换时间控件
        Page<TSysUserLog> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/system/log/userLogList";
    }


    /**
     * 删除
     */
    @RequiresPermissions("deleteTSysUserLog")
    @RequestMapping("/delete")
    @ResponseBody
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }
    /**
     * 批量删除
     *
     * @return
     */
    @RequiresPermissions("deleteTSysUserLog")
    @RequestMapping("/deleteAll")
    @ResponseBody
    public Rest deleteAll(@RequestParam(value = "id[]") String[] id) {
        try {
            if (id == null) {
                return Rest.failure("请选择需删除记录");
            }
            List<String> listIds = Arrays.asList(id);
            service.deleteBatchIds(listIds);
            return Rest.ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Rest.failure("删除异常");
    }


}
