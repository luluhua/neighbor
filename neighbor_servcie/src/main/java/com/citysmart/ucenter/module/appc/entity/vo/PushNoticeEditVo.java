package com.citysmart.ucenter.module.appc.entity.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 添加/编辑推送通知
 * </p>
 *
 * @author zhouyanjian
 * @Date 2019/7/2 9:15
 */
@Getter
@Setter
public class PushNoticeEditVo {
    /**
     * 目标gid
     */
    private String targetGid;

    private String targetUserId;
    /**
     * 标题（android）
     */
    private String title;
    /**
     * 内容（ios、android）
     */
    private String content;
    /**
     * 优先级：1~5，1最高
     */
    private Integer priority;
    /**
     * 拓展参数
     */
    private String extrasJson;
}
