package com.citysmart.ucenter.module.appc.service;


import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.model.TAppApiLog;

import java.util.Map;

/**
 * <p>
 * app接口调用日志 服务类
 * </p>
 *
 * @author lub
 * @since 2019-04-04
 */
public interface ITAppApiLogService extends IService<TAppApiLog> {
    /**
     * 本日、本周、本月、本年/自定义：高频率调用接口（前20），显示接口名称（或链接）
     * */
    Map<String,Object> queryTopOperApi(Integer type, String param);
    /**
     * 本日、本周、本月、本年/自定义：访问时间统计数量（按早8点-12点，12点-18点、18点-24点）
     * */
    Map<String,Object> queryTimeIntervalOperApi(Integer type, String param);
    /**
     * 客户端统计（Android、ios）
     * */
    Map<String,Object> queryTypeOperApi(Integer type, String param);
}
