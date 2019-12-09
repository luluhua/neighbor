package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
@Getter
@Setter
public class ProjectOrgVo {
    private Integer pid;
    /**
     * 机构代码
     */
    private String code;
    /**
     * 显示顺序
     */
    private Integer sortIndex;
    /**
     * 部门名称
     */
    private String name;

    /**
     * 图标路径
     */
    private String logoUrl;
    /**
     * 联系地址
     */
    private String address;
    /**
     * 备注
     */
    private String remark;
    /**
     * 是否系统内置，系统内置的数据不可删除
     */
    private Integer isSystem;

    /**
     * 深度
     */
    private Integer deep;
    /**
     * 部门类型
     */
    private Integer orgType;

    /**
     * 行政区域id
     */
    private Integer cityId;

    /**
     * 简称
     */
    private String abbreviation;

    /**
     *经度
     */
    private BigDecimal lat;
    /**
     *纬度
     */
    private BigDecimal lng;
    /**
     *公交路线
     */
    private String busRoute;
    /**
     *宣传图
     */
    private String promotionalImage;
    /**
     * 邮箱地址
     */
    private String email;
    /**
     * 联系电话（同telPhone）
     * */
    private String mobile;
}
