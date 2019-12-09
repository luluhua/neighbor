package com.citysmart.ucenter.mybatis.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.citysmart.ucenter.mybatis.model.TSysDict;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
public interface TSysDictMapper extends BaseMapper<TSysDict> {
    /**
     * 获取事项状态label
     * @param value
     * @return
     */
    String getRecordStatusLabel(String value);
}