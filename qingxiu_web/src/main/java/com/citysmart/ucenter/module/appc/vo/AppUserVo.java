package com.citysmart.ucenter.module.appc.vo;

import com.citysmart.ucenter.mybatis.model.TAppUser;
import com.tuyang.beanutils.annotation.BeanCopySource;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@BeanCopySource(source = TAppUser.class)
public class AppUserVo {
    private Integer id;
    private String gid;
    private String idCard;
    private String name;
    private String mobile;

}
