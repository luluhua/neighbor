package com.citysmart.ucenter.mybatis.mapper.app;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.citysmart.ucenter.mybatis.entity.vo.AppPageOperationStatisticsVo;
import com.citysmart.ucenter.mybatis.model.app.TAppPageOperationStatistics;

import java.util.List;

/**
 * <p>
 * app用户行为统计分析 Mapper 接口
 * </p>
 *
 * @author zhouyanjian
 * @since 2019-08-29
 */
public interface TAppPageOperationStatisticsMapper extends BaseMapper<TAppPageOperationStatistics> {
    /**
     * 1、使用设备数统计：ip、系统版本、设备名相同视为一个设备
     * @param params
     * @return
     */
    List<AppPageOperationStatisticsVo> sticsMobileCount(TAppPageOperationStatistics params);

    List<AppPageOperationStatisticsVo> sticsMobileCountV2(TAppPageOperationStatistics params);
    /**
     * 2、栏目点击数统计：按key统计
     * @param params
     * @return
     */
    List<AppPageOperationStatisticsVo> sticsKeyCount(TAppPageOperationStatistics params);

    /**
     * 3、模块点击数统计：按model统计
     * @param params
     * @return
     */
    List<AppPageOperationStatisticsVo> sticsModelCount(TAppPageOperationStatistics params);

    /**
     * 4、栏目使用平均时长：排除0时长的记录
     * @param params
     * @return
     */
    List<AppPageOperationStatisticsVo> sticsKeyUseAvg(TAppPageOperationStatistics params);

    /**
     * 5、时段使用频率统计：每小时统计记录时长
     * @param params
     * @return
     */
    List<AppPageOperationStatisticsVo> sticsKeyHourCount(TAppPageOperationStatistics params);

    /**
     * 6、app使用平均周期：使用lifecycle来统计
     * @param params
     * @return
     */
    List<AppPageOperationStatisticsVo> sticsLifecycleHourAvg(TAppPageOperationStatistics params);
}
