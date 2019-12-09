package com.citysmart.ucenter.mybatis.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
public interface TSysUserMapper extends BaseMapper<TSysUser> {

    List<Map<Object, Object>> selectUserList(Page<Map<Object, Object>> page, @Param("search") String search,@Param("deptId") Integer deptId);

    /**
     * 根据部门查询用户
     * @param deptIds 部门id
     * @return 部门用户id集合
     */
    List<TSysUser> selectUserByDeptIds(@Param("deptIds") String deptIds);

    String selectUserRoleByUserId(String s);
}