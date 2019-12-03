package com.citysmart.ucenter.mybatis.entity.vo;

import com.citysmart.ucenter.mybatis.model.TSysDict;
import com.tuyang.beanutils.annotation.BeanCopySource;
import com.tuyang.beanutils.annotation.CopyProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@BeanCopySource(source = TSysDict.class)
public class ProConfigDictVo {

    private Integer id;
    @CopyProperty(property = "label")
    private String title;

    private String value;
    /**
     * 0 选中 1未选中
     */
    private Integer isSelected;
}
