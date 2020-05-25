package com.citysmart.ucenter.module.appc.service.impl;

import com.citysmart.common.util.PBKDF2Util;
import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.entity.vo.registreVO;
import com.citysmart.ucenter.mybatis.mapper.TSysUserMapper;
import com.citysmart.ucenter.mybatis.mapper.TSysUserSecurityMapper;
import com.citysmart.ucenter.mybatis.mapper.app.TLjUserMapper;
import com.citysmart.ucenter.mybatis.mapper.app.TLjUserSecurityMapper;
import com.citysmart.ucenter.mybatis.model.SysUserRole;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import com.citysmart.ucenter.mybatis.model.TSysUserSecurity;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUserSecurity;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 * 平台用户表 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Service
public class TLjUserServiceImpl extends ServiceImpl<TLjUserMapper, TLjUser> implements ITLjUserService {

    @Autowired
    private ITLjUserService userService;

    @Autowired
    private TLjUserMapper userMapper;

    @Autowired
    private TLjUserSecurityMapper userSecurityMapper;

    @Override
    public void insertUser(registreVO vo) throws Exception {
        // TODO Auto-generated method stub
        TLjUser user = new TLjUser();
        user.setDtCreate(new Date());
        user.setUsername(vo.getUsername());
        user.setMobile(vo.getUsername());
        user.setPassword(PBKDF2Util.createHash(vo.getPassword().toCharArray(), null));
        //保存用户
        userMapper.insert(user);
        //设置登录密码
        String hash = PBKDF2Util.createHash(vo.getPassword().toCharArray(), null);
        String salt = PBKDF2Util.getSalt(hash);
        String password = PBKDF2Util.getHash(hash);

        TLjUserSecurity serSecurity = new TLjUserSecurity();
        serSecurity.setPassword(password);
        serSecurity.setSalt(salt);
        serSecurity.setUserId(user.getId());
        userSecurityMapper.insert(serSecurity);
    }

}
