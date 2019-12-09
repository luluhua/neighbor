package com.citysmart.ucenter.module.system.service.impl;

import com.citysmart.ucenter.module.system.service.ICityService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.mapper.CityMapper;
import com.citysmart.ucenter.mybatis.model.City;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 该实体为行政区域划分等级 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-03-18
 */
@Service
public class CityServiceImpl extends ServiceImpl<CityMapper, City> implements ICityService {

}
