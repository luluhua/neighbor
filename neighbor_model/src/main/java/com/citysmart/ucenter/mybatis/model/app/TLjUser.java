package com.citysmart.ucenter.mybatis.model.app;

import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 平台用户表
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@TableName("t_lj_user")
public class TLjUser extends Model<TLjUser> {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.UUID)
    private String id;
    /**
     * 用户名
     */
    private String username;
    /**
     * 密码
     */
    private String password;
    private String mobile;
    /**
     * 0:正在使用中 1 禁用
     */
    private Integer status;
    /**
     * GUID
     */
    private String guid;
    /**
     * 创建时间
     */
    @TableField(value = "dt_create", fill = FieldFill.INSERT)
    private Date dtCreate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public Date getDtCreate() {
        return dtCreate;
    }

    public void setDtCreate(Date dtCreate) {
        this.dtCreate = dtCreate;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "TLjUser{" +
                "username=" + username +
                ", password=" + password +
                ", mobile=" + mobile +
                ", status=" + status +
                ", guid=" + guid +
                ", dtCreate=" + dtCreate +
                "}";
    }
}
