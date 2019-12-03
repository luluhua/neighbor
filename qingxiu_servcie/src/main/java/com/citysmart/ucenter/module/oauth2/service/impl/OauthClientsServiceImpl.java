package com.citysmart.ucenter.module.oauth2.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.oauth2.service.IOauthClientsService;
import com.citysmart.ucenter.mybatis.mapper.oauth2.OauthClientsMapper;
import com.citysmart.ucenter.mybatis.model.oauth2.OauthClients;
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
public class OauthClientsServiceImpl extends ServiceImpl<OauthClientsMapper, OauthClients> implements
                                                                                           IOauthClientsService {

}
