package com.citysmart.ucenter.mybatis.model.app;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 用户扩展表
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@TableName("t_lj_user_info")
public class TLjUserInfo extends Model<TLjUserInfo> {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.UUID)
    private String id;
    /**
     * 用户表id
     */
    @TableField("user_id")
    private String userId;
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 0:未填写，1：男，2：女
     */
    private Integer gender;
    /**
     * 头像
     */
    @TableField("avatar_url")
    private String avatarUrl;

    @TableField(exist = false)
    private String mobile;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "TLjUserInfo{" +
                "userId=" + userId +
                ", nickname=" + nickname +
                ", email=" + email +
                ", gender=" + gender +
                ", avatarUrl=" + avatarUrl +
                "}";
    }
}
