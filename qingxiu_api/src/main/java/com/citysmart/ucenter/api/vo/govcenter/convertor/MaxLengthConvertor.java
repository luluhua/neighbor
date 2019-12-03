package com.citysmart.ucenter.api.vo.govcenter.convertor;

import com.tuyang.beanutils.BeanCopyConvertor;

public class MaxLengthConvertor implements BeanCopyConvertor<Integer, String> {
    @Override
    public String convertTo(Integer integer) {
        return integer + "份";
    }
}
