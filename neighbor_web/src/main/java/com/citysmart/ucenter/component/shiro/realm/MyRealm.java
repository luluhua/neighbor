package com.citysmart.ucenter.component.shiro.realm;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.ucenter.module.system.service.ISysRoleMenuService;
import com.citysmart.ucenter.module.system.service.ISysUserRoleService;
import com.citysmart.ucenter.module.system.service.ITSysUserSecurityService;
import com.citysmart.ucenter.module.system.service.ITSysUserService;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import com.citysmart.ucenter.mybatis.model.TSysUserSecurity;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

/**
 * shiro Realm
 *
 * @author jameszhou
 */
public class MyRealm extends AuthorizingRealm {

    /**
     * 用户服务
     */
    @Autowired
    private ITSysUserService userService;
    /**
     * 用户角色服务
     */
    @Autowired
    private ISysUserRoleService sysUserRoleService;

    /**
     * 角色菜单服务
     */
    @Autowired
    private ISysRoleMenuService sysRoleMenuService;

    /**
     * 用户密码服务
     */
    @Autowired
    private ITSysUserSecurityService sysUserSecurityService;


    /**
     * 认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // TODO Auto-generated method stub
        UsernamePasswordToken user = (UsernamePasswordToken) token;
        TSysUser sysUser = userService.selectOne(new EntityWrapper<TSysUser>().eq("username", user.getUsername()));

        if (sysUser == null) {
            throw new UnknownAccountException();
        }
        if (sysUser.getStatus() == TSysUser.status_1) {
            throw new LockedAccountException();
        }
        TSysUserSecurity sysUserSecurity = sysUserSecurityService.selectOne(new EntityWrapper<TSysUserSecurity>().eq("user_id", sysUser.getId()));
        if (sysUserSecurity == null) {
            //未设置密码
            throw new LockedAccountException();
        }
        //用户名，数据库中的密码,reaml名称
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(sysUser,sysUserSecurity.getPassword(),getName());
        return info;
    }


    /**
     * 授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        // TODO Auto-generated method stub
        TSysUser sysUser = (TSysUser) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //获取用户角色
        Set<String> roles = sysUserRoleService.findRolesByUid(sysUser.getId());
        //获取角色权限
        Set<String> permissions = sysRoleMenuService.findMenusByUid(sysUser.getId());
        info.setRoles(roles);
        info.setStringPermissions(permissions);
        return info;
    }
}
