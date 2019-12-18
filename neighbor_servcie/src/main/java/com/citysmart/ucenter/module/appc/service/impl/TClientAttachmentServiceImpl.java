package com.citysmart.ucenter.module.appc.service.impl;

import com.citysmart.ucenter.module.appc.service.ITClientAttachmentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.mapper.app.TClientAttachmentMapper;
import com.citysmart.ucenter.mybatis.model.app.TClientAttachment;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-12-18
 */
@Service
public class TClientAttachmentServiceImpl extends ServiceImpl<TClientAttachmentMapper, TClientAttachment> implements ITClientAttachmentService {

}
