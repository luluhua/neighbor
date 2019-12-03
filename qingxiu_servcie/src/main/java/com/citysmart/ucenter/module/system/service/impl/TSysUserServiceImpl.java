package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.common.util.PBKDF2Util;
import com.citysmart.ucenter.module.system.service.ITSysUserService;
import com.citysmart.ucenter.mybatis.mapper.SysUserRoleMapper;
import com.citysmart.ucenter.mybatis.mapper.TSysUserMapper;
import com.citysmart.ucenter.mybatis.mapper.TSysUserSecurityMapper;
import com.citysmart.ucenter.mybatis.model.SysUserRole;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import com.citysmart.ucenter.mybatis.model.TSysUserSecurity;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Service
public class TSysUserServiceImpl extends ServiceImpl<TSysUserMapper, TSysUser> implements ITSysUserService {
    @Autowired
    private TSysUserMapper userMapper;

    @Autowired
    private SysUserRoleMapper userRoleMapper;

    @Autowired
    private TSysUserSecurityMapper sysUserSecurityMapper;

    @Override
    public void insertUser(TSysUser user, Integer[] roleIds) throws Exception {
        // TODO Auto-generated method stub
        user.setDtCreate(new Date());
        //保存用户
        userMapper.insert(user);
        //绑定角色
        if (ArrayUtils.isNotEmpty(roleIds)) {
            for (Integer rid : roleIds) {
                SysUserRole sysUserRole = new SysUserRole();
                sysUserRole.setUserId(user.getId());
                sysUserRole.setRoleId(rid);
                userRoleMapper.insert(sysUserRole);
            }
        }

        //设置登录密码
        // 使用用户输入的密码 update zyj 20190618
        String hash = PBKDF2Util.createHash(user.getPassword().toCharArray(), null);
        String salt = PBKDF2Util.getSalt(hash);
        String password = PBKDF2Util.getHash(hash);
        TSysUserSecurity tSysUserSecurity = new TSysUserSecurity();
        tSysUserSecurity.setPassword(password);
        tSysUserSecurity.setPassword2(password);
        tSysUserSecurity.setPassword3(password);
        tSysUserSecurity.setSalt(salt);
        tSysUserSecurity.setUserId(user.getId());
        sysUserSecurityMapper.insert(tSysUserSecurity);
    }

    @Override
    public void updateUser(TSysUser sysUser, Integer[] roleIds) {
        // TODO Auto-generated method stub
        sysUser.setPassword(null);
        //更新用户
        userMapper.updateById(sysUser);
        //删除已有权限
        userRoleMapper.delete(new EntityWrapper<SysUserRole>().eq("userId", sysUser.getId()));
        //重新绑定角色
        if (ArrayUtils.isNotEmpty(roleIds)) {
            for (Integer rid : roleIds) {
                SysUserRole sysUserRole = new SysUserRole();
                sysUserRole.setUserId(sysUser.getId());
                sysUserRole.setRoleId(rid);
                userRoleMapper.insert(sysUserRole);
            }
        }
    }


    @Override
    public Page<Map<Object, Object>> selectUserPage(Page<Map<Object, Object>> page, String search, Integer deptId) {
        // TODO Auto-generated method stub
        page.setRecords(baseMapper.selectUserList(page, search, deptId));
        return page;
    }

    @Override
    public void delete(Integer id) {
        // TODO Auto-generated method stub
        this.deleteById(id);
        userRoleMapper.delete(new EntityWrapper<SysUserRole>().addFilter("userId = {0}", id));
    }

    @Override
    public String selectUserRoleByUserId(Integer userId) {

        StringBuilder sql = new StringBuilder();
//        sql.append("SELECT log.id AS id,log.userId AS userId,log.step AS step,log.remark AS remark," +
//                           " log.dt_create AS dtCreate,users.username as username"+
//                           " FROM t_gov_record_log AS log LEFT JOIN" +
//                           " t_sys_user AS users on users.id = log.userId LEFT JOIN " +
//                           " t_sys_user_role AS role on role.userId = users.id WHERE" +
//                           " log.record_id ="+id);
//        sql.append(" AND log.step != 1");
//        sql.append(" GROUP BY log.id ");
        return this.baseMapper.selectUserRoleByUserId(sql.toString());
    }

}
