package com.citysmart.ucenter.module.commodity.service.impl;

import com.citysmart.ucenter.module.commodity.service.ITGoodsService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.mapper.commodity.TGoodsMapper;
import com.citysmart.ucenter.mybatis.model.commodity.TGoods;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 物品信息表 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Service
public class TGoodsServiceImpl extends ServiceImpl<TGoodsMapper, TGoods> implements ITGoodsService {

}
