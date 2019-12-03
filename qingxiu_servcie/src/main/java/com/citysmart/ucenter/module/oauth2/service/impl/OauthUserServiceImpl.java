package com.citysmart.ucenter.module.oauth2.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.oauth2.service.IOauthUserService;
import com.citysmart.ucenter.mybatis.mapper.oauth2.OauthUserMapper;
import com.citysmart.ucenter.mybatis.model.oauth2.OauthUser;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2019-07-05
 */
@Service
public class OauthUserServiceImpl extends ServiceImpl<OauthUserMapper, OauthUser> implements IOauthUserService {

}
