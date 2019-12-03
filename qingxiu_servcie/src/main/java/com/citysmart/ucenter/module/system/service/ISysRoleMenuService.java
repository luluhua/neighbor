package com.citysmart.ucenter.module.system.service;

import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.model.SysRoleMenu;

import java.util.List;
import java.util.Set;


/**
 * SysRoleMenu 表数据服务层接口
 */
public interface ISysRoleMenuService extends IService<SysRoleMenu> {


    /**
     * 角色授权
     */
    void addAuth(Integer roleId, String[] menuIds);

    /**
     * 获取指定角色的权限
     */
    List<SysRoleMenu> selectByRole(Integer roleId);

    Set<String> findMenusByUid(Integer id);


}