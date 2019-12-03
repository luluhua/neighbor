package com.citysmart.ucenter.module.cms.controller;

import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.cms.service.ITCmsProgramService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.TCmsProgram;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.commons.lang3.StringUtils;

import javax.validation.Valid;


/**
 * <p>
 * 内容栏目表 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-04-01
 */
@Controller
@RequestMapping("/cms/tCmsProgram")
public class TCmsProgramController extends SuperController {

    @Autowired
    public ITCmsProgramService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TCmsProgram> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TCmsProgram> ew = new EntityWrapper<TCmsProgram>();
        ew.where("is_deleted=0");
        ew.orderBy("dt_create", false);
        if (StringUtils.isNotBlank(search)) {
            ew.where("(title like CONCAT('%',{0},'%')", search)
                    .or("code like CONCAT('%',{0},'%'))", search);
            model.addAttribute("search", search);
        }
        Page<TCmsProgram> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/system/tcmsprogram/list";
    }

    /**
     * 新增内容栏目表
     */
    @RequiresPermissions("addTCmsProgram")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/system/tcmsprogram/add";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTCmsProgram")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增内容栏目")
    public Rest doAdd(@Valid TCmsProgram entity, String[] roleId, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        TCmsProgram cmsProgram = service.selectOne(new EntityWrapper<TCmsProgram>().eq("title", entity.getTitle()).eq("is_deleted", Delete.未删除));
        if (cmsProgram != null && !cmsProgram.getId().equals(entity.getId())) {
            return Rest.failure("栏目名称已存使用");
        }
        cmsProgram = service.selectOne(new EntityWrapper<TCmsProgram>().eq("code", entity.getCode()).eq("is_deleted", Delete.未删除));
        if (cmsProgram != null && !cmsProgram.getId().equals(entity.getId())) {
            return Rest.failure("栏目编号已使用");
        }
        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除内容栏目表
     */
    @RequiresPermissions("deleteTCmsProgram")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除内容栏目")
    public Rest delete(Integer id) {
        EntityWrapper<TCmsProgram> ew = new EntityWrapper<TCmsProgram>();
        ew.eq("id", id);
        TCmsProgram cmsProgram = new TCmsProgram();
        cmsProgram.setIsDeleted(Delete.已删除.getValue());
        service.update(cmsProgram, ew);
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑内容栏目表
     */
    @RequiresPermissions("editTCmsProgram")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TCmsProgram entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/system/tcmsprogram/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTCmsProgram")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑内容栏目")
    public Rest doEdit(@Valid TCmsProgram entity, Model model, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        TCmsProgram cmsProgram = service.selectOne(new EntityWrapper<TCmsProgram>().eq("title", entity.getTitle()).eq("is_deleted", Delete.未删除));
        if (cmsProgram != null && !cmsProgram.getId().equals(entity.getId())) {
            return Rest.failure("栏目名称已存使用");
        }
        cmsProgram = service.selectOne(new EntityWrapper<TCmsProgram>().eq("code", entity.getCode()).eq("is_deleted", Delete.未删除));
        if (cmsProgram != null && !cmsProgram.getId().equals(entity.getId())) {
            return Rest.failure("栏目编号已使用");
        }
        service.updateById(entity);
        return Rest.ok();
    }

}
