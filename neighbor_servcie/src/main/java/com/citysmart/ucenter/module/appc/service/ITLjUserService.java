package com.citysmart.ucenter.module.appc.service;

import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.entity.vo.registreVO;

/**
 * <p>
 * 平台用户表 服务类
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
public interface ITLjUserService extends IService<TLjUser> {

    /**
     * 保存用户
     */
    void insertUser(registreVO vo) throws Exception;

}
