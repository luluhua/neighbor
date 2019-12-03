package com.citysmart.ucenter.mybatis.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.citysmart.ucenter.mybatis.entity.vo.SysRoleQueryVo;
import com.citysmart.ucenter.mybatis.model.SysRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 * SysRole 表数据库控制层接口
 *
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {

    List<SysRole> selectListByVo(@Param("vo") SysRoleQueryVo vo);

    /**
     * 判断流程模板中是否有定义对应的角色
     * */
    Integer countFromActDeModel(@Param("sql") String sql);

    /**
     * 判断在办的流程是否有定义对应的角色
     * */
    Integer countFromActRuIdentitylink(@Param("sql") String sql);
}