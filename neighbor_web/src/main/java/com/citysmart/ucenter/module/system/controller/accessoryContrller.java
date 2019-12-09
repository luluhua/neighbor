package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.util.ShiroUtil;
import com.citysmart.ucenter.module.system.service.ITSysAttachmentConfigService;
import com.citysmart.ucenter.module.system.service.ITSysAttachmentService;
import com.citysmart.ucenter.mybatis.model.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * @author li
 * @date 2019/5/30
 */
@Controller
@RequestMapping("/system/accessory")
public class accessoryContrller extends SuperController {

    @Value("${file.upload.url}")
    private String fileUrl;
    @Autowired
    public ITSysAttachmentService service;
    @Autowired
    public ITSysAttachmentConfigService attachmentConfigService;

    /**
     * 附件管理界面
     */
    @RequestMapping("/add")
    public String add(@RequestParam(defaultValue = "1") Integer pageNumber, Model model, Integer fileQuantity, String vessel, String classify, String dict) {
        Page<TSysAttachment> page = getPage(pageNumber, 12);
        model.addAttribute("pageSize", 12);
        // 查询分页
        EntityWrapper<TSysAttachment> ew = new EntityWrapper<TSysAttachment>();
        TSysUser sysUser = ShiroUtil.getSessionUser();
        ew.eq("create_userId", sysUser.getId());
        ew.orderBy("id", false);
        if (StringUtils.isNotBlank(classify)) {
            ew.eq("classify", classify);
        }
        Page<TSysAttachment> pageData = service.selectPage(page, ew);
        EntityWrapper<TSysAttachmentConfig> configew = new EntityWrapper<TSysAttachmentConfig>();
        ew.last("limit 1");
        TSysAttachmentConfig attachmentConfig = attachmentConfigService.selectOne(configew);
        model.addAttribute("pageData", pageData);
        model.addAttribute("quantity", fileQuantity);
        model.addAttribute("vessel", vessel);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("classify", classify);
        model.addAttribute("dict", dict);
        model.addAttribute("config", attachmentConfig);
        return "/system/accessory/accessory";
    }

    @RequestMapping("/deletefile/{fileid}")
    @ResponseBody
    public Map<String, Object> deletefile(@PathVariable String[] fileid) {
        Map<String, Object> result = new HashMap<String, Object>(fileid.length);
        String resultInfo = null;
        for (int i = 0; i < fileid.length; i++) {
            EntityWrapper<TSysAttachment> ew = new EntityWrapper<TSysAttachment>();
            ew.in("id", fileid[i]);
            TSysAttachment atta = service.selectOne(ew);
            EntityWrapper<TSysAttachment> deew = new EntityWrapper<TSysAttachment>();
            deew.eq("id", atta.getId());
            boolean fa = service.delete(deew);
            if (fa) {
                String sb = fileUrl + atta.getFilePath();
                File file = new File(sb);
                if (file.delete()) {
                    result.put("status", "0");
                } else {
                    result.put("status", "1");
                }
            }
        }
        return result;

    }


}
