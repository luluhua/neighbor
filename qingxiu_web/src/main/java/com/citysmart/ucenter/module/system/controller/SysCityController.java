package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.module.system.service.ISysCityService;
import com.citysmart.ucenter.mybatis.model.SysCity;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * <p>
 * 中国区域表 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-03-27
 */
@Controller
@RequestMapping("/system/sysCity")
public class SysCityController extends SuperController {

    @Autowired
    public ISysCityService service;
    @Autowired
    public ISysCityService iSysCityService;
    /**
     * 省份
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "0") Integer pid,
                       @RequestParam(defaultValue = "15") Integer pageSize,
                       String search, Model model) {

        Page<SysCity> pageData = getList(pageNumber, pid, pageSize, search, model);
        model.addAttribute("pageData", pageData);
        return "/system/syscity/list";
    }

    /**
     * 市级
     * 分页查询
     */
    @RequestMapping("/citylist/{pageNumber}")
    public String cityList(@PathVariable Integer pageNumber,
                           Integer pid, @RequestParam(defaultValue = "15") Integer pageSize,
                           String search, Model model) {
        Page<SysCity> pageData = getList(pageNumber, pid, pageSize, search, model);
        SysCity province = service.selectById(pid);
        model.addAttribute("province", province);
        model.addAttribute("pageData", pageData);
        return "/system/syscity/citylist";
    }

    /**
     * 区/县级
     * 分页查询
     */
    @RequestMapping("/arealist/{pageNumber}")
    public String areaList(@PathVariable Integer pageNumber, Integer pid, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {
        Page<SysCity> pageData = getList(pageNumber, pid, pageSize, search, model);
        SysCity city = service.selectById(pid);
        SysCity province = service.selectById(city.getPid());
        model.addAttribute("province", province);
        model.addAttribute("city", city);
        model.addAttribute("pageData", pageData);
        return "/system/syscity/arealist";
    }

    /**
     * 街道
     * 分页查询
     */
    @RequestMapping("/streetlist/{pageNumber}")
    public String streetList(@PathVariable Integer pageNumber, Integer pid, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {
        Page<SysCity> pageData = getList(pageNumber, pid, pageSize, search, model);
        SysCity area = service.selectById(pid);
        SysCity city = service.selectById(area.getPid());
        SysCity province = service.selectById(city.getPid());
        model.addAttribute("province", province);
        model.addAttribute("city", city);
        model.addAttribute("area", area);
        model.addAttribute("pageData", pageData);
        return "/system/syscity/streetlist";
    }

    /**
     * 居委会
     * 分页查询
     */
    @RequestMapping("/roadlist/{pageNumber}")
    public String roadList(@PathVariable Integer pageNumber, Integer pid, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {
        Page<SysCity> pageData = getList(pageNumber, pid, pageSize, search, model);
        SysCity street = service.selectById(pid);
        SysCity area = service.selectById(street.getPid());
        SysCity city = service.selectById(area.getPid());
        SysCity province = service.selectById(city.getPid());
        model.addAttribute("province", province);
        model.addAttribute("city", city);
        model.addAttribute("area", area);
        model.addAttribute("street", street);
        model.addAttribute("pageData", pageData);
        return "/system/syscity/roadlist";
    }


    public Page getList(Integer pageNumber, Integer pid, Integer pageSize, String search, Model model) {
        Page<SysCity> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        EntityWrapper<SysCity> ew = new EntityWrapper<SysCity>();
        ew.eq("pid", pid);
        // 查询分页
        if (StringUtils.isNotBlank(search)) {
            ew.where("( name like CONCAT('%',{0})",search);
            ew.or("code like CONCAT('%',{0}))",search);
            model.addAttribute("search", search);
        }
        Page<SysCity> pageData = service.selectPage(page, ew);
        return pageData;
    }


    /**
     * 新增中国区域表
     */
    @RequiresPermissions("addSysCity")
    @RequestMapping("/add")
    public String add(Model model, Integer pid) {
        EntityWrapper<SysCity> ew = new EntityWrapper<SysCity>();
        SysCity city = new SysCity();
        if (pid == 0) {
            city.setId(0);
        } else {
            ew.eq("id", pid);
            city = service.selectOne(ew);

        }
        model.addAttribute("city", city);
        return "/system/sysCity/add";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addSysCity")
    @RequestMapping("/doAdd")
    @ResponseBody
    public Rest doAdd(SysCity entity, String[] roleId) {

        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除中国区域表
     */
    @RequiresPermissions("deleteSysCity")
    @RequestMapping("/delete")
    @ResponseBody
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑中国区域表
     */
    @RequiresPermissions("editSysCity")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {

        List<SysCity> list = service.parentList(Integer.valueOf(id));
        SysCity entity = service.selectById(id);

        model.addAttribute("list", list);
        model.addAttribute("entity", entity);
        return "/system/syscity/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editSysCity")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(SysCity entity, Model model) {
        service.update(entity,new EntityWrapper<SysCity>().eq("id", entity.getId()));
        return Rest.ok();
    }



    @RequestMapping("/getCityByPid")
    @ResponseBody
    public Rest getCityByPid(Integer pid) {
        EntityWrapper<SysCity> ew = new EntityWrapper<SysCity>();
        ew.eq("pid",pid);
        ew.eq("enabled",1);
        return Rest.okData(service.selectList(ew));
    }

    @RequiresPermissions("addSysCity")
    @RequestMapping("/addPage")
    public String addDept(Integer type, Model model) {

        //行政区域
        List<SysCity> sysCityList= iSysCityService.selectList(new EntityWrapper<SysCity>().eq("enabled",1).eq("pid",2842));
        model.addAttribute("sysCityList",sysCityList);
        if(type==1){
            return "/system/syscity/add/addDept";
        }else if(type==2) {
            return "/system/syscity/add/addDeptAddress";
        }else {
            //行政区域
            sysCityList= iSysCityService.selectList(new EntityWrapper<SysCity>().eq("enabled",1).eq("pid",0));
            model.addAttribute("sysCityList",sysCityList);
            return "/system/syscity/add/addCity";
        }
    }

    @RequestMapping("/treeData" )
    @ResponseBody
    public List<Map<String, Object>> treeData(String leftCode) {
//        boolean isExtId = StringUtils.isNotBlank(extId) && !"0".equals(extId);
        EntityWrapper<SysCity> ew = new EntityWrapper<>();
        ew.where(StringUtils.isNotBlank(leftCode), "code LIKE {0}",  leftCode + "%" );
//        ew.ne(isExtId, "id", extId);
//        ew.eq("is_deleted", Delete.未删除);
        List<SysCity> list = service.selectList(ew);
        List<Map<String, Object>> data = new ArrayList<>();
        Map<String, Object> item;
        for(SysCity entity : list){
//            if(isExtId){
//                if(entity.getPidPath().indexOf(","+extId+",") > -1){
//                    continue;
//                }
//            }
            item = new HashMap<>();
            item.put("id", entity.getId());
            item.put("pId", entity.getPid());
            item.put("name", entity.getName());
            data.add(item);
        }
        return data;
    }
}
