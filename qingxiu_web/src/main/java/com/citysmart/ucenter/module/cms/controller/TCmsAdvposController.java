package com.citysmart.ucenter.module.cms.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.cms.service.ITCmsAdvService;
import com.citysmart.ucenter.module.cms.service.ITCmsAdvposService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.TCmsAdv;
import com.citysmart.ucenter.mybatis.model.TCmsAdvpos;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

/**
 * 广告位表 前端控制器
 *
 * @author lub
 * @since 2019-03-04
 */
@Controller
@RequestMapping("/tCmsAdvpos")
public class TCmsAdvposController extends SuperController {

    @Autowired
    public ITCmsAdvposService service;
    @Autowired
    public ITCmsAdvService cmsAdvService;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(
            @PathVariable Integer pageNumber,
            @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TCmsAdvpos> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TCmsAdvpos> ew = new EntityWrapper<TCmsAdvpos>();
        ew.eq("is_deleted", Delete.未删除);
        ew.orderBy("dt_create", false);
        if (StringUtils.isNotBlank(search)) {
            ew.where("(name like CONCAT('%',{0},'%')", search)
                    .or("code like CONCAT('%',{0},'%'))", search);
            model.addAttribute("search", search);
        }
        Page<TCmsAdvpos> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);


        return "/system/adv/poslist";
    }

    /**
     * 新增广告位表
     */
    @RequiresPermissions("addTCmsAdvpos")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/system/adv/posadd";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTCmsAdvpos")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增广告位")
    public Rest doAdd(@Valid TCmsAdvpos entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        TCmsAdvpos cmsadv = service.selectOne(new EntityWrapper<TCmsAdvpos>().eq("name", entity.getName()).eq("is_deleted", Delete.未删除));
        if (cmsadv != null && !cmsadv.getId().equals(entity.getId())) {
            return Rest.failure("广告位名称已存在");
        }
        cmsadv = service.selectOne(new EntityWrapper<TCmsAdvpos>().eq("code", entity.getCode()).eq("is_deleted", Delete.未删除));
        if (cmsadv != null && !cmsadv.getId().equals(entity.getId())) {
            return Rest.failure("广告位代码已存在");
        }
        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除广告位表
     */
    @RequiresPermissions("deleteTCmsAdvpos")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除广告位")
    public Rest delete(Integer id) {
        EntityWrapper<TCmsAdv> ew = new EntityWrapper<TCmsAdv>();
        ew.eq("advpos_id", id);
        ew.eq("is_deleted", Delete.未删除);
        List<TCmsAdv> advList = cmsAdvService.selectList(ew);
        if (advList.size() > 0) {
            return Rest.failure("该广告位下面包含多个广告，请先删除相关广告");
        }
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 批量删除-分组
     *
     * @return
     */
    @RequiresPermissions("deleteTAppEntry")
    @RequestMapping("/deleteAll")
    @ResponseBody
    @Log("批量删除广告位")
    public Rest deleteAll(@RequestParam(value = "id[]") String[] id) {
        try {
            if (id == null) {
                return Rest.failure("请选择需删除记录");
            }
            List<String> listIds = Arrays.asList(id);
            for (String idli : listIds) {
                if (checkChildNode(Integer.parseInt(idli))) {
                    return Rest.failure("选择删除广告位包含：多个广告，请先删除相关广告");
                }
            }
            service.deleteBatchIds(listIds);
            return Rest.ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Rest.failure("删除异常");
    }

    /**
     * 编辑广告位表
     */
    @RequiresPermissions("editTCmsAdvpos")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TCmsAdvpos advpos = service.selectById(id);
        model.addAttribute("advpos", advpos);
        return "/system/adv/posedit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTCmsAdvpos")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑广告位")
    public Rest doEdit(@Valid TCmsAdvpos entity, Model model, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        TCmsAdvpos cmsadv = service.selectOne(new EntityWrapper<TCmsAdvpos>().eq("name", entity.getName()));
        if (cmsadv != null && !cmsadv.getId().equals(entity.getId())) {
            return Rest.failure("广告位名称已存在");
        }
        cmsadv = service.selectOne(new EntityWrapper<TCmsAdvpos>().eq("code", entity.getCode()));
        if (cmsadv != null && !cmsadv.getId().equals(entity.getId())) {
            return Rest.failure("广告位代码已存在");
        }
        service.updateById(entity);
        return Rest.ok();
    }


    private boolean checkChildNode(Integer id) {
        EntityWrapper ew = new EntityWrapper<TCmsAdv>();
        ew.eq("advpos_id", id);
        ew.eq("is_deleted", Delete.未删除);
        List<TCmsAdv> cmsAdvList = cmsAdvService.selectList(ew);
        if (cmsAdvList != null && !cmsAdvList.isEmpty()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 删除样表
     *
     * @return
     */
    @RequestMapping("file/delete")
    @ResponseBody
    public Rest delete(String key) {
        try {
            return Rest.ok("删除成功");
        } catch (Exception e) {
            return Rest.failure("删除失败");
        }
    }
}
