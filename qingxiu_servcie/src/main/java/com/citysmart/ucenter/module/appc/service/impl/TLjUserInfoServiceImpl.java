package com.citysmart.ucenter.module.appc.service.impl;

import com.citysmart.ucenter.module.appc.service.ITLjUserInfoService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.mapper.app.TLjUserInfoMapper;
import com.citysmart.ucenter.mybatis.model.app.TLjUserInfo;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户扩展表 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Service
public class TLjUserInfoServiceImpl extends ServiceImpl<TLjUserInfoMapper, TLjUserInfo> implements ITLjUserInfoService {

}
