package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.FileUtil;
import com.citysmart.ucenter.module.system.service.ITAttachmentsService;
import com.citysmart.ucenter.module.system.service.ITSysAttachmentService;
import com.citysmart.ucenter.module.system.service.ITSysDictService;
import com.citysmart.ucenter.mybatis.model.TAttachments;
import com.citysmart.ucenter.mybatis.model.TSysAttachment;
import com.citysmart.ucenter.mybatis.model.TSysDict;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Controller
@RequestMapping("/tAttachments/file")
public class TAttachmentsController extends SuperController {

    @Autowired
    public ITAttachmentsService service;

    @Autowired
    public ITSysAttachmentService sysAttachmentService;

    @Autowired
    public ITSysDictService sysDictService;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, String serviceId, Model model) {
        Page<TSysAttachment> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSysAttachment> ew = new EntityWrapper<TSysAttachment>();
        ew.orderBy("create_datetime", false);
        if (StringUtils.isNotBlank(search)) {
            ew.eq("classify", search);
            model.addAttribute("search", search);
        }
        Page<TSysAttachment> pageData = sysAttachmentService.selectPage(page, ew);
        EntityWrapper<TSysDict> dicyew = new EntityWrapper<TSysDict>();
        dicyew.eq("code", "file");
        TSysDict dict = sysDictService.selectOne(dicyew);
        EntityWrapper<TSysDict> dicyews = new EntityWrapper<TSysDict>();
        dicyews.eq("module_id", dict.getId());
        List<TSysDict> dictlist = sysDictService.selectList(dicyews);
        model.addAttribute("dictlist", dictlist);
        model.addAttribute("pageData", pageData);
        return "/system/file/list";
    }


    /**
     * 新增
     */
    @RequiresPermissions("addTAttachments")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/tAttachments/add";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTAttachments")
    @RequestMapping("/doAdd")
    @ResponseBody
    public Rest doAdd(TAttachments entity, String[] roleId) {

        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除
     */
    @RequiresPermissions("deleteTAttachments")
    @RequestMapping("/delete")
    @ResponseBody
    public Rest delete(Integer id) {
        delFile(id);
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 批量删除
     *
     * @return
     */
    @RequiresPermissions("deleteTAttachments")
    @RequestMapping("/deleteAll")
    @ResponseBody
    public Rest deleteAll(@RequestParam(value = "id[]") String[] id) {
        try {
            if (id == null) {
                return Rest.failure("请选择需删除记录");
            }
            List<String> listIds = Arrays.asList(id);
            delFileList(listIds);
            service.deleteBatchIds(listIds);
            return Rest.ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Rest.failure("删除异常");
    }

    /**
     * 编辑
     */
    @RequiresPermissions("editTAttachments")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TAttachments entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/tAttachments/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTAttachments")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(TAttachments entity, Model model) {
        service.updateById(entity);
        return Rest.ok();
    }

    /**
     * 批量删除文件（硬盘物理删除）
     *
     * @param listIds
     */
    private void delFileList(List<String> listIds) {
        try {
            TAttachments tAttachments = null;
            for (String id : listIds) {
                tAttachments = service.selectById(id);
                if (tAttachments != null) {
                    FileUtil.remove(FileUtil.getFile(tAttachments.getFileUrl()));
                }
            }
        } catch (Exception e) {
            logger.error("删除附件时异常：删除本地图片错误,错误信息:" + e.getMessage());
        }
    }

    /**
     * 删除单个文件（硬盘物理删除）
     *
     * @param fileId
     */
    private void delFile(Integer fileId) {
        TAttachments tAttachments = service.selectById(fileId);
        if (tAttachments != null) {
            FileUtil.remove(FileUtil.getFile(tAttachments.getFileUrl()));
        }
    }

}
