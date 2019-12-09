package com.citysmart.ucenter.api.vo;

import com.citysmart.ucenter.mybatis.model.SysCity;
import com.tuyang.beanutils.annotation.BeanCopySource;
import com.tuyang.beanutils.annotation.CopyProperty;
import jdk.nashorn.internal.ir.annotations.Ignore;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
@BeanCopySource(source = SysCity.class)
public class TSysCityVo {
    /**
     * 广西南宁青秀区
     */
    @Ignore
    public static  final  Integer QINGXIU_AREA_ID=2924;

    private Integer id;
    private String abbreviation;

}
