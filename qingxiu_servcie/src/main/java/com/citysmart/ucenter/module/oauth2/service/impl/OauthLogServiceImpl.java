package com.citysmart.ucenter.module.oauth2.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.oauth2.service.IOauthLogService;
import com.citysmart.ucenter.mybatis.mapper.oauth2.OauthLogMapper;
import com.citysmart.ucenter.mybatis.model.oauth2.OauthLog;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 授权日志 服务实现类
 * </p>
 *
 * @author zhouyanjian
 * @since 2019-09-27
 */
@Service
public class OauthLogServiceImpl extends ServiceImpl<OauthLogMapper, OauthLog> implements IOauthLogService {

}
