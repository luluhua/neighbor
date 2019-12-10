package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.system.service.ITSmsSendLogService;
import com.citysmart.ucenter.mybatis.mapper.TSmsSendLogMapper;
import com.citysmart.ucenter.mybatis.model.TSmsSendLog;
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
public class TSmsSendLogServiceImpl extends ServiceImpl<TSmsSendLogMapper, TSmsSendLog> implements ITSmsSendLogService {

}
