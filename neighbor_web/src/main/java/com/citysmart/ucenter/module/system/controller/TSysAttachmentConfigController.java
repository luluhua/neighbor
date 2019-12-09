package com.citysmart.ucenter.module.system.controller;

import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.mybatis.model.TSysAttachmentConfig;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.common.bean.Rest;
import com.citysmart.ucenter.module.system.service.ITSysAttachmentConfigService;
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
 * 附件上传配置 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2019-06-10
 */
@Controller
@RequestMapping("/system/tSysAttachmentConfig")
public class TSysAttachmentConfigController extends SuperController {

    @Autowired
    public ITSysAttachmentConfigService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TSysAttachmentConfig> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSysAttachmentConfig> ew = new EntityWrapper<TSysAttachmentConfig>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        Page<TSysAttachmentConfig> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/system/tsysattachmentconfig/list";
    }

    /**
     * 新增附件上传配置
     */
    @RequiresPermissions("addTSysAttachmentConfig")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/system/tsysattachmentconfig/edit";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTSysAttachmentConfig")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增附件上传配置")
    public Rest doAdd(@Valid TSysAttachmentConfig entity, BindingResult result) {
        if (entity.getId() != null) {
            service.updateById(entity);
        } else {
            service.insert(entity);
        }
        return Rest.ok();
    }

    /**
     * 删除附件上传配置
     */
    @RequiresPermissions("deleteTSysAttachmentConfig")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除附件上传配置")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑附件上传配置
     */
    @RequiresPermissions("editTSysAttachmentConfig")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TSysAttachmentConfig entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/system/tsysattachmentconfig/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTSysAttachmentConfig")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑附件上传配置")
    public Rest doEdit(@Valid TSysAttachmentConfig entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.updateById(entity);
        return Rest.ok();
    }

}
