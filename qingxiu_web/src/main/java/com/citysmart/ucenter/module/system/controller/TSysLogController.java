package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.module.system.service.ITSysLogService;
import com.citysmart.ucenter.mybatis.model.TSysLog;
import org.apache.commons.lang3.StringUtils;
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
@RequestMapping("/tSysLog/log")
public class TSysLogController extends SuperController {

    @Autowired
    public ITSysLogService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize,
                       String search,String daterange,String createTimeStart,String createTimeEnd, Model model) {
        Page<TSysLog> page = getPage(pageNumber, pageSize);
        page.setAsc(false);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSysLog> ew = new EntityWrapper<TSysLog>();
        if (StringUtils.isNotBlank(search)) {
            ew.where("(user_name like CONCAT('%',{0},'%')", search)
                    .or("title like CONCAT('%',{0},'%'))", search);
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
        ew.orderBy("dt_create", false);
        Page<TSysLog> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/system/log/list";

    }
    /**
     * 获取参数
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/params/{id}")
    public String params(@PathVariable Integer id,Model model){
        TSysLog sysLog = service.selectById(id);
        model.addAttribute("params",sysLog.getParams());
        return "/system/log/log_info";
    }
    /**
     * 删除
     */
    public Rest delete(String id) {
        service.deleteById(id);
        return Rest.ok();
    }
    /**
     * 批量删除
     *
     * @return
     */
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
