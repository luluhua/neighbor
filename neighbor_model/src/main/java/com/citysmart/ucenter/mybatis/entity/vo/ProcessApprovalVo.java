package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * 审批操作业务实体类
 */
@Getter
@Setter
public class ProcessApprovalVo {

    public static final Integer YES = 1;

    public static final Integer NO = 1;
    /**
     * 事项id
     */
    public String projectId;
    /**
     * 备注
     */
    public String reason;
    /**
     * 状态 （操作）
     */
    public Integer result;

    /**
     * 流程任务ID
     */
    public String taskId;

    /**
     * 流程ID
     */
    private String procInstId;

    /**
     * 审批人员id
     */
    private Integer userId;

    /**
     * 用户Gid
     */
    private String gid;
    /**
     * 办事记录id
     */
    private String recordId;

    private String materialsFlag;

}
