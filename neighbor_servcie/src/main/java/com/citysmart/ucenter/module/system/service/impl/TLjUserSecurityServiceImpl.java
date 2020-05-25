package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import com.citysmart.ucenter.module.system.service.ITLjUserSecurityService;
import com.citysmart.ucenter.mybatis.entity.vo.SysRoleQueryVo;
import com.citysmart.ucenter.mybatis.mapper.app.TLjUserSecurityMapper;
import com.citysmart.ucenter.mybatis.model.SysRole;
import com.citysmart.ucenter.mybatis.model.TAppUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUserSecurity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-12-09
 */
@Service
public class TLjUserSecurityServiceImpl extends ServiceImpl<TLjUserSecurityMapper, TLjUserSecurity> implements ITLjUserSecurityService {

    @Autowired
    private ITLjUserSecurityService userSecurityService;

    @Autowired
    private ITLjUserService userService;


}
