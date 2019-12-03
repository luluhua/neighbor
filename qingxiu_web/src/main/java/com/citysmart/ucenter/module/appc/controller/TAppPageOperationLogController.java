package com.citysmart.ucenter.module.appc.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.appc.service.ITAppPageOperationLogService;
import com.citysmart.ucenter.mybatis.model.app.TAppPageOperationLog;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * <p>
 * app用户行为日志 前端控制器
 * </p>
 *
 * @author zhouyanjian
 * @since 2019-08-29
 */
@Controller
@RequestMapping("/appc/tAppPageOperationLog")
public class TAppPageOperationLogController extends SuperController {

    @Autowired
    public ITAppPageOperationLogService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize,
                       String search, Model model) {
        Page<TAppPageOperationLog> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TAppPageOperationLog> ew = new EntityWrapper<TAppPageOperationLog>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
            ew.where("(`model` LIKE CONCAT('%',{0},'%') OR `key` LIKE CONCAT('%',{1},'%') OR `name` LIKE CONCAT('%',{2},'%'))", search, search, search);
        }
        ew.orderBy("dt_create", false);
        ew.eq("is_deleted" , 0);
        Page<TAppPageOperationLog> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/appc/tapppageoperationlog/list";
    }

    /**
     * 删除app用户行为日志
     */
    @RequiresPermissions("deleteTAppPageOperationLog")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除app用户行为日志")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑app用户行为日志
     */
    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable String id, Model model) {
        TAppPageOperationLog entity = service.selectById(id);
        model.addAttribute("entity", entity);
        return "/appc/tapppageoperationlog/detail";
    }

}
