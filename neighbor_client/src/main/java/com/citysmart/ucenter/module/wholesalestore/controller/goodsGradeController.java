package com.citysmart.ucenter.module.wholesalestore.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.Util.PWDStrongUtil;
import com.citysmart.ucenter.module.commodity.service.ITGoodsGradeService;
import com.citysmart.ucenter.mybatis.entity.vo.GoodsGradeVo;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.TSmsSendLog;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsGrade;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author li
 * @date 2019/12/25
 */
@Controller
@RequestMapping("/grade")
public class goodsGradeController extends SuperController {

    @Autowired
    private ITGoodsGradeService goodsGradeService;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String goodsId, Model model) {
        Page<GoodsGradeVo> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        Page<GoodsGradeVo> pageData = goodsGradeService.getGradeListByGoodsId(page, goodsId);
        model.addAttribute("pageData", pageData);
        model.addAttribute("goodsId", goodsId);
        return "/wholesalestore/resource/goodsgradeList";
    }

}
