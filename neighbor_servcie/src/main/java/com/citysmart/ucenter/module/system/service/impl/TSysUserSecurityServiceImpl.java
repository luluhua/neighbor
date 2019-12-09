package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.system.service.ITSysUserSecurityService;
import com.citysmart.ucenter.mybatis.mapper.TSysUserSecurityMapper;
import com.citysmart.ucenter.mybatis.model.TSysUserSecurity;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Service
public class TSysUserSecurityServiceImpl extends ServiceImpl<TSysUserSecurityMapper, TSysUserSecurity> implements ITSysUserSecurityService {

}
