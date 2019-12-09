package com.citysmart.ucenter.mybatis.model.app;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author lub
 * @since 2019-12-09
 */
@TableName("t_lj_user_security")
public class TLjUserSecurity extends Model<TLjUserSecurity> {

    private static final long serialVersionUID = 1L;

    @TableId("user_id")
    private String userId;
    private String password;
    private String salt;


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    @Override
    protected Serializable pkVal() {
        return this.userId;
    }

    @Override
    public String toString() {
        return "TLjUserSecurity{" +
        "userId=" + userId +
        ", password=" + password +
        ", salt=" + salt +
        "}";
    }
}
