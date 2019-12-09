package com.citysmart.ucenter.mybatis.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.citysmart.ucenter.mybatis.model.TCmsAdvpos;

/**
 * 广告位表 Mapper 接口
 *
 * @author lub
 * @since 2019-03-04
 */
public interface TCmsAdvposMapper extends BaseMapper<TCmsAdvpos> {
    /**
     * 布尔值返回类型
     *
     * @param sql
     * @return
     */
    Boolean booleanBySql(String sql);
}
