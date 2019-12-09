package com.citysmart.ucenter.module.oauth2.controller;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.MyPasswordEncoder;
import com.citysmart.ucenter.module.oauth2.service.IOauthClientsService;
import com.citysmart.ucenter.mybatis.model.oauth2.OauthClients;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
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
import java.util.Date;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2019-07-05
 */
@Controller
@RequestMapping("/appc/oauthClients")
public class OauthClientsController extends SuperController {

    @Autowired
    public IOauthClientsService iOauthClientsService;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<OauthClients> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<OauthClients> ew = new EntityWrapper<OauthClients>();
        if (StringUtils.isNotBlank(search)) {
            ew.where("applicationProvider like CONCAT('%',{0},'%')", search);
            model.addAttribute("search", search);
        }
        Page<OauthClients> pageData = iOauthClientsService.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/appc/oauth2/clients/list";
    }

    /**
     * 新增
     */
    @RequiresPermissions("addOauthClients")
    @RequestMapping("/add")
    public String add(Model model) {

        model.addAttribute("entity", new OauthClients());
        return "/appc/oauth2/clients/edit";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addOauthClients")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增授权客户端信息")
    public Rest doAdd(@Valid OauthClients entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        entity.setCreateTime(new Date());
        entity.setSecretRequired(true);
        entity.setScoped(true);
        entity.setAutoApprove(false);
        entity.setVerifyDomainName(true);
        entity.setResourceIds("boot-server");
        //生成APPID
        entity.setClientId(IdUtil.simpleUUID());
        String secret = IdUtil.simpleUUID();
        entity.setClientSecretPlaintext(secret);
        MyPasswordEncoder myPasswordEncoder = new MyPasswordEncoder();
        String pwd = myPasswordEncoder.encode(secret);
        //生成APPSecret
        entity.setClientSecret(pwd);
        iOauthClientsService.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除
     */
    @RequiresPermissions("deleteOauthClients")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除授权客户端信息")
    public Rest delete(Integer id) {
        iOauthClientsService.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑
     */
    @RequiresPermissions("editOauthClients")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        OauthClients entity = iOauthClientsService.selectById(id);

        model.addAttribute("entity", entity);
        return "/appc/oauth2/clients/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editOauthClients")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑授权客户端信息")
    public Rest doEdit(@Valid OauthClients entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        entity.setModifyTime(new Date());
        iOauthClientsService.updateById(entity);
        return Rest.ok();
    }

}
