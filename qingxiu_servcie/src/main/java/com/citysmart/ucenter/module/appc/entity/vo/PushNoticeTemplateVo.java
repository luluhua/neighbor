package com.citysmart.ucenter.module.appc.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Map;

/**
 * <p>
 * 模板推送通知
 * </p>
 *
 * @author zhouyanjian
 * @Date 2019/7/11 9:15
 */
@Getter
@Setter
public class PushNoticeTemplateVo {
    /**
     * 接收的GID
     */
    private String receiptGid;
    /**
     * 接收的UID
     */
    private String receiptUid;
    /**
     * 模板编号
     */
    private String templateCode;
//    /**
//     * 目标：可能是数据ID，可能是URL，还有...
//     */
//    private String extrasJson;
    /**
     * 拓展参数
     */
    private Map<String,String> extrasMap;
}
