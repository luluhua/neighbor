package com.citysmart.ucenter.module.system.service;

import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.model.TSysUserLog;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
public interface ITSysUserLogService extends IService<TSysUserLog> {
    /**
     *  记录日志
     * @param title
     * @param uname
     * @param loginIp
     * @param loginType
     * @param is_login_ok
     */
    void insertLog(String title, String uname,String loginIp,int loginType,int is_login_ok );
	
}
