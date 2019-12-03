package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class TGovRecordListVo {
    /**
     * 办事记录id
     **/
    private Integer id;
    /**
     * 事项id
     **/
    private Integer projectId;
    /**
     * 用户名
     */
    private String apuName;
    /**
     * 承办单位
     **/
    private String orgName;
    /**
     * 事项标题
     **/
    private String projectTitle;
    /**
     * 提交日期
     **/
    private String postDatetime;
    /**
     * 状态
     **/
    private Integer status;
    /**
     * 状态文字
     **/
    private String statusText;
    /**
     * 审批结果
     **/
    private String result;
    /**
     * 状态颜色
     */
    private String statusColor;

    /**
     * 审核时间
     */

    private Date handleTime;
    /**
     * 当前节点
     */
    private String handleUserName;

    private Integer r;

    /**
     * 距离审批开始的间隔时间
     */
    private String intervalDate;

    private String mobile;
}
