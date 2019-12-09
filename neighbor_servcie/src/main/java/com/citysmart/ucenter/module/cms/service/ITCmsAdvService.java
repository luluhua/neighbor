package com.citysmart.ucenter.module.cms.service;

import com.citysmart.ucenter.mybatis.model.TCmsAdv;
import com.baomidou.mybatisplus.service.IService;

/**
 * 广告内容表 服务类
 *
 * @author lub
 * @since 2019-03-04
 */
public interface ITCmsAdvService extends IService<TCmsAdv> {
    /**
     * 根据ID更新删除状态
     *
     * @param id
     * @return
     */

    boolean updateIsDeletedById(String id);

    /**
     * 发布、下载状态修改
     *
     * @param id
     * @param status
     * @return
     */

    boolean updateStatusById(String id, int status);
}
