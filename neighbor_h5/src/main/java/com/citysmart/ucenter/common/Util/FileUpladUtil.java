package com.citysmart.ucenter.common.Util;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.util.BaseFileUploadUtil;
import com.citysmart.ucenter.module.system.service.ITAttachmentsService;
import com.citysmart.ucenter.mybatis.model.TAttachments;

import java.util.Date;
import java.util.List;

/**
 * 文件上传-存入附件表工具
 * lgc 2019-03-05
 */
public class FileUpladUtil extends BaseFileUploadUtil {
    public final static String ICON_PREFIX = RedisUtil.getValueByKey("http.img.url");
    public final static String ANDROID_DOWNLOAD_URL = RedisUtil.getValueByKey("android.sdk.download.url");
    public static ITAttachmentsService service = SpringUtil.getBean(ITAttachmentsService.class);


    public static TAttachments getTAttachmentsByServiceId(Integer serviceId) {
        return service.selectOne(new EntityWrapper<TAttachments>().eq("service_id", serviceId));
    }

    public static void delTAttachmentsById(Integer id) {
        service.deleteById(id);
    }

    /**
     * 添加单一附件
     * 参数：封装好的TAttachments类
     * 返回：添加成功还是失败
     */
    public static boolean addFile(TAttachments attachments) {
        attachments.setDtCreate(new Date());
        return service.insert(attachments);
    }

    public static Integer add(TAttachments attachments) {
        boolean fa = service.insert(attachments);
        if (fa) {
            return attachments.getId();
        }
        return null;
    }

    /**
     * 更新附件serviceId
     */
    public static boolean updateFileService(TAttachments attachments) {
        return service.update(attachments, new EntityWrapper<TAttachments>().eq("id", attachments.getId()));
    }

    /**
     * 同类型附件批量添加
     *
     * @param attachments 封装好的TAttachments类
     * @return 添加成功还是失败
     */
    public static boolean addFileByFileUrls(List<TAttachments> attachments) {
        if (attachments == null || attachments.isEmpty()) {
            return false;
        }
        return service.insertBatch(attachments);
    }

}
