package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * 身份证信息
 * */
@Getter
@Setter
public class IdcardVO {
    private Integer id;
    private Integer userId;
    /**
     * 证件姓名
     */
    private String name;
    /**
     * 性别
     */
    private Integer sex;
    /**
     * 民族
     */
    private String nation;
    /**
     * 出生日期
     */
    private String birth;
    /**
     * 地址
     */
    private String address;
    /**
     * 身份证号
     */
    private String idcard;
    /**
     * 证件的有效期
     */
    private String validDate;
    /**
     * 发证机关
     */
    private String authority;
    /**
     * 0-正面 1-反面
     */
    private Integer cardType;
    /**
     * 人像照片
     */
    private String portrait;
    /**
     * 身份证背面
     */
    private String backimage;
    /**
     * 身份证正面
     */
    private String frontimage;
    /**
     * 用户名
     * */
    private String username;

    @Override
    public String toString() {
        return "IdcardVO{" + "id=" + id + ", userId=" + userId + ", name='" + name + '\'' + ", sex=" + sex +
                ", nation='" + nation + '\'' + ", birth='" + birth + '\'' + ", address='" + address + '\'' +
                ", idcard='" + idcard + '\'' + ", validDate='" + validDate + '\'' + ", authority='" + authority + '\'' +
                ", cardType=" + cardType + ", portrait='" + portrait + '\'' + ", backimage='" + backimage + '\'' +
                ", frontimage='" + frontimage + '\'' + ", username='" + username + '\'' + '}';
    }
}
