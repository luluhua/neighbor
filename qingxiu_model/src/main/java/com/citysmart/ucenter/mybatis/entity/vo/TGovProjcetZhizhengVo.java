package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class TGovProjcetZhizhengVo {


    private Integer id;
    /**
     * 办事记录ID
     */
    private Integer projectRecordId;
    /**
     * 事项名称
     */
    private String projectTitle;

    /**
     * 事项部门ID
     */
    private Integer deptId;
    /**
     * 事项部门
     */
    private String deptName;
    /**
     * 备注
     */
    private String remark;

    /**
     * 是否制证 0未制证 1已制证
     */
    private Integer state;

    private Date dtCreate;
    /**
     * 操作人
     */
    private String userName;

    /**
     * 制证时间
     */
    private Date dtZhizheng;

    /**
     * app用户名
     */
    private String appUserName;
    /**
     * app用户电话
     */
    private String appUserMobile;


}
