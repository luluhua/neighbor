package com.citysmart.ucenter.module.cms.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.bean.Rest;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.cms.service.ITCmsAdvmentService;
import com.citysmart.ucenter.mybatis.model.TCmsAdvment;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 广告附件表 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Controller
@RequestMapping("/cms/tCmsAdvment")
public class TCmsAdvmentController extends SuperController {

    @Autowired
    public ITCmsAdvmentService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TCmsAdvment> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TCmsAdvment> ew = new EntityWrapper<TCmsAdvment>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        Page<TCmsAdvment> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/tCmsAdvment/list";
    }

    /**
     * 新增广告附件表
     */
    @RequiresPermissions("addTCmsAdvment")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/tCmsAdvment/add";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTCmsAdvment")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增广告附件")
    public Rest doAdd(TCmsAdvment entity, String[] roleId) {

        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除广告附件表
     */
    @RequiresPermissions("deleteTCmsAdvment")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除广告附件")
    public Rest delete(String id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑广告附件表
     */
    @RequiresPermissions("editTCmsAdvment")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TCmsAdvment entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/tCmsAdvment/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTCmsAdvment")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑广告附件")
    public Rest doEdit(TCmsAdvment entity, Model model) {
        service.updateById(entity);
        return Rest.ok();
    }

}
