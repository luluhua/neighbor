package com.citysmart.ucenter.module.system.service.impl;


import com.citysmart.ucenter.module.system.service.IProvinceService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.mapper.ProvinceMapper;
import com.citysmart.ucenter.mybatis.model.Province;
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
public class ProvinceServiceImpl extends ServiceImpl<ProvinceMapper, Province> implements IProvinceService {

}
