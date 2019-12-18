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
 * @since 2019-12-18
 */
@TableName("t_client_attachment")
public class TClientAttachment extends Model<TClientAttachment> {

    private static final long serialVersionUID = 1L;
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String gid;
    private String name;
    @TableField("file_size")
    private Long fileSize;
    private String fileext;
    @TableField("file_path")
    private String filePath;
    @TableField("image_width")
    private Integer imageWidth;
    @TableField("image_height")
    private Integer imageHeight;
    private Integer sortindex;
    private String descript;
    private String source;
    @TableField("source_id")
    private String sourceId;
    private String classify;
    private Integer viewcount;
    @TableField("create_userId")
    private String createUserid;
    @TableField("create_username")
    private String createUsername;
    @TableField(value = "create_datetime", fill = FieldFill.INSERT)
    private Date createDatetime;
    @TableField("create_userIP")
    private String createUserip;
    @TableField("Is_show")
    private String isShow;
    @TableField("ph_ash1")
    private String phAsh1;
    @TableField("ph_ash2")
    private String phAsh2;
    @TableField("file_old_name")
    private String fileOldName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getFileSize() {
        return fileSize;
    }

    public void setFileSize(Long fileSize) {
        this.fileSize = fileSize;
    }

    public String getFileext() {
        return fileext;
    }

    public void setFileext(String fileext) {
        this.fileext = fileext;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Integer getImageWidth() {
        return imageWidth;
    }

    public void setImageWidth(Integer imageWidth) {
        this.imageWidth = imageWidth;
    }

    public Integer getImageHeight() {
        return imageHeight;
    }

    public void setImageHeight(Integer imageHeight) {
        this.imageHeight = imageHeight;
    }

    public Integer getSortindex() {
        return sortindex;
    }

    public void setSortindex(Integer sortindex) {
        this.sortindex = sortindex;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getSourceId() {
        return sourceId;
    }

    public void setSourceId(String sourceId) {
        this.sourceId = sourceId;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    public Integer getViewcount() {
        return viewcount;
    }

    public void setViewcount(Integer viewcount) {
        this.viewcount = viewcount;
    }

    public String getCreateUserid() {
        return createUserid;
    }

    public void setCreateUserid(String createUserid) {
        this.createUserid = createUserid;
    }

    public String getCreateUsername() {
        return createUsername;
    }

    public void setCreateUsername(String createUsername) {
        this.createUsername = createUsername;
    }

    public Date getCreateDatetime() {
        return createDatetime;
    }

    public void setCreateDatetime(Date createDatetime) {
        this.createDatetime = createDatetime;
    }

    public String getCreateUserip() {
        return createUserip;
    }

    public void setCreateUserip(String createUserip) {
        this.createUserip = createUserip;
    }

    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow;
    }

    public String getPhAsh1() {
        return phAsh1;
    }

    public void setPhAsh1(String phAsh1) {
        this.phAsh1 = phAsh1;
    }

    public String getPhAsh2() {
        return phAsh2;
    }

    public void setPhAsh2(String phAsh2) {
        this.phAsh2 = phAsh2;
    }

    public String getFileOldName() {
        return fileOldName;
    }

    public void setFileOldName(String fileOldName) {
        this.fileOldName = fileOldName;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }

    @Override
    public String toString() {
        return "TClientAttachment{" +
                "gid=" + gid +
                ", name=" + name +
                ", fileSize=" + fileSize +
                ", fileext=" + fileext +
                ", filePath=" + filePath +
                ", imageWidth=" + imageWidth +
                ", imageHeight=" + imageHeight +
                ", sortindex=" + sortindex +
                ", descript=" + descript +
                ", source=" + source +
                ", sourceId=" + sourceId +
                ", classify=" + classify +
                ", viewcount=" + viewcount +
                ", createUserid=" + createUserid +
                ", createUsername=" + createUsername +
                ", createDatetime=" + createDatetime +
                ", createUserip=" + createUserip +
                ", isShow=" + isShow +
                ", phAsh1=" + phAsh1 +
                ", phAsh2=" + phAsh2 +
                ", fileOldName=" + fileOldName +
                "}";
    }
}
