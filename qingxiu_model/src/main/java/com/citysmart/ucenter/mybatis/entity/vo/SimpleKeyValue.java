package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * <p>
 * 一个简单键值对象
 * </p>
 *
 * @author zhouyanjian
 * @Date 2019/7/12 16:18
 */
@Getter
@Setter
public class SimpleKeyValue implements Serializable {
    private String key;
    private String value;
}
