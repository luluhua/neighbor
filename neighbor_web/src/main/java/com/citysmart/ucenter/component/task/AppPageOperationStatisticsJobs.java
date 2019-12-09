package com.citysmart.ucenter.component.task;

import com.citysmart.ucenter.module.appc.service.ITAppPageOperationStatisticsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.validation.constraints.NotNull;
import java.util.Calendar;
import java.util.Date;

/**
 * <p>
 * APP用户行为统计任务
 * </p>
 * 任务执行时间为凌晨1点的10分、20分、40分和50分各执行一次。
 * @author zhouyanjian
 * @date 2019/9/3 14:11
 */
@Component
public class AppPageOperationStatisticsJobs {
    private final Logger logger = LoggerFactory.getLogger(AppPageOperationStatisticsJobs.class);

    @Autowired
    public ITAppPageOperationStatisticsService service;

    /**
     * 1点的10分、20分、40分和50分各执行一次
     */
    @Scheduled(cron="0 10,20,40,50 1 * * ?")
    public void operationStatistics(){
        Date dt = diffDay(new Date(), 1);
        try {
            service.sticsKeyCount(dt);
            service.sticsKeyHourAvg(dt);
            service.sticsKeyUseAvg(dt);
            service.sticsLifecycleHourAvg(dt);
            service.sticsMobileCount(dt);
            service.sticsModelCount(dt);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("执行APP用户行为统计任务异常：" + e.getMessage(), e);
        }
    }

    private Date diffDay(@NotNull Date date, @NotNull int days) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - days);
        return calendar.getTime();
    }
}
