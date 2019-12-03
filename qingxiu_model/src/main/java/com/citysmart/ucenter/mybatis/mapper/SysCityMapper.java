package com.citysmart.ucenter.mybatis.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.citysmart.ucenter.mybatis.model.SysCity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 中国区域表 Mapper 接口
 * </p>
 *
 * @author lub
 * @since 2019-03-26
 */
public interface SysCityMapper extends BaseMapper<SysCity> {
    List<SysCity> queryBySql(String sql);

    Integer getcityidByCunitId(@Param("id") Integer id);
}
