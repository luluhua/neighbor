package com.citysmart.ucenter.module.commodity.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.commodity.service.ITGoodsCollectService;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsCollect;
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


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author lub
 * @since 2020-03-26
 */
@Controller
@RequestMapping("/app/tGoodsCollect")
public class TGoodsCollectController extends SuperController {

    @Autowired
    public ITGoodsCollectService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TGoodsCollect> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TGoodsCollect> ew = new EntityWrapper<TGoodsCollect>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        Page<TGoodsCollect> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/app/tGoodsCollect/list";
    }

    /**
     * 新增
     */
    @RequiresPermissions("addTGoodsCollect")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/app/tGoodsCollect/edit";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTGoodsCollect")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增")
    public Rest doAdd(@Valid TGoodsCollect entity, BindingResult result) {
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
    @RequiresPermissions("deleteTGoodsCollect")
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
    @RequiresPermissions("editTGoodsCollect")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TGoodsCollect entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/app/tGoodsCollect/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTGoodsCollect")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑")
    public Rest doEdit(@Valid TGoodsCollect entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.updateById(entity);
        return Rest.ok();
    }

}
