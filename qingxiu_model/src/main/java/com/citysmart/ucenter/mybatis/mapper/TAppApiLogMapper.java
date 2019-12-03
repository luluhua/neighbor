package com.citysmart.ucenter.mybatis.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.citysmart.ucenter.mybatis.entity.vo.EAppLogVo;
import com.citysmart.ucenter.mybatis.model.TAppApiLog;

import java.util.List;

/**
 * <p>
 * app接口调用日志 Mapper 接口
 * </p>
 *
 * @author lub
 * @since 2019-04-04
 */
public interface TAppApiLogMapper extends BaseMapper<TAppApiLog> {
    List<EAppLogVo> selectTopOperApi(String sql);
    List<EAppLogVo> selectTimeIntervalOperApi(String sql);
    List<EAppLogVo> selectTypeOperApi(String sql);
}
