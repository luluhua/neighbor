package com.citysmart.ucenter.module.appc.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.appc.service.ITAppPageOperationLogService;
import com.citysmart.ucenter.mybatis.mapper.app.TAppPageOperationLogMapper;
import com.citysmart.ucenter.mybatis.model.app.TAppPageOperationLog;
import org.springframework.stereotype.Service;

/**
 * <p>
 * app用户行为日志 服务实现类
 * </p>
 *
 * @author zhouyanjian
 * @since 2019-08-29
 */
@Service
public class TAppPageOperationLogServiceImpl extends ServiceImpl<TAppPageOperationLogMapper, TAppPageOperationLog> implements ITAppPageOperationLogService {

}
