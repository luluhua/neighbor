package com.citysmart.ucenter.module.appc.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.appc.service.ITAppApiLogService;
import com.citysmart.ucenter.mybatis.model.TAppApiLog;
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
 * app接口调用日志 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-04-04
 */
@Controller
@RequestMapping("/appc/tAppApiLog")
public class TAppApiLogController extends SuperController {

@Autowired
public ITAppApiLogService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public  String list(@PathVariable Integer pageNumber,@RequestParam(defaultValue="15") Integer pageSize,
                        String search,String daterange,String createTimeStart,String createTimeEnd,String origin,Model model){

            Page<TAppApiLog> page = getPage(pageNumber, pageSize);
            model.addAttribute("pageSize", pageSize);
            // 查询分页
            EntityWrapper<TAppApiLog> ew = new EntityWrapper<TAppApiLog>();
            if(StringUtils.isNotBlank(search)){
                ew.where("(url like CONCAT('%',{0},'%')", search)
                  .or("title like CONCAT('%',{0},'%')", search)
                  .or("ip like CONCAT('%',{0},'%'))", search);
                model.addAttribute("search",search);
            }
        if(StringUtils.isNotBlank(origin)){
            ew.eq("origin",origin);
            model.addAttribute("origin",origin);
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
        ew.orderBy("dt_create",false);
            Page<TAppApiLog> pageData = service.selectPage(page, ew);
            model.addAttribute("pageData", pageData);
            return "/appc/api/log/list";
    }


    /**
     * 删除app接口调用日志
     */
    @RequiresPermissions("deleteTAppApiLog")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除app接口调用日志")
    public  Rest delete(Integer id){
            service.deleteById(id);
            return Rest.ok();
    }

    /**
     * 批量删除
     *
     * @return
     */
    @RequiresPermissions("deleteTAppApiLog")
    @RequestMapping("/deleteAll")
    @ResponseBody
    @Log("批量删除app接口调用日志")
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


    @RequestMapping("/info/{id}")
    public String info(@PathVariable Integer id, Model model) {
        model.addAttribute("entity",service.selectById(id));
        return "/appc/api/log/info";
    }




    @RequestMapping("/statistics/list")
    public String statistics_list( Model model) {
        return "/appc/api/statistics/index";
    }
}
