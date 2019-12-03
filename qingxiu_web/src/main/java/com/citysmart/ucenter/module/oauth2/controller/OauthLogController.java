package com.citysmart.ucenter.module.oauth2.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.oauth2.service.IOauthLogService;
import com.citysmart.ucenter.mybatis.model.oauth2.OauthLog;
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
 * 授权日志 前端控制器
 * </p>
 *
 * @author zhouyanjian
 * @since 2019-09-27
 */
@Controller
@RequestMapping("/oauth/log")
public class OauthLogController extends SuperController {

    @Autowired
    public IOauthLogService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize,
                       String search, Model model) {
        Page<OauthLog> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<OauthLog> ew = new EntityWrapper<OauthLog>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
            ew.like("client_id", search).or().like("gid", search);
        }
        ew.orderBy("dt_create", false);
        Page<OauthLog> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/appc/oauthlog/list" ;
    }



    /**
     * 删除授权日志
     */
    @RequiresPermissions("deleteOauthLog")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除授权日志")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑授权日志
     */
    @RequestMapping("/detail/{id}")
    public String detail(@PathVariable String id, Model model) {
        OauthLog entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/appc/oauthlog/detail" ;
    }

    /**
     * 编辑授权日志
     */
    @RequestMapping("/message/{id}")
    public String message(@PathVariable String id, Model model) {
        OauthLog entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/appc/oauthlog/message" ;
    }


}
