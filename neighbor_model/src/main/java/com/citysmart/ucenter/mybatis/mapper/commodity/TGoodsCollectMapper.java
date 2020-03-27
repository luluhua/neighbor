package com.citysmart.ucenter.mybatis.mapper.commodity;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.mybatis.entity.vo.goodsCollectVo;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsCollect;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author lub
 * @since 2020-03-26
 */
public interface TGoodsCollectMapper extends BaseMapper<TGoodsCollect> {


    List selectListByUser(@Param("userId") String userId);
}
