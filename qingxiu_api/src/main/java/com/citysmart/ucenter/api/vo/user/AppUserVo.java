package com.citysmart.ucenter.api.vo.user;

import com.citysmart.ucenter.mybatis.model.TAppUser;
import com.tuyang.beanutils.annotation.BeanCopySource;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@BeanCopySource(source = TAppUser.class)
public class AppUserVo {

    private String gid;
    private Integer userType;
    //过期时间
    private Long expiresAtTime;
    //刷新时间
    private Long refreshTime;
    //登录token
    private String token;
}
