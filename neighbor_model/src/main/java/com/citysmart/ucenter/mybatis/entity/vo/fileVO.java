package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2019/3/26
 */
@Setter
@Getter
public class fileVO {
    private String classify;
    private String name;

    @Override
    public String toString() {
        return "fileVO{" +
                "classify=" + classify +
                ", name=" + name +
                "}";
    }

}
