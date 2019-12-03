package com.citysmart.ucenter.module.appc.service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.entity.vo.TAppUserSharelogSelectVo;
import com.citysmart.ucenter.mybatis.entity.vo.TAppUserSharelogVo;
import com.citysmart.ucenter.mybatis.model.app.TAppUserSharelog;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2019-09-02
 */
public interface ITAppUserSharelogService extends IService<TAppUserSharelog> {

    Page<TAppUserSharelogVo> selectTAppUserSharelogVoPage(Page page, TAppUserSharelogSelectVo tAppUserSharelogSelectVo);
}
