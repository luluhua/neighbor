package com.citysmart.ucenter.module.interfaceInfo.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.appc.service.ITAppUserDeviceService;
import com.citysmart.ucenter.mybatis.entity.vo.DeviceVO;
import com.citysmart.ucenter.mybatis.model.TAppUserDevice;
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
 * 用户设备登录信息
 * */
@Controller
@RequestMapping("/interfaceInfo/device")
public class AppUserDeviceController extends SuperController {

    @Autowired
    private ITAppUserDeviceService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize,
                       String daterange,String search, Model model){
        Page<DeviceVO> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        EntityWrapper<TAppUserDevice> ew = new EntityWrapper<TAppUserDevice>();
        if (StringUtils.isNotBlank(search)||StringUtils.isNotBlank(daterange)) {
            StringBuilder stringBuilder=new StringBuilder();
            if(StringUtils.isNotBlank(search)){
                stringBuilder.append(" and (a.osv like CONCAT('%','"+search+"','%') ");
                stringBuilder.append(" or a.osm like CONCAT ('%','"+search+"','%') ");
                stringBuilder.append(" or b.username like CONCAT ('%','"+search+"','%')) ");
                model.addAttribute("search", search);
            }
            //日期查询
            if (StringUtils.isNotBlank(daterange)) {
                String[] dateranges = StringUtils.split(daterange, "-");
                stringBuilder.append(" and a.dt_create >='"+dateranges[0].trim().replaceAll("/", "-") + " 00:00:00"+"' ");
                stringBuilder.append(" and a.dt_create <='"+dateranges[1].trim().replaceAll("/", "-") + " 23:59:59"+"' ");
                model.addAttribute("daterange", daterange);
            }
            ew.setSqlSelect(stringBuilder.toString());
        }else{
            ew=null;
        }
        Page<DeviceVO> pageData = service.selectPageList(page, ew);
        model.addAttribute("pageData", pageData);
        return "/interfaceInfo/device/list";
    }

    @RequestMapping("/deleteAll")
    @ResponseBody
    @Log("删除设备登录信息")
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
