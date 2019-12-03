package com.citysmart.ucenter.module.appc.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.appc.service.ITAppUserSharedetailService;
import com.citysmart.ucenter.mybatis.model.app.TAppUserSharedetail;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2019-09-02
 */
@Controller
@RequestMapping("/appc/tAppUserSharedetail")
public class TAppUserSharedetailController extends SuperController {

    @Autowired
    public ITAppUserSharedetailService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize,
                       String search, String daterange, String shareCode, String searchIp, String mobile, Model model) {

        Page<TAppUserSharedetail> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TAppUserSharedetail> ew = new EntityWrapper<TAppUserSharedetail>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
            ew.like("equipmentToken", search);
        }
        if (StringUtils.isNotBlank(mobile)) {
            model.addAttribute("mobile", mobile);
            ew.eq("mobile", mobile);
        }
        if (StringUtils.isNotBlank(searchIp)) {
            model.addAttribute("searchIp", searchIp);
            ew.like("clientIp", searchIp);
        }
        if (StringUtils.isNotBlank(shareCode)) {
            model.addAttribute("shareCode", shareCode);
            ew.eq("share_code", shareCode);
        }
        //日期查询
        if (StringUtils.isNotBlank(daterange)) {
            model.addAttribute("daterange", daterange);
            String[] dateranges = StringUtils.split(daterange, "-");
            ew.addFilter(" dt_browse >= {0}", dateranges[0].trim().replaceAll("/", "-") + " 00:00:00");
            ew.addFilter(" dt_browse <= {0}", dateranges[1].trim().replaceAll("/", "-") + " 23:59:59");
        }
        Page<TAppUserSharedetail> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/appc/shareLog/shareDetiaLlist";
    }


    /**
     * 删除
     */
    @RequiresPermissions("deleteTAppUserSharedetail")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public String info(Model model, Integer id) {
        String viewUrl = "/appc/shareLog/shareDetiaInfo";
        if (id == 0) {
            model.addAttribute("msg", "分项数据已删除");
            return viewUrl;
        }
        TAppUserSharedetail sharedetail = service.selectById(id);
        model.addAttribute("entity", sharedetail);
        return viewUrl;
    }


}
