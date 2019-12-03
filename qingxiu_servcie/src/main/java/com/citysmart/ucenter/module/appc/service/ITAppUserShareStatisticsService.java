package com.citysmart.ucenter.module.appc.service;

import java.util.Date;

/**
 * <p>
 * APP用户分享统计服务接口
 * </p>
 *
 * @author zhouyanjian
 * @date 2019/9/10 11:48
 */
public interface ITAppUserShareStatisticsService {

    /**
     * 增量式统计，场景针对分享、浏览、安装、下载的单次数量的叠加
     *
     * @param shareCode     log的分享码，注意用户分享码和渠道分享码的区别
     * @param browseNum     浏览
     * @param dowloadNum    下载
     * @param bingUserNum   用户数
     * @param activationNum 激活/注册
     * @return
     */
    boolean incrementalStatistics(String shareCode, Integer browseNum, Integer dowloadNum, Integer activationNum,
                                  Integer bingUserNum);

    /**
     * 单线分享统计,一般是从底层的log记录表开始单线统计，不影响其他分支
     * 注意用户分享码和渠道分享码的区别：
     * 1、用户分享码需要从关系表中获取关联的渠道
     * 2、渠道分享码需要处理去“C”的获取渠道
     *
     * @param shareCode log的分享码，注意用户分享码和渠道分享码的区别
     * @return
     */
    boolean singleLineStatistics(String shareCode);

    /**
     * 所有渠道分享统计
     *
     * @return
     */
    boolean allShareStatistics(Date date);

}
