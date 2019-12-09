package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.common.util.RedisUtil;
import com.citysmart.ucenter.module.system.service.ISysSettingService;
import com.citysmart.ucenter.module.system.service.ITAppMobileWhiteListService;
import com.citysmart.ucenter.module.system.service.ITSmsConfigService;
import com.citysmart.ucenter.module.system.service.ITSysAttachmentConfigService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.SysSetting;
import com.citysmart.ucenter.mybatis.model.TSmsConfig;
import com.citysmart.ucenter.mybatis.model.TSysAttachmentConfig;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//import org.apache.shiro.authz.annotation.RequiresPermissions;

/**
 * 系统设置控制器
 *
 * @author Gaojun.Zhou
 * @date 2016年12月16日 下午4:24:13
 */
@Controller
@RequestMapping("/system/setting")
public class SettingController extends SuperController {

    @Autowired
    private ISysSettingService sysSettingService;
    @Autowired
    public ITSmsConfigService smsConfigService;
    @Autowired
    public ITSysAttachmentConfigService attachmentConfigService;
    @Autowired
    public ITAppMobileWhiteListService appMobileWhiteListService;


    /**
     * 查询系统设置
     */
    @RequiresPermissions("listSetting")
    @RequestMapping("/page")
    public String page(Model model) {

        List<SysSetting> list = sysSettingService.selectList(new EntityWrapper<SysSetting>().orderBy("sort", true));
        model.addAttribute("list", list);
        return "/system/setting/page";
    }

    @RequiresPermissions("doSetting")
    @Log("更新系统设置")
    @RequestMapping("/doSetting")
    public String doSetting(Integer[] id, String[] sysValue, Model model, RedirectAttributes redirectAttributes) {

        List<SysSetting> sysSettings = new ArrayList<SysSetting>();
        if (ArrayUtils.isNotEmpty(id)) {
            for (int i = 0; i < id.length; i++) {
                SysSetting setting = new SysSetting();
                setting.setId(id[i]);
                setting.setSysValue(sysValue[i]);
                sysSettings.add(setting);
                setting = sysSettingService.selectById(id[i]);
                updateRedis(setting);
            }
        }
        sysSettingService.updateBatchById(sysSettings);
        redirectAttributes.addFlashAttribute("info", "OK,更新成功!");
        return redirectTo("/system/setting/page");

    }

    private void updateRedis(SysSetting setting) {
        SysSetting settings =
                sysSettingService.selectOne(new EntityWrapper<SysSetting>().eq("sysKey", "spring.redis.keyPrefix"));
        if (settings != null) {
            RedisUtil.delCustomPackageKey(settings.getSysValue() + ".manage", setting.getSysKey());
            RedisUtil.delCustomPackageKey(settings.getSysValue() + ".api", setting.getSysKey());
            RedisUtil.setCustomPackageKeyValue(settings.getSysValue() + ".manage", setting.getSysKey(), setting.getSysValue());
            RedisUtil.setCustomPackageKeyValue(settings.getSysValue() + ".api", setting.getSysKey(), setting.getSysValue());
        }
    }

    /**
     * 新增
     */
    @RequiresPermissions("doSetting")
    @RequestMapping("/add/{code}")
    public String add(@PathVariable Integer code, Model model) {
        model.addAttribute("code", code);
        return "/system/setting/add";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("doSetting")
    @RequestMapping("/doAdd")
    @ResponseBody
    public Rest doAdd(SysSetting entity) {

        sysSettingService.insert(entity);
        updateRedis(entity);
        return Rest.ok();
    }


    /**
     * 编辑部门
     */
    @RequiresPermissions("doSetting")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable Integer id, Integer code, Model model) {
        SysSetting setting = sysSettingService.selectById(id);
        model.addAttribute("setting", setting);
        model.addAttribute("code", code);
        return "/system/setting/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("doSetting")
    @Log("编辑系统设置")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(SysSetting setting, Model model) {
        sysSettingService.updateById(setting);
        updateRedis(setting);
        return Rest.ok();
    }

    /**
     * 查询短信配置
     */
//    @RequiresPermissions("selectSmsSetting")
//    @RequestMapping("/selectSmsSetting")
//    @ResponseBody
//    public Rest selectSmsSetting(Model model) {
//        EntityWrapper<TSmsConfig> ew = new EntityWrapper<TSmsConfig>();
//        ew.last("limit 1");
//        TSmsConfig smsConfig = smsConfigService.selectOne(ew);
//        return Rest.okData(smsConfig);
//    }

    /**
     * 更新短信配置
     *
     * @param smsConfig
     * @param model
     * @return
     */
    @RequiresPermissions("doSmsSetting")
    @Log("更新短信配置")
    @RequestMapping("/doSmsSetting")
    @ResponseBody
    public Rest doSmsSetting(TSmsConfig smsConfig, Model model) {

        EntityWrapper<TSmsConfig> ew = new EntityWrapper<TSmsConfig>();
        ew.eq("id", smsConfig.getId());
        boolean fa = false;
        smsConfig.setDtCreate(new Date());
        if (smsConfig.getId() == null) {
            fa = smsConfigService.insert(smsConfig);
        } else {
            fa = smsConfigService.update(smsConfig, ew);
        }
        if (fa) {
            return Rest.ok();
        }
        return Rest.failure("更新短信配置异常");

    }

    /**
     * 查询附件配置
     */
    @RequestMapping("/selectAttachmentConfig")
    @ResponseBody
    public Rest selectAttachmentConfig(Model model) {
        EntityWrapper<TSysAttachmentConfig> ew = new EntityWrapper<TSysAttachmentConfig>();
        ew.last("limit 1");
        TSysAttachmentConfig attachmentConfig = attachmentConfigService.selectOne(ew);
        return Rest.okData(attachmentConfig);
    }


}
