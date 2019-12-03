package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.citysmart.ucenter.mybatis._Model;

import javax.validation.constraints.NotBlank;

/**
 * 手机白名单
 * */
@TableName(" t_app_mobilewhitelist")
public class TAppMobileWhiteList extends _Model<TAppMobileWhiteList> {
    private static final long serialVersionUID = 1L;
    /**
     * 手机号码
     * */
    @TableField("mobile")
    @NotBlank(message = "手机号码不能为空")
    private String mobile;

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
