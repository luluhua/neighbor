package com.citysmart.ucenter.module.system.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.citysmart.ucenter.mybatis.model.SysUserRole;
import com.citysmart.ucenter.mybatis.mapper.SysUserRoleMapper;
import com.citysmart.ucenter.module.system.service.ISysUserRoleService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * SysUserRole 表数据服务层接口实现类
 */
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements ISysUserRoleService {

	@Override
	public Set<String> findRolesByUid(Integer uid) {
		// TODO Auto-generated method stub
		List<SysUserRole> list = this.selectList(new EntityWrapper<SysUserRole>().eq("userId", uid));

		Set<String> set = new HashSet<String>();
		for (SysUserRole ur : list) {
			set.add(String.valueOf(ur.getRoleId()));
		}
		return set;
	}

}