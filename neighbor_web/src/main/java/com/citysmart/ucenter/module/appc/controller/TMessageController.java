package com.citysmart.ucenter.module.appc.controller;

import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.mybatis.model.app.TMessage;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.common.bean.Rest;
import com.citysmart.ucenter.module.appc.service.ITMessageService;
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
 * 前端控制器
 * </p>
 *
 * @author lub
 * @since 2020-01-16
 */
@Controller
@RequestMapping("/appc/tMessage")
public class TMessageController extends SuperController {

    @Autowired
    public ITMessageService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TMessage> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TMessage> ew = new EntityWrapper<TMessage>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        Page<TMessage> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/appc/tMessage/list";
    }

    /**
     * 新增
     */
    @RequiresPermissions("addTMessage")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/appc/tMessage/edit";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTMessage")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增")
    public Rest doAdd(@Valid TMessage entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除
     */
    @RequiresPermissions("deleteTMessage")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑
     */
    @RequiresPermissions("editTMessage")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TMessage entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/appc/tMessage/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTMessage")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑")
    public Rest doEdit(@Valid TMessage entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.updateById(entity);
        return Rest.ok();
    }

}
