package com.citysmart.ucenter.module.wholesalestore.controller;

import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.Util.ShiroUtil;
import com.citysmart.ucenter.module.commodity.service.ITGoodsCollectService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsCollect;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.ucenter.mybatis.entity.vo.goodsCollectVo;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.common.bean.Rest;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.commons.lang3.StringUtils;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author lz
 * @since 2020-03-26
 */
@Controller
@RequestMapping("/goodsCollect")
public class TGoodsCollectController extends SuperController {

    @Autowired
    public ITGoodsCollectService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list")
    public String list(Model model) {
        TLjUser ljUser = ShiroUtil.getSessionUser();
        if (ljUser != null) {
            List<goodsCollectVo> list = service.selectListByUser(ljUser.getId());
            model.addAttribute("list", list);
            return "/wholesalestore/personal/myGoodsCollect";
        }
        return "/wholesalestore/login";
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
     * 执行收藏
     */
    @RequestMapping("/operation")
    @ResponseBody
    @Log("收藏")
    public Rest doAdd(String id) {
        TLjUser ljUser = ShiroUtil.getSessionUser();
        if (ljUser != null) {
            Map map = new HashMap();
            EntityWrapper<TGoodsCollect> ew = new EntityWrapper<TGoodsCollect>();
            ew.eq("user_id", ljUser.getId());
            ew.eq("goods_id", id);
            ew.eq("is_deleted", Delete.未删除);
            TGoodsCollect entity = service.selectOne(ew);
            if (entity != null) {
                service.deleteById(entity.getId());
                map.put("state", 1);
                map.put("msg", "取消成功！");
            } else {
                TGoodsCollect goodsCollect = new TGoodsCollect();
                goodsCollect.setUserId(ljUser.getId());
                goodsCollect.setGoodsId(id);
                service.insert(entity);
                map.put("state", 2);
                map.put("msg", "收藏成功！");
            }
            return Rest.okData(map);
        }
        return Rest.failure("未登录");
    }

    /**
     * 删除
     */
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
