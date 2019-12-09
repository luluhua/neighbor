package com.citysmart.ucenter.api.vo.jcbs;

import com.citysmart.ucenter.mybatis.entity.vo.TGovProjectCityOrgAdressVo;
import com.tuyang.beanutils.annotation.BeanCopySource;
import com.tuyang.beanutils.annotation.CopyProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * @author lub
 */
@Setter
@Getter
@BeanCopySource(source = TGovProjectCityOrgAdressVo.class)
public class JcbsProjectVo {

    private Integer id;
    @CopyProperty(property = "projectTitle")
    private String title;

    @CopyProperty(property = "brief")
    private String brief;
    private Boolean isEdit = false;
    private String projectLabel;
    private String btnType;
    private String projectColor;
    private Integer recordId ;
    /**
     * 基础事项id
     */
    private Integer  projectId;
    /**
     * 0,行政审批 1. 基层服务
     */
    private Integer  serviceType;
    /**
     * 部门id
     * */
    private Integer orgId;
}
