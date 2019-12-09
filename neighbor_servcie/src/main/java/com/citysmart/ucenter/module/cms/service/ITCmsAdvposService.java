package com.citysmart.ucenter.module.cms.service;

import com.citysmart.ucenter.mybatis.model.TCmsAdvpos;
import com.baomidou.mybatisplus.service.IService;

/**
 * 广告位表 服务类
 *
 * @author lub
 * @since 2019-03-04
 */
public interface ITCmsAdvposService extends IService<TCmsAdvpos> {
    /**
     * 根据ID删除广告位
     *
     * @param id
     * @return true
     */
    Boolean updateIsDeletedById(String id);
}
