package com.citysmart.ucenter.module.commodity.service.impl;

import com.citysmart.ucenter.module.commodity.service.ITGoodsParameterService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.mapper.commodity.TGoodsParameterMapper;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsParameter;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 物品参数表 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Service
public class TGoodsParameterServiceImpl extends ServiceImpl<TGoodsParameterMapper, TGoodsParameter> implements ITGoodsParameterService {

}
