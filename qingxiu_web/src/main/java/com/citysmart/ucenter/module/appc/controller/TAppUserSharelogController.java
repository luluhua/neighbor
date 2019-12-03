package com.citysmart.ucenter.module.appc.controller;

import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.common.util.PWDStrongUtil;
import com.citysmart.ucenter.module.appc.service.ITAppUserSharedetailService;
import com.citysmart.ucenter.module.appc.service.ITAppUserSharelogService;
import com.citysmart.ucenter.mybatis.entity.vo.TAppUserSharelogSelectVo;
import com.citysmart.ucenter.mybatis.entity.vo.TAppUserSharelogVo;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;


/**
 * <p>
 * 分享记录管理
 * </p>
 *
 * @author liuguicheng
 * @since 2019-09-02
 */
@Controller
@RequestMapping("/appc/tAppUserSharelog")
public class TAppUserSharelogController extends SuperController {

    @Autowired
    public ITAppUserSharelogService service;
    @Autowired
    public ITAppUserSharedetailService sharedetailService;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize,
                       String search, String daterange,String createTimeStart,String createTimeEnd,String mobile, Model model) {
        TAppUserSharelogSelectVo tAppUserSharelogSelectVo = new TAppUserSharelogSelectVo();
        Page<TAppUserSharelogVo> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 分享码查询
        if (StringUtils.isNotBlank(search)) {
            tAppUserSharelogSelectVo.setSearch(search);
            model.addAttribute("search", search);
        }
        //手机号码查询
        if (StringUtils.isNotBlank(mobile)) {
            tAppUserSharelogSelectVo.setMobile(PWDStrongUtil.Encryption3DEs(mobile));
            model.addAttribute("mobile", mobile);
        }
        //日期查询
        //下方为原有查询条件，先做保留
        if (StringUtils.isNotBlank(daterange)) {
            model.addAttribute("daterange", daterange);
            String[] dateranges = StringUtils.split(daterange, "-");
            tAppUserSharelogSelectVo.setStartTime(dateranges[0].trim().replaceAll("/", "-") + " 00:00:00");
            tAppUserSharelogSelectVo.setEndTime(dateranges[1].trim().replaceAll("/", "-") + " 23:59:59");
        }
        //上方为原有查询条件，先做保留
        //下方修复：295 优化后台管理端，更换时间控件
        if (StringUtils.isNotBlank(createTimeStart)){
            model.addAttribute("createTimeStart", createTimeStart);
            tAppUserSharelogSelectVo.setStartTime(createTimeStart);
        }
        if (StringUtils.isNotBlank(createTimeEnd)){
            model.addAttribute("createTimeEnd", createTimeEnd);
            tAppUserSharelogSelectVo.setEndTime(createTimeEnd);
        }
        //上方修复：295 优化后台管理端，更换时间控件
        Page<TAppUserSharelogVo> pageData = service.selectTAppUserSharelogVoPage(page, tAppUserSharelogSelectVo);
        for (TAppUserSharelogVo v : pageData.getRecords()) {
            //对手机号码进行解密处理
            if (v.getMobile() != null) {
                v.setMobile(PWDStrongUtil.Decrypt3DEs(v.getMobile()));
            }
        }
        model.addAttribute("pageData", pageData);
        return "/appc/shareLog/list";
    }

    /**
     * 删除
     */
    @RequiresPermissions("deleteTAppUserSharelog")
    @RequestMapping(value = "/delete")
    @ResponseBody
    @Log("删除分享记录")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }


    /**
     * 批量删除
     *
     * @return
     */
    @RequiresPermissions("deleteTAppUserSharelog")
    @RequestMapping(value = "/deleteAll", method = RequestMethod.POST)
    @ResponseBody
    @Log("批量删除分享记录")
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
