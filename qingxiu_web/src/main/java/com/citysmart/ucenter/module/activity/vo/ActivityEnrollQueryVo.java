package com.citysmart.ucenter.module.activity.vo;

import lombok.Data;

@Data
public class ActivityEnrollQueryVo {
    /**
     * 分组
     */
    private String group;
    /**
     * 作品名称
     */
    private String workName;
    /**
     * 作者姓名
     */
    private String name;
    private String dtCreate;
    private String workClass;
    private String affiliation;
    private Integer approveStatus;

    /**
     * 报名日期开始
     * */
    private String createTimeStart;
    /**
     * 报名日期结束
     * */
    private String createTimeEnd;
}
