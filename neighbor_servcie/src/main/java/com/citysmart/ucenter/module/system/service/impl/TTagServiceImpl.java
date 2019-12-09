package com.citysmart.ucenter.module.system.service.impl;

import com.citysmart.ucenter.module.system.service.ITTagService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.mapper.TTagMapper;
import com.citysmart.ucenter.mybatis.model.TTag;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 标签表 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Service
public class TTagServiceImpl extends ServiceImpl<TTagMapper, TTag> implements ITTagService {

}
