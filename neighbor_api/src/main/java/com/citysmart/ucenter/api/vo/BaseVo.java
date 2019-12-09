package com.citysmart.ucenter.api.vo;

import com.citysmart.ucenter.common.util.RedisUtil;

public class BaseVo {
    //图片访问前缀
    public final static String ICON_PREFIX= RedisUtil.getValueByKey("http.img.url");
}
