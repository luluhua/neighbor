package com.citysmart.ucenter.module.appc.service.impl;

import com.citysmart.ucenter.module.appc.service.ITLjUserAddressService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.mapper.app.TLjUserAddressMapper;
import com.citysmart.ucenter.mybatis.model.app.TLjUserAddress;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户地址信息表 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Service
public class TLjUserAddressServiceImpl extends ServiceImpl<TLjUserAddressMapper, TLjUserAddress> implements ITLjUserAddressService {

}
