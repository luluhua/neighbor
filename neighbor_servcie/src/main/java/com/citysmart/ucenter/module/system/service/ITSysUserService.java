package com.citysmart.ucenter.module.system.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.model.TSysUser;

import java.util.Map;

/**
 * <p>
 *  用户服务类
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
public interface ITSysUserService extends IService<TSysUser> {
    /**
     * 分页查询用户
     */
    Page<Map<Object, Object>> selectUserPage(Page<Map<Object, Object>> page, String search,Integer deptId);

    /**
     * 保存用户
     */
    void insertUser(TSysUser user, Integer[] roleId) throws Exception;
    /**
     * 更新用户
     */
    void updateUser(TSysUser sysUser, Integer[] roleId);
    /**
     * 删除用户
     */
    void delete(Integer id);

    String selectUserRoleByUserId(Integer userId);
}
