package com.citysmart.ucenter.module.system.service;

import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.model.TSysDict;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
public interface ITSysDictService extends IService<TSysDict> {
    /**
     * 根据类型和label获取字典
     * @param type
     * @param label
     * @return
     */
    @Deprecated
    TSysDict selectByTypeAndLabel(String type,String label);

    TSysDict selectByTypeAndValue(String type, String value);

    /**
     * 根据类型和code获取字典
     * @param type
     * @param code
     * @return
     */
    TSysDict selectByTypeAndCode(String type,String code);
}
