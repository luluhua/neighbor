package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.common.util.BaseFileUploadUtil;
import com.citysmart.ucenter.module.system.service.ITAttachmentsService;
import com.citysmart.ucenter.mybatis.mapper.TAttachmentsMapper;
import com.citysmart.ucenter.mybatis.model.TAttachments;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Service
public class TAttachmentsServiceImpl extends ServiceImpl<TAttachmentsMapper, TAttachments> implements ITAttachmentsService {

    public static final Integer SAVE_TYPE = 0;
    @Autowired
    public Environment env;//当前环境配置文件

    @Value("${file.upload.url}")
    private String fileUrl;

    @Override
    public TAttachments uploadFile(MultipartFile file, Integer groupId, Integer serviceId, Integer saveTypeId) {
        Map<String, String> _file = BaseFileUploadUtil.uploadFile(file, null, fileUrl, groupId, serviceId);
        if (_file == null) {
            return null;
        }
        TAttachments attachments = new TAttachments();
        if (SAVE_TYPE.equals(saveTypeId)) {
            attachments.setFileSize(file.getSize());
            attachments.setFileType(BaseFileUploadUtil.fileTypeConver(file.getContentType()));
            attachments.setDtCreate(new Date());
            attachments.setSortIndex(1);
            attachments.setFileName(_file.get("reName"));
            attachments.setFileUrl(_file.get("fileurl"));
            attachments.setFileExt(_file.get("ext"));
            attachments.setGroupId(groupId);
            attachments.setServiceId(serviceId.toString());
            this.insert(attachments);
        } else {
            attachments.setFileUrl(_file.get("fileurl"));
        }
        return attachments;
    }
}
