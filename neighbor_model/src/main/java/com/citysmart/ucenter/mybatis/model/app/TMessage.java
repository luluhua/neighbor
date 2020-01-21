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
 * <p>
 * </p>
 *
 * @author lub
 * @since 2020-01-16
 */
@TableName("t_message")
public class TMessage extends Model<TMessage> {

    private static final long serialVersionUID = 1L;


    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * sender
     */
    private String sender;
    /**
     * 用户id
     */
    @TableField("user_id")
    private String userId;
    /**
     * 类型 0系统消息  1用户消息
     */
    private Integer type;
    /**
     * 标题
     */
    private String userName;
    /**
     * 内容
     */
    private String content;
    /**
     * 附件 多个,隔开
     */
    private String files;
    /**
     * 是否已读 0：未读 1：已读
     */
    private Integer status;
    /**
     * 创建时间
     */
    @TableField(value = "dt_create", fill = FieldFill.INSERT)
    private Date dtCreate;
    /**
     * 是否删除 1:已删除 0：未删除
     */
    @TableField("is_deleted")
    private Integer isDeleted;
    /**
     * 0发送者  1接收者
     */
    private Integer uset;

    @TableField(exist = false)
    private String avatarUrl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFiles() {
        return files;
    }

    public void setFiles(String files) {
        this.files = files;
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

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Integer getUset() {
        return uset;
    }

    public void setUset(Integer uset) {
        this.uset = uset;
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

    @Override
    public String toString() {
        return "TMessage{" +
                "sender=" + sender +
                ", userId=" + userId +
                ", type=" + type +
                ", userName=" + userName +
                ", content=" + content +
                ", files=" + files +
                ", status=" + status +
                ", dtCreate=" + dtCreate +
                ", isDeleted=" + isDeleted +
                ", avatarUrl=" + avatarUrl +
                "}";
    }
}
