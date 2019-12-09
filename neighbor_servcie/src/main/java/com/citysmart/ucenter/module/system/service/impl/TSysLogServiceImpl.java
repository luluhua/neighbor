package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.system.service.ITSysLogService;
import com.citysmart.ucenter.mybatis.mapper.TSysLogMapper;
import com.citysmart.ucenter.mybatis.model.TSysLog;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Service
public class TSysLogServiceImpl extends ServiceImpl<TSysLogMapper, TSysLog> implements ITSysLogService {

}
