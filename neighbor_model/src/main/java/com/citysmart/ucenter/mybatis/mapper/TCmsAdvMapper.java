package com.citysmart.ucenter.mybatis.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.citysmart.ucenter.mybatis.model.TCmsAdv;

/**
 * 广告内容表 Mapper 接口
 *
 * @author lub
 * @since 2019-03-04
 */
public interface TCmsAdvMapper extends BaseMapper<TCmsAdv> {

    /**
     * 布尔返回类型
     *
     * @param sql
     * @return 1
     */
    Integer booleanBySql(String sql);
}
