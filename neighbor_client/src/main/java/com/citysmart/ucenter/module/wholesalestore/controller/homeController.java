package com.citysmart.ucenter.module.wholesalestore.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.Util.RedisUtil;
import com.citysmart.ucenter.module.cms.service.ITCmsAdvService;
import com.citysmart.ucenter.module.cms.service.ITCmsAdvposService;
import com.citysmart.ucenter.module.commodity.service.ITGoodsService;
import com.citysmart.ucenter.module.system.service.ITAttachmentsService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.TAttachments;
import com.citysmart.ucenter.mybatis.model.TCmsAdv;
import com.citysmart.ucenter.mybatis.model.TCmsAdvpos;
import com.citysmart.ucenter.mybatis.model.commodity.TGoods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author li
 * @date 2019/12/5
 */
@Controller
@RequestMapping("/eec")
public class homeController extends SuperController {

    @Autowired
    public ITCmsAdvService service;

    @Autowired
    public ITCmsAdvposService advposService;

    @Autowired
    public ITAttachmentsService itAttachmentsService;

    @Autowired
    private ITGoodsService goodsService;

    public final static String ICON_PREFIX = RedisUtil.getValueByKey("http.img.url");

    public final static String INDEX_ADV_CODE = "app-home";

    public final static String INGORM_CODE = "tzgg";

    public final static String RENTOUT_SELL = "rentout-sell";

    public final static String MAINTAIN = "maintain";

    public final static String TIME_SJ = "time-sj";

    public final static String ZYDB = "zybd";

    public final static String CARRY = "carry";

    public final static Integer NUMBER = 1;

    public final static Integer SIZE = 8;


    @RequestMapping("/index")
    public String show(Model model) {
        List advList = advLists();
        //广告
        model.addAttribute("adv", advList);
        //通知公告
        model.addAttribute("inform", informList());

        //资源列表
        model.addAttribute("goods", indexGoodsList());

        return "/wholesalestore/index";
    }

    /**
     * 广告列表
     *
     * @return
     */
    public List advLists() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        EntityWrapper<TCmsAdvpos> posEw = new EntityWrapper<TCmsAdvpos>();
        posEw.eq("is_deleted", Delete.未删除);
        posEw.where("(code like CONCAT('%',{0},'%'))", INDEX_ADV_CODE);
        posEw.orderBy("sort_index", false);
        List<TCmsAdvpos> posList = advposService.selectList(posEw);
        List advlist = new ArrayList();
        for (TCmsAdvpos advpos : posList) {
            Map<String, Object> posmap = new HashMap(16);
            EntityWrapper<TCmsAdv> ew = new EntityWrapper<TCmsAdv>();
            ew.eq("advpos_id", advpos.getId());
            ew.orderBy("sort_index", false);
            ew.eq("is_deleted", Delete.未删除);
            ew.where("status=1");
            ew.addFilter(" dt_end >= {0}", df.format(new Date()));
            ew.addFilter(" dt_start <= {0}", df.format(new Date()));
            List<TCmsAdv> advList = service.selectList(ew);
            List adv = new ArrayList();
            for (TCmsAdv advs : advList) {
                Map<String, Object> map = new HashMap(16);
                map.put("title", advs.getAdvTitle());
                map.put("linkUrl", advs.getLinkUrl());
                if (advs.getAdvType() != 2) {
                    EntityWrapper<TAttachments> attaEw = new EntityWrapper<>();
                    attaEw.eq("service_id", advs.getId());
                    List<TAttachments> attalist = itAttachmentsService.selectList(attaEw);
                    if (attalist.size() > 0) {
                        map.put("imgUrl", ICON_PREFIX + attalist.get(0).getFileUrl());
                    }
                }
                adv.add(map);
            }
            posmap.put("advList", adv);
            posmap.put("name", advpos.getName());
            advlist.add(posmap);
        }
        return advlist;
    }

    /**
     * 通知公告
     *
     * @return
     */
    public List informList() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        EntityWrapper<TCmsAdvpos> posEw = new EntityWrapper<TCmsAdvpos>();
        posEw.eq("code", INGORM_CODE);
        List<TCmsAdvpos> posList = advposService.selectList(posEw);
        List informList = new ArrayList<>();
        for (TCmsAdvpos advpos : posList) {
            EntityWrapper<TCmsAdv> ew = new EntityWrapper<TCmsAdv>();
            ew.eq("advpos_id", advpos.getId());
            ew.orderBy("sort_index", false);
            ew.eq("is_deleted", Delete.未删除);
            ew.where("status=1");
            ew.addFilter(" dt_end >= {0}", df.format(new Date()));
            ew.addFilter(" dt_start <= {0}", df.format(new Date()));
            List<TCmsAdv> inform = service.selectList(ew);
            for (TCmsAdv adv : inform) {
                Map<String, Object> map = new HashMap(16);
                map.put("title", adv.getAdvTitle());
                map.put("remark", adv.getAdvRemark());
                informList.add(map);
            }
        }
        return informList;
    }

    /**
     * 资源
     *
     * @return
     */
    public List indexGoodsList() {
        List informList = new ArrayList<>();
        Page<TGoods> page = getPage(NUMBER, SIZE);
        EntityWrapper<TGoods> seelew = new EntityWrapper<TGoods>();
        seelew.eq("is_deleted", Delete.未删除);
        seelew.eq("navigation_code", RENTOUT_SELL);
        Page<TGoods> rentoutSellList = goodsService.selectPage(page, seelew);

        EntityWrapper<TGoods> maintainew = new EntityWrapper<TGoods>();
        maintainew.eq("is_deleted", Delete.未删除);
        maintainew.eq("navigation_code", MAINTAIN);
        Page<TGoods> maintainList = goodsService.selectPage(page, maintainew);

        EntityWrapper<TGoods> sjew = new EntityWrapper<TGoods>();
        sjew.eq("is_deleted", Delete.未删除);
        sjew.eq("navigation_code", TIME_SJ);
        Page<TGoods> sjList = goodsService.selectPage(page, sjew);

        EntityWrapper<TGoods> zydbew = new EntityWrapper<TGoods>();
        zydbew.eq("is_deleted", Delete.未删除);
        zydbew.eq("navigation_code", ZYDB);
        Page<TGoods> zydbewList = goodsService.selectPage(page, zydbew);

        EntityWrapper<TGoods> carryew = new EntityWrapper<TGoods>();
        carryew.eq("is_deleted", Delete.未删除);
        carryew.eq("navigation_code", CARRY);
        Page<TGoods> carryewList = goodsService.selectPage(page, carryew);
        Map<String, Object> map = new HashMap(16);
        map.put("rentoutSellList", rentoutSellList.getRecords());
        map.put("maintainList", maintainList.getRecords());
        map.put("sjList", sjList.getRecords());
        map.put("zydbewList", zydbewList.getRecords());
        map.put("carryewList", carryewList.getRecords());
        informList.add(map);
        return informList;
    }
}
