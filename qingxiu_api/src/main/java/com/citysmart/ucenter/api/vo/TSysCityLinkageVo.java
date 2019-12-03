package com.citysmart.ucenter.api.vo;

import com.citysmart.ucenter.mybatis.model.SysCity;
import com.tuyang.beanutils.annotation.BeanCopySource;
import jdk.nashorn.internal.ir.annotations.Ignore;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@BeanCopySource(source = SysCity.class)
public class TSysCityLinkageVo {
    private Integer id;
    private Integer pid;
    private String name;
    private String abbreviation;
}
