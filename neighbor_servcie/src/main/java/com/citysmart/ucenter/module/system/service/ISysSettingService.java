package com.citysmart.ucenter.module.system.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.model.SysSetting;

/**
 * SysSetting 表数据服务层接口
 */
public interface ISysSettingService extends IService<SysSetting> {

    List<SysSetting> findAll();


}