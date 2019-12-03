package com.citysmart.ucenter.component;

import com.citysmart.ucenter.common.util.RedisUtil;
import com.citysmart.ucenter.common.util.SysSettingUtil;
import com.citysmart.ucenter.mybatis.model.SysSetting;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Order(value =1)
public class MyCommandLineRunner implements CommandLineRunner {

    @Override
    public void run(String... args) throws Exception {
        try {
            RedisUtil.dellAllByPackagenName(SysSettingUtil.getRedisPackageKey());
            List<SysSetting> sysSettingList = SysSettingUtil.getSysSettingList(0);
            if (sysSettingList != null && !sysSettingList.isEmpty()) {
                for (SysSetting setting : sysSettingList) {
                    RedisUtil.setKeyValue(setting.getSysKey(),setting.getSysValue());
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}