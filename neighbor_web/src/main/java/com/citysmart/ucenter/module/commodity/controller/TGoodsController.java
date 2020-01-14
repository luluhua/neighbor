package com.citysmart.ucenter.module.commodity.controller;

import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.mybatis.model.commodity.TGoods;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.common.bean.Rest;
import com.citysmart.ucenter.module.commodity.service.ITGoodsService;
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
 * 物品信息表 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Controller
@RequestMapping("/commodity/tGoods")
public class TGoodsController extends SuperController {

    @Autowired
    public ITGoodsService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, String userId, Model model) {

        Page<TGoods> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TGoods> ew = new EntityWrapper<TGoods>();
        ew.eq("user_id", userId);
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        Page<TGoods> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        model.addAttribute("userId", userId);
        return "/commodity/tGoods/list";
    }

    /**
     * 新增物品信息表
     */
    @RequiresPermissions("addTGoods")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/commodity/tGoods/edit";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTGoods")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增物品信息表")
    public Rest doAdd(@Valid TGoods entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除物品信息表
     */
    @RequiresPermissions("deleteTGoods")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除物品信息表")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑物品信息表
     */
    @RequiresPermissions("editTGoods")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TGoods entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/commodity/tGoods/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTGoods")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑物品信息表")
    public Rest doEdit(@Valid TGoods entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.updateById(entity);
        return Rest.ok();
    }

}
