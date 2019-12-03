package com.citysmart.ucenter.mybatis.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.citysmart.ucenter.mybatis.model.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 *
 * SysMenu 表数据库控制层接口
 *
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {

	List<String> selectMenuIdsByuserId(String uid);

	List<String> selectResourceByUid(@Param("uid") String uid);

	Integer countchildTreeMenuByPid(@Param("pid") String pid);
}