package com.citysmart.ucenter.module.commodity.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.commodity.service.ITGoodsCollectService;
import com.citysmart.ucenter.mybatis.entity.vo.UserScoreVO;
import com.citysmart.ucenter.mybatis.entity.vo.goodsCollectVo;
import com.citysmart.ucenter.mybatis.mapper.commodity.TGoodsCollectMapper;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsCollect;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lub
 * @since 2020-03-26
 */
@Service
public class TGoodsCollectServiceImpl extends ServiceImpl<TGoodsCollectMapper, TGoodsCollect> implements ITGoodsCollectService {

    @Override
    public List<goodsCollectVo> selectListByUser(String userId) {

        return this.baseMapper.selectListByUser(userId);
    }
}
