package com.citysmart.ucenter.module.system.service;

import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.model.TAttachments;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
public interface ITAttachmentsService extends IService<TAttachments> {

    /**
     *
     * @param file
     * @param groupId
     * @param serviceId
     * @return
     */
    TAttachments uploadFile(MultipartFile file, Integer groupId, Integer serviceId, Integer saveTypeId);
}
