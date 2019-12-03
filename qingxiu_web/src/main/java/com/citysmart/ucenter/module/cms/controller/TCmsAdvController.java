package com.citysmart.ucenter.module.cms.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.CommonUtil;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.common.util.FileUpladUtil;
import com.citysmart.ucenter.module.cms.service.ITCmsAdvService;
import com.citysmart.ucenter.module.cms.service.ITCmsAdvposService;
import com.citysmart.ucenter.module.system.service.ITAttachmentsService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.TAttachments;
import com.citysmart.ucenter.mybatis.model.TCmsAdv;
import com.citysmart.ucenter.mybatis.model.TCmsAdvpos;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 广告内容表 前端控制器
 *
 * @author lub
 * @since 2019-03-04
 */
@Controller
@RequestMapping("/cms/tCmsAdv")
public class TCmsAdvController extends SuperController {


    public final static Integer ADV_TYPE_2 = 2;

    @Autowired
    public ITCmsAdvService service;

    @Autowired
    public ITCmsAdvposService poservice;
    @Autowired
    public ITAttachmentsService attachmentsService;

    @Autowired
    public ITAttachmentsService itAttachmentsService;

    /**
     * 分页查询
     */
    @RequiresPermissions("TCmsAdvList")
    @RequestMapping("/list/{pageNumber}")
    public String list(
            @PathVariable Integer pageNumber,
            @RequestParam(defaultValue = "15") Integer pageSize, Integer advPosId, String search, Model model) {

        Page<TCmsAdv> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TCmsAdv> ew = new EntityWrapper<TCmsAdv>();
        ew.eq("is_deleted", Delete.未删除);
        ew.eq("advpos_id", advPosId);
        ew.orderBy("sort_index", false);
        if (StringUtils.isNotBlank(search)) {
            ew.where("(adv_title like CONCAT('%',{0},'%')", search)
                    .or("adv_remark like CONCAT('%',{0},'%'))", search);
            model.addAttribute("search", search);
        }
        TCmsAdvpos advpos = poservice.selectById(advPosId);
        Page<TCmsAdv> pageData = service.selectPage(page, ew);
        TCmsAdv vo = null;
        List<TCmsAdv> list = new ArrayList<>();
        if (pageData.getRecords().size() > 0) {
            for (int i = 0; i < pageData.getRecords().size(); i++) {
                vo = new TCmsAdv();
                vo = pageData.getRecords().get(i);
                EntityWrapper<TAttachments> attaEw = new EntityWrapper<>();
                attaEw.eq("service_id", pageData.getRecords().get(i).getId());
                List<TAttachments> attalist = itAttachmentsService.selectList(attaEw);
                if (attalist.size() > 0) {
                    vo.setContent(attalist.get(0).getFileUrl());
                }
                list.add(vo);
            }
        }
        model.addAttribute("list", list);
        model.addAttribute("pageData", pageData);
        model.addAttribute("advpos", advpos);
        return "/system/adv/list";
    }

    /**
     * 新增广告内容表
     */
    @RequiresPermissions("addTCmsAdv")
    @RequestMapping("/add/{advPosId}")
    public String add(@PathVariable Integer advPosId, Model model) {
        TCmsAdvpos cmsAdvpos = poservice.selectById(advPosId);
        EntityWrapper<TCmsAdv> ew = new EntityWrapper<TCmsAdv>();
        ew.orderBy("sort_index", false);
        ew.eq("is_deleted", Delete.未删除);
        TCmsAdv sortIndex = service.selectOne(ew);
        int sortIndexs = 10;
        if (sortIndex != null) {
            sortIndexs = sortIndex.getSortIndex() + 10;
        }
        model.addAttribute("sortIndex", sortIndexs);
        model.addAttribute("cmsAdvpos", cmsAdvpos);
        model.addAttribute("uuid", CommonUtil.UUID());

        return "/system/adv/add";
    }

    /**
     * 执行新增
     */
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增广告内容")
    public Rest doAdd(@Valid TCmsAdv entity, String daterange, BindingResult result, String fileurl) throws Exception {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        String[] dateranges = StringUtils.split(daterange, "-");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        entity.setDtStart(sdf.parse(dateranges[0].trim().replaceAll("/", "-") + " 00:00:00"));
        entity.setDtEnd(sdf.parse(dateranges[1].trim().replaceAll("/", "-") + " 23:59:59"));
        service.insert(entity);
        if (StringUtils.isNotBlank(fileurl)) {
            TAttachments attachments = new TAttachments();
            attachments.setServiceId(entity.getId());
            attachments.setFileUrl(fileurl);
            attachments.setDtCreate(new Date());
            attachments.setSortIndex(1);
            FileUpladUtil.add(attachments);
        }

        return Rest.ok("/cms/tCmsAdv/list/1?advPosId=" + entity.getAdvposId());
    }

