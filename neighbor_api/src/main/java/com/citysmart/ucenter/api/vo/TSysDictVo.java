package com.citysmart.ucenter.api.vo;

import com.citysmart.ucenter.mybatis.model.TSysDict;
import com.tuyang.beanutils.annotation.BeanCopySource;
import com.tuyang.beanutils.annotation.CopyProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@BeanCopySource(source = TSysDict.class)
public class TSysDictVo {
    @CopyProperty(property = "value")
    String value;
    @CopyProperty(property = "label")
    String name;
}
