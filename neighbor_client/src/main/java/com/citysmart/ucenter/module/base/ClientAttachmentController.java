package com.citysmart.ucenter.module.base;

import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.CommonUtil;
import com.citysmart.ucenter.common.Util.RedisUtil;
import com.citysmart.ucenter.common.Util.ShiroUtil;
import com.citysmart.ucenter.module.appc.service.ITClientAttachmentService;
import com.citysmart.ucenter.mybatis.model.app.TClientAttachment;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * 平台用户附件管理
 *
 * @author li
 * @date 2019/12/18
 */
@Controller
@RequestMapping("/client/tSysAttachment")
public class ClientAttachmentController extends SuperController {
    @Autowired
    public ITClientAttachmentService clientAttachmentService;


    /**
     * 上传文件
     *
     * @param file 文件流
     * @return
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping("/file/upload")
    public Map<String, Object> fileUpload(@RequestParam MultipartFile[] file, String uuid, TClientAttachment entity, Model model) {
        TLjUser ljUser = ShiroUtil.getSessionUser();
        Map<String, Object> result = new HashMap<String, Object>(5);
        if (ljUser != null) {
            String iconPrefix = RedisUtil.getValueByKey("http.img.url");
            String fileUrl = env.getProperty("file.upload.url");
            List<String> urls = new ArrayList<String>();
            List<Integer> fileIds = new ArrayList<Integer>();
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
                        entity.setSourceId(uuid);
                        entity.setCreateUserid(ljUser.getId());
                        entity.setCreateDatetime(new Date());
                        entity.setCreateUsername(ljUser.getUsername());
                        entity.setFileOldName(myfile.getOriginalFilename());
                        clientAttachmentService.insert(entity);
                    }
                }
                if (urls.size() > 0) {
                    result.put("status", "success");
                    result.put("code", 0);
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
        result.put("status", "success");
        result.put("code", 101);
        return result;
    }
}
