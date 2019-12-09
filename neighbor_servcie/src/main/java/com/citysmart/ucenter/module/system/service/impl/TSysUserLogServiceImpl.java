package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.system.service.ITSysUserLogService;
import com.citysmart.ucenter.mybatis.mapper.TSysUserLogMapper;
import com.citysmart.ucenter.mybatis.model.TSysUserLog;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Service
public class TSysUserLogServiceImpl extends ServiceImpl<TSysUserLogMapper, TSysUserLog> implements ITSysUserLogService {
    public static final Logger logger = Logger.getLogger(TSysUserLogServiceImpl.class);
    @Override
    public void insertLog(String title, String uname, String loginIp, int loginType, int is_login_ok) {
        // TODO Auto-generated method stub
        TSysUserLog sysLog = new TSysUserLog();
        sysLog.setDtCreate(new Date());
        sysLog.setLoginType(loginType);
        sysLog.setUserName(uname);
        sysLog.setLoginIp(loginIp);
        sysLog.setIsLoginOk(is_login_ok);
        super.insert(sysLog);
        logger.debug("记录日志:" + sysLog.toString());
    }
}