    /**
     * 删除广告内容表
     */
    @RequiresPermissions("deleteTCmsAdv")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除广告内容")
    public Rest delete(String id) {
        service.updateIsDeletedById(id);
        return Rest.ok();
    }

    /**
     * 编辑广告内容表
     */
    @RequiresPermissions("editTCmsAdv")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TCmsAdv entity = service.selectById(id);
        EntityWrapper<TCmsAdvpos> posew = new EntityWrapper<TCmsAdvpos>();
        posew.orderBy("sort_index", false);
        posew.eq("is_deleted", Delete.未删除);
        List<TCmsAdvpos> posList = poservice.selectList(posew);
        TCmsAdvpos pos = poservice.selectById(entity.getAdvposId());
        EntityWrapper<TAttachments> attaEw = new EntityWrapper<>();
        attaEw.eq("service_id", id);
        String imgURL = null;
        List<TAttachments> attalist = itAttachmentsService.selectList(attaEw);
        if (attalist.size() > 0) {
            imgURL = attalist.get(0).getFileUrl();
        }
        model.addAttribute("imgURL", imgURL);
        model.addAttribute("pos", pos);
        model.addAttribute("posList", posList);
        model.addAttribute("entity", entity);
        return "/system/adv/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTCmsAdv")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑广告内容")
    public Rest doEdit(@Valid TCmsAdv entity, Model model, String daterange, String imgURL, BindingResult result) throws Exception {
        int adcType = 2;
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        String[] dateranges = StringUtils.split(daterange, "-");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        entity.setDtStart(sdf.parse(dateranges[0].trim().replaceAll("/", "-") + " 00:00:00"));
        entity.setDtEnd(sdf.parse(dateranges[1].trim().replaceAll("/", "-") + " 23:59:59"));
        if (!entity.getAdvType().equals(ADV_TYPE_2)) {
            int one = imgURL.lastIndexOf("/");
            String files = imgURL.substring((one + 1), imgURL.length());
            String getSignInfo = files.substring(files.indexOf(".") + 1);
            EntityWrapper<TAttachments> ew = new EntityWrapper<TAttachments>();
            ew.eq("service_id", entity.getId());
            TAttachments attachments = new TAttachments();
            attachments.setFileUrl(imgURL);
            attachments.setFileName(files);
            attachments.setFileExt(getSignInfo);
            TAttachments atta = attachmentsService.selectOne(ew);
            if (atta == null) {
                attachments.setServiceId(entity.getId());
                attachments.setFileType(1);
                attachments.setGroupId(3);
                attachmentsService.insert(attachments);
            } else {
                attachmentsService.update(attachments, ew);
            }
        }
        service.updateById(entity);
        return Rest.ok("/cms/tCmsAdv/list/1?advPosId=" + entity.getAdvposId());
    }

    /**
     * 发布
     */
    @RequestMapping("/operate")
    @ResponseBody
    @Log("发布广告内容")
    public Rest operate(String id, Integer status) {
        service.updateStatusById(id, status);
        return Rest.ok();
    }

    @RequiresPermissions("deleteTAppEntry")
    @RequestMapping("/deleteAll")
    @ResponseBody
    @Log("删除广告内容")
    public Rest deleteAll(@RequestParam(value = "id[]") String[] id) {
        try {
            if (id == null) {
                return Rest.failure("请选择需删除记录");
            }
            List<String> listIds = Arrays.asList(id);
            service.deleteBatchIds(listIds);
            return Rest.ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Rest.failure("删除异常");
    }

    /**
     * 修改排序
     *
     * @return
     */
    @RequestMapping("/updateSortAll")
    @ResponseBody
    @Log("修改排序-广告内容")
    public Rest updateSortAll(@RequestParam(value = "id[]") String[] id, @RequestParam(value = "value[]") int[] values) {
        try {
            if (id == null || values == null) {
                return Rest.failure("请选择修改排序记录");
            }
            TCmsAdv cmsAdv = null;
            List<TCmsAdv> tCmsAdvList = new ArrayList<TCmsAdv>();
            for (int i = 0; i < id.length; i++) {
                cmsAdv = new TCmsAdv();
                cmsAdv.setId(id[i]);
                cmsAdv.setSortIndex(values[i]);
                tCmsAdvList.add(cmsAdv);
            }
            service.updateBatchById(tCmsAdvList);
            return Rest.ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Rest.failure("更新异常");
    }
}
