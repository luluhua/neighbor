package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.system.service.ITLjUserSecurityService;
import com.citysmart.ucenter.mybatis.mapper.app.TLjUserSecurityMapper;
import com.citysmart.ucenter.mybatis.model.app.TLjUserSecurity;
import org.springframework.stereotype.Service;

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

}
