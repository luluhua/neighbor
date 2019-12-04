package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.CommonUtil;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.common.util.RedisUtil;
import com.citysmart.ucenter.common.util.ShiroUtil;
import com.citysmart.ucenter.module.system.service.ITSysAttachmentService;
import com.citysmart.ucenter.mybatis.model.TSysAttachment;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
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
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.*;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2019-06-03
 */
@Controller
@RequestMapping("/system/tSysAttachment")
public class TSysAttachmentController extends SuperController {

    @Autowired
    public ITSysAttachmentService service;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TSysAttachment> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSysAttachment> ew = new EntityWrapper<TSysAttachment>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        Page<TSysAttachment> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/system/tSysAttachment/list";
    }

    /**
     * 新增
     */
    @RequiresPermissions("addTSysAttachment")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/system/tSysAttachment/edit";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTSysAttachment")
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("新增")
    public Rest doAdd(@Valid TSysAttachment entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除
     */
    @RequiresPermissions("deleteTSysAttachment")
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
    @RequiresPermissions("editTSysAttachment")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TSysAttachment entity = service.selectById(id);

        model.addAttribute("entity", entity);
        return "/system/tSysAttachment/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTSysAttachment")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑")
    public Rest doEdit(@Valid TSysAttachment entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.updateById(entity);
        return Rest.ok();
    }

    /**
     * 上传文件
     *
     * @param file 文件流
     * @return
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping("/file/upload")
    public Map<String, Object> fileUpload(@RequestParam MultipartFile[] file, String[] files, TSysAttachment entity, Model model) {
        String iconPrefix = RedisUtil.getValueByKey("http.img.url");
        String fileUrl = env.getProperty("file.upload.url");
        List<String> urls = new ArrayList<String>();
        List<Integer> fileIds = new ArrayList<Integer>();
        Map<String, Object> result = new HashMap<String, Object>(5);
        String filename = null;
        try {
            String fileurl = "";
            for (MultipartFile myfile : file) {
                if (myfile.isEmpty()) {
                    logger.warn("文件未上传");
                } else {
                    logger.debug("文件长度: " + myfile.getSize());
                    logger.debug("文件类型: " + myfile.getContentType());
                    logger.debug("文件名称: " + myfile.getName());
                    logger.debug("文件原名: " + myfile.getOriginalFilename());
                    filename = myfile.getOriginalFilename().substring(0, myfile.getOriginalFilename().indexOf("."));
                    String ext = FilenameUtils.getExtension(myfile.getOriginalFilename());
                    String reName = RandomStringUtils.randomAlphanumeric(32).toLowerCase() + "." + ext;
                    String cdate = DateFormatUtils.format(new Date(), "yyyy-MM-dd");
                    String realPath = fileUrl + "/" + File.separator + cdate;
                    FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, reName));
                    fileurl = "/" + cdate + "/" + reName;
                    urls.add(fileurl);
                    entity.setGid(CommonUtil.UUID());
                    entity.setName(reName);
                    entity.setFileSize(myfile.getSize());
                    entity.setFileext(ext);
                    entity.setFilePath(fileurl);
                    TSysUser sysUser = ShiroUtil.getSessionUser();
                    entity.setCreateUserid(sysUser.getId());
                    entity.setCreateDatetime(new Date());
                    entity.setCreateUsername(sysUser.getUsername());
                    entity.setFileOldName(myfile.getOriginalFilename());
                    service.insert(entity);
                }
            }
            if (urls.size() > 0) {
                result.put("status", "success");
                result.put("urls", urls);
                result.put("wholeUrl", iconPrefix + urls.get(0));
                result.put("fileIds", fileIds);
                result.put("filename", filename);
            } else {
                result.put("status", "error");
            }
            return result;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            result.put("status", "error");
            return result;
        }
    }

    @RequestMapping("/attalist")
    @ResponseBody
    public Rest attalist(@RequestParam(defaultValue = "12") Integer pageSize, String search, Model model) {
        Page<TSysAttachment> page = getPage(1, 12);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSysAttachment> ew = new EntityWrapper<TSysAttachment>();
        TSysUser sysUser = ShiroUtil.getSessionUser();
        ew.eq("create_userId", sysUser.getId());
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        Page<TSysAttachment> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return Rest.okData(pageData);
    }

}
