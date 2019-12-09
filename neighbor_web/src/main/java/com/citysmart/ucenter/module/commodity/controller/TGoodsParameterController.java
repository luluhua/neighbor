package com.citysmart.ucenter.module.commodity.controller;

import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsParameter;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.common.bean.Rest;
import com.citysmart.ucenter.module.commodity.service.ITGoodsParameterService;
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
 * 物品参数表 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Controller
@RequestMapping("/commodity/tGoodsParameter")
public class TGoodsParameterController extends SuperController {

    @Autowired
    public ITGoodsParameterService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TGoodsParameter> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TGoodsParameter> ew = new EntityWrapper<TGoodsParameter>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        Page<TGoodsParameter> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/commodity/tGoodsParameter/list";
    }

    /**
     * 新增物品参数表
     */
    @RequiresPermissions("addTGoodsParameter")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/commodity/tGoodsParameter/edit";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTGoodsParameter")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增物品参数表")
    public Rest doAdd(@Valid TGoodsParameter entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除物品参数表
     */
    @RequiresPermissions("deleteTGoodsParameter")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除物品参数表")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑物品参数表
     */
    @RequiresPermissions("editTGoodsParameter")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TGoodsParameter entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/commodity/tGoodsParameter/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTGoodsParameter")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑物品参数表")
    public Rest doEdit(@Valid TGoodsParameter entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.updateById(entity);
        return Rest.ok();
    }

}
