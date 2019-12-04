package com.citysmart.ucenter.module.appc.service.impl;

import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.mapper.app.TLjUserMapper;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import org.springframework.stereotype.Service;

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

}
