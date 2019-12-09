package com.citysmart.ucenter.module.commodity.controller;

import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsGrade;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.common.bean.Rest;
import com.citysmart.ucenter.module.commodity.service.ITGoodsGradeService;
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
 * 物品评分表 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Controller
@RequestMapping("/commodity/tGoodsGrade")
public class TGoodsGradeController extends SuperController {

@Autowired
public ITGoodsGradeService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public  String list(@PathVariable Integer pageNumber,@RequestParam(defaultValue="15") Integer pageSize, String search,Model model){

            Page<TGoodsGrade> page = getPage(pageNumber,pageSize);
            model.addAttribute("pageSize", pageSize);
            // 查询分页
            EntityWrapper<TGoodsGrade> ew = new EntityWrapper<TGoodsGrade>();
            if(StringUtils.isNotBlank(search)){
                model.addAttribute("search",search);
            }
            Page<TGoodsGrade> pageData = service.selectPage(page, ew);
            model.addAttribute("pageData", pageData);
            return "/commodity/tGoodsGrade/list";
    }

    /**
     * 新增物品评分表
     */
    @RequiresPermissions("addTGoodsGrade")
    @RequestMapping("/add")
    public  String add(Model model){
            return "/commodity/tGoodsGrade/edit";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTGoodsGrade")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增物品评分表")
    public Rest doAdd(@Valid TGoodsGrade entity, BindingResult result){
        if(result.hasErrors()){
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.insert(entity);
        return Rest.ok();
    }
    /**
     * 删除物品评分表
     */
    @RequiresPermissions("deleteTGoodsGrade")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除物品评分表")
    public  Rest delete(Integer id){
            service.deleteById(id);
            return Rest.ok();
    }

    /**
     * 编辑物品评分表
     */
    @RequiresPermissions("editTGoodsGrade")
    @RequestMapping("/edit/{id}")
    public  String edit(@PathVariable String id,Model model){
            TGoodsGrade entity = service.selectById(id);

            model.addAttribute("entity",entity);
            return "/commodity/tGoodsGrade/edit";
    }
    /**
     * 执行编辑
     */
    @RequiresPermissions("editTGoodsGrade")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑物品评分表")
    public  Rest doEdit(@Valid TGoodsGrade entity,BindingResult result){
        if(result.hasErrors()){
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.updateById(entity);
        return Rest.ok();
    }

}
