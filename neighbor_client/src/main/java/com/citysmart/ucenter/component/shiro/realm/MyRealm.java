package com.citysmart.ucenter.component.shiro.realm;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import com.citysmart.ucenter.module.system.service.*;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import com.citysmart.ucenter.mybatis.model.TSysUserSecurity;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUserSecurity;
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


    @Autowired
    private ITLjUserService userService;
    @Autowired
    private ITLjUserSecurityService userSecurityService;

    /**
     * 认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // TODO Auto-generated method stub
        UsernamePasswordToken user = (UsernamePasswordToken) token;
        TLjUser ljUser = userService.selectOne(new EntityWrapper<TLjUser>().eq("username", user.getUsername()));

        if (ljUser == null) {
            throw new UnknownAccountException();
        }
        if (ljUser.getStatus() == TSysUser.status_1) {
            throw new LockedAccountException();
        }
        TLjUserSecurity userSecurity = userSecurityService.selectOne(new EntityWrapper<TLjUserSecurity>().eq("user_id", ljUser.getId()));
        if (userSecurity == null) {
            //未设置密码
            throw new LockedAccountException();
        }
        //用户名，数据库中的密码,reaml名称
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(ljUser, userSecurity.getPassword(), getName());
        return info;
    }


    /**
     * 授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        return null;
    }
}
