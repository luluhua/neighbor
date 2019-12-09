package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @author lub
 */
@Getter
@Setter
public class TGovProjectCityOrgAdressVo {
    /**
     * 行政审批
     */
    public static final Integer SERVICE_TYPE_XZSP=0;
    /**
     * 基层治理
     */
    public static final Integer SERVICE_TYPE_JCBS=1;


    private Integer id;
    private String projectTitle;
    private String brief;
    private String cityName;
    private String streeName;
    private String communityName;
    private String deptName;
    private String deptAddress;
    private Integer sortIndex;

    private Integer cityId;
    private Integer orgId;
    private Integer orgAddressId;
    private Integer  projectId;
    private Integer  serviceType;
    private String modelKey;

}
