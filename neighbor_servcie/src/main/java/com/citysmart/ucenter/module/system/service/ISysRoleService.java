package com.citysmart.ucenter.module.system.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.entity.vo.SysRoleQueryVo;
import com.citysmart.ucenter.mybatis.model.SysRole;

import java.util.List;

/**
 * SysRole 表数据服务层接口
 */
public interface ISysRoleService extends IService<SysRole> {
    Page<SysRole> selectListByVo(Page page, SysRoleQueryVo vo);

    /**
     * 删除单个角色信息
     * */
    void deleteOneRole(Integer roleId) throws Exception;

    /**
     * 批量删除角色信息
     * */
    void batchDeleteRoles(List<String> roleIds) throws Exception;
}