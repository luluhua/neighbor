package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.enums.IdType;

import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

/**
 * <p>
 * <p>
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_sys_user")
public class TSysUser extends Model<TSysUser> {

    private static final long serialVersionUID = 1L;
    public static final int status_0 = 0;
    public static final int status_1 = 1;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 用户名
     */
    private String username;
    /**
     * 真名
     */
    private String realname;
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 手机号码
     */
    private String mobile;
    /**
     * 联系地址
     */
    private String address;
    /**
     * 0:未填写，1：男，2：女
     */
    private Integer gender;
    /**
     * 0:新用户 1：正常使用中
     */
    private Integer status;
    /**
     * 创建时间
     */
    @TableField("dt_create")
    private Date dtCreate;
    /**
     * 修改时间
     */
    @TableField("dt_modified")
    private Date dtModified;
    /**
     * 登录次数
     */
    @TableField("login_count")
    private Integer loginCount;
    /**
     * 最后一次登录时间
     */
    @TableField("last_login_date")
    private Date lastLoginDate;
    /**
     * 部门机构id
     */
    @TableField("dept_id")
    private Integer deptId;
    /**
     * 头像
     */
    @TableField("avatar_url")
    private String avatarUrl;

    //临时字段（不存数据库）
    @TableField(exist = false)
    private String password;
    @TableField(exist = false)
    private String deptName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
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

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getDtCreate() {
        return dtCreate;
    }

    public void setDtCreate(Date dtCreate) {
        this.dtCreate = dtCreate;
    }

    public Date getDtModified() {
        return dtModified;
    }

    public void setDtModified(Date dtModified) {
        this.dtModified = dtModified;
    }

    public Integer getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }

    public Date getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(Date lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
