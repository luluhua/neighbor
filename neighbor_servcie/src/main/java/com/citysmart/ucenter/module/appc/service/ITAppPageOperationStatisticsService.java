package com.citysmart.ucenter.module.appc.service;

import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.model.app.TAppPageOperationStatistics;

import java.util.Date;

/**
 * <p>
 * app用户行为日志 服务类
 * </p>
 *
 * @author zhouyanjian
 * @since 2019-08-29
 */
public interface ITAppPageOperationStatisticsService extends IService<TAppPageOperationStatistics> {

    /**
     * 1、使用设备数统计：ip、系统版本、设备名相同视为一个设备
     *
     * @param date 统计时间
     * @return
     */
    boolean sticsMobileCount(Date date);

    /**
     * 2、栏目点击数统计：按key统计
     *
     * @param date 统计时间
     * @return
     */
    boolean sticsKeyCount(Date date);

    /**
     * 3、模块点击数统计：按model统计
     *
     * @param date 统计时间
     * @return
     */
    boolean sticsModelCount(Date date);

    /**
     * 4、栏目使用平均时长：排除0时长的记录
     *
     * @param date 统计时间
     * @return
     */
    boolean sticsKeyUseAvg(Date date);

    /**
     * 5、时段使用频率统计：每小时统计记录时长
     *
     * @param date 统计时间
     * @return
     */
    boolean sticsKeyHourAvg(Date date);

    /**
     * 6、app使用平均周期：使用lifecycle来统计
     *
     * @param date 统计时间
     * @return
     */
    boolean sticsLifecycleHourAvg(Date date);
}

