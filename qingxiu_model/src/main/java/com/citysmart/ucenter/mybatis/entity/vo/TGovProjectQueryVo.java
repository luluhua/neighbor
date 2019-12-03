package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TGovProjectQueryVo {
    /**
     * 事项服务类型1.个人 2. 法人 3 公共
     */
    private Integer serviceObjectType;
    /**
     * 主题id
     */
    private Integer  themeId;
    /**
     * 部门id
     */
    private Integer  deptId;
    /**
     * 事项类型
     */
    private Integer projectType;
    /**
     * 事项名称
     */
    private String projectTitle;
    /**
     * 服务类型
     */
    private Integer serviceType;
    /**
     * 基本编码
     */
    private String baseCode;
}
