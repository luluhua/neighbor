package com.citysmart.ucenter.common.util;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.ucenter.module.system.service.ISysSettingService;
import com.citysmart.ucenter.mybatis.model.SysSetting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

@Component
public class SysSettingUtil {
    @Autowired
    private ISysSettingService sysSettingService;

    private static ISysSettingService sysSettingServiceStatic;

    private static final  String KEY=".manage";

    @PostConstruct
    public void init(){
        SysSettingUtil.sysSettingServiceStatic=sysSettingService;
    }

    public static String getRedisPackageKey() {
        SysSetting settings =
                sysSettingServiceStatic.selectOne(new EntityWrapper<SysSetting>().eq("sysKey", "spring.redis.keyPrefix"));
        if (settings == null) {
            return null;
        }
        return settings.getSysValue()+KEY;
    }

    /**
     * 通过key查询 系统设置值
     */
    public static String getValueByKey(String key) {
        SysSetting settings = sysSettingServiceStatic.selectOne(new EntityWrapper<SysSetting>().eq("sysKey", key));
        if (settings == null) {
            return null;
        }
        return settings.getSysValue();
    }

    /**
     * 通过分组查询 系统设置列表
     */
    public static List<SysSetting> getSysSettingList(Integer sysSettingGroup) {
        List<SysSetting> sysSettingList = null;
        if (sysSettingGroup == 0) {
            sysSettingList = sysSettingServiceStatic.findAll();
        } else {
            sysSettingList = sysSettingServiceStatic
                    .selectList(new EntityWrapper<SysSetting>().eq("sysSettingGroup", sysSettingGroup));
        }
        return sysSettingList;
    }
}
