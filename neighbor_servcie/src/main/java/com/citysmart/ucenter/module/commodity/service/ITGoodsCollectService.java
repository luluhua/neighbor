package com.citysmart.ucenter.module.commodity.service;

import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.entity.vo.goodsCollectVo;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsCollect;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author lub
 * @since 2020-03-26
 */
public interface ITGoodsCollectService extends IService<TGoodsCollect> {

    List<goodsCollectVo> selectListByUser(String userId);

}
