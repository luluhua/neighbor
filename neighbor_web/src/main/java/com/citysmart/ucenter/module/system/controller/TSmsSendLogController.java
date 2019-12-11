package com.citysmart.ucenter.module.system.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.util.PWDStrongUtil;
import com.citysmart.ucenter.module.system.service.ITSmsSendLogService;
import com.citysmart.ucenter.mybatis.model.TSmsSendLog;
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
@RequestMapping("/tSmsSendLog/sms")
public class TSmsSendLogController extends SuperController {

    @Autowired
    public ITSmsSendLogService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize,
                       String smsType, String search, String daterange, String sendTimeStart, String sendTimeEnd, Model model) {

        Page<TSmsSendLog> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSmsSendLog> ew = new EntityWrapper<TSmsSendLog>();
        if (StringUtils.isNotBlank(search)) {
            ew.eq("receive_phone", PWDStrongUtil.Encryption3DEs(search));
            model.addAttribute("search", search);
        }

        if (StringUtils.isNotBlank(smsType)) {
            ew.eq("sms_type", smsType);
            model.addAttribute("smsType", smsType);
        }
        //日期查询
        //下方为原有查询条件，先做保留
        if (StringUtils.isNotBlank(daterange)) {
            model.addAttribute("daterange", daterange);
            String[] dateranges = StringUtils.split(daterange, "-");
            ew.addFilter(" send_time >= {0}", dateranges[0].trim().replaceAll("/", "-") + " 00:00:00");
            ew.addFilter(" send_time <= {0}", dateranges[1].trim().replaceAll("/", "-") + " 23:59:59");
        }
        //上方为原有查询条件，先做保留
        //下方修复：295 优化后台管理端，更换时间控件
        if (StringUtils.isNotBlank(sendTimeStart)) {
            model.addAttribute("sendTimeStart", sendTimeStart);
            ew.addFilter(" DATE_FORMAT(send_time,'%Y-%m-%d') >= {0}", sendTimeStart);
        }
        if (StringUtils.isNotBlank(sendTimeEnd)) {
            model.addAttribute("sendTimeEnd", sendTimeEnd);
            ew.addFilter(" DATE_FORMAT(send_time,'%Y-%m-%d') <= {0}", sendTimeEnd);
        }
        //上方修复：295 优化后台管理端，更换时间控件
        ew.orderBy("dt_create", false);
        Page<TSmsSendLog> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/msg/sms/list";
    }

    /**
     * 批量删除
     *
     * @return
     */
    @RequiresPermissions("listTSmsSendLog")
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

    /**
     * 新增
     */
    @RequiresPermissions("addTSmsSendLog")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/tSmsSendLog/add";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTSmsSendLog")
    @RequestMapping("/doAdd")
    @ResponseBody
    public Rest doAdd(TSmsSendLog entity, String[] roleId) {

        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除
     */
    @RequiresPermissions("deleteTSmsSendLog")
    @RequestMapping("/delete")
    @ResponseBody
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑
     */
    @RequiresPermissions("editTSmsSendLog")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TSmsSendLog entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/tSmsSendLog/edit";
    }

    /**
     * 获取参数
     */
    @RequestMapping("/params/{id}")
    public String params(@PathVariable String id, Model model) {
        TSmsSendLog smsSendLog = service.selectById(id);
        System.out.println("smsSendLog=" + smsSendLog.toString());
        String r_mgs = smsSendLog.getReturnMsg();
        if (isJson(r_mgs)) {
        } else {
            smsSendLog.setReturnMsg("{\"retrnMsg\":\"" + r_mgs + "\"}");
        }
        model.addAttribute("smsSendLog", smsSendLog);
        return "/msg/sms/info";
    }

    private boolean isJson(String content) {
        try {
            JSONObject.parseObject(content);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
