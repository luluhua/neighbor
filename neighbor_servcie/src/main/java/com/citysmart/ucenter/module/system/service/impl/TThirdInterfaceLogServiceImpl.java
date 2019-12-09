package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.system.service.ITThirdInterfaceLogService;
import com.citysmart.ucenter.mybatis.mapper.TThirdInterfaceLogMapper;
import com.citysmart.ucenter.mybatis.model.TThirdInterfaceLog;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 第三方接口请求记录 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-04-03
 */
@Service
public class TThirdInterfaceLogServiceImpl extends ServiceImpl<TThirdInterfaceLogMapper, TThirdInterfaceLog> implements
                                                                                                             ITThirdInterfaceLogService {

}
