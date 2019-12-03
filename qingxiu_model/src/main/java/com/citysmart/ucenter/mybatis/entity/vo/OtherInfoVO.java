package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;
/**
 * 个人用户其他信息
 * */
@Getter
@Setter
public class OtherInfoVO {
    private Integer id;
    /**
     * 婚否
     */
    private Integer hf;
    /**
     * 籍贯
     */
    private String jg;
    /**
     * 文化程度
     */
    private String whcd;
    /**
     * 邮政编码
     */
    private String yb;
    /**
     * 邮箱
     */
    private String yx;
    /**
     * 年龄
     */
    private Integer age;
    /**
     * 结婚证
     */
    private String jwz;
    /**
     * 毕业证
     */
    private String byez;
    /**
     * 用户id
     */
    private Integer userId;
    /**
     * 学历
     */
    private String xl;
    /**
     * 用户名
     * */
    private String username;

    @Override
    public String toString() {
        return "OtherInfoVO{" + "id=" + id + ", hf=" + hf + ", jg='" + jg + '\'' + ", whcd='" + whcd + '\'' + ", yb='" +
                yb + '\'' + ", yx='" + yx + '\'' + ", age=" + age + ", jwz='" + jwz + '\'' + ", byez='" + byez + '\'' +
                ", userId=" + userId + ", xl='" + xl + '\'' + ", username='" + username + '\'' + '}';
    }
}
