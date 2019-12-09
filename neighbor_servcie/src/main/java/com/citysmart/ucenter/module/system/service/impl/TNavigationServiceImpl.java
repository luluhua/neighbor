package com.citysmart.ucenter.module.system.service.impl;

import com.citysmart.ucenter.module.system.service.ITNavigationService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.mapper.TNavigationMapper;
import com.citysmart.ucenter.mybatis.model.TNavigation;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 导航表 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Service
public class TNavigationServiceImpl extends ServiceImpl<TNavigationMapper, TNavigation> implements ITNavigationService {

}
