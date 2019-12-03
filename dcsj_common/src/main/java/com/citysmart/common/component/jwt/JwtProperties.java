package com.citysmart.common.component.jwt;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JwtProperties {
    //token过期时间，单位分钟
    Integer tokenExpireTime;
    //刷新Token过期时间，单位分钟
    Integer refreshTokenExpireTime;
    //Shiro缓存有效期，单位分钟
    Integer shiroCacheExpireTime;
    //token加密密钥
    String secretKey;

    public JwtProperties( Integer tokenExpireTime,Integer refreshTokenExpireTime,Integer shiroCacheExpireTime,String secretKey){
        this.tokenExpireTime=tokenExpireTime;
        this.refreshTokenExpireTime=refreshTokenExpireTime;
        this.shiroCacheExpireTime=shiroCacheExpireTime;
        this.secretKey=secretKey;
    }

}
