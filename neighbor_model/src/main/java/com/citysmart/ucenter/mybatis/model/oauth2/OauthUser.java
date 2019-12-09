package com.citysmart.ucenter.mybatis.model.oauth2;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author ${author}
 * @since 2019-07-05
 */
@TableName("oauth_user")
public class OauthUser extends Model<OauthUser> {

    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.AUTO)
    private Integer id;
    /***
     *  appuser  gid
     **/
    private String username;
    /***
     * 授权密码（授权中心，自动生成）
     **/
    private String password;
    /***
     * 是否可用 1可用 0不可用
     **/
    private Boolean isEnable;
    /***
     * 是否过期 1过期 0未过期
     **/
    private Boolean isExpired;
    /***
     * 是否锁定 1 未锁定 0已锁定
     **/
    private Boolean isLocked;

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

    public Boolean getEnable() {
        return isEnable;
    }

    public void setEnable(Boolean isEnable) {
        this.isEnable = isEnable;
    }

    public Boolean getExpired() {
        return isExpired;
    }

    public void setExpired(Boolean isExpired) {
        this.isExpired = isExpired;
    }

    public Boolean getLocked() {
        return isLocked;
    }

    public void setLocked(Boolean isLocked) {
        this.isLocked = isLocked;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "OauthUser{" +
        ", password=" + password +
        ", isEnable=" + isEnable +
        ", isExpired=" + isExpired +
        ", isLocked=" + isLocked +
        "}";
    }
}
