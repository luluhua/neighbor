package com.citysmart.ucenter.mybatis.model;

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
 * @author ${author}
 * @since 2019-06-03
 */
@TableName("t_sys_attachment")
public class TSysAttachment extends Model<TSysAttachment> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 唯一标识
     */
    private String gid;
    /**
     * 文件名
     */
    private String name;
    /**
     * 文件大小
     */
    @TableField("file_size")
    private Long fileSize;
    /**
     * 文件扩展名
     */
    private String fileext;
    /**
     * 存放路径
     */
    @TableField("file_path")
    private String filePath;
    /**
     * 文件宽度
     */
    @TableField("image_width")
    private Integer imageWidth;
    /**
     * 文件高度
     */
    @TableField("image_height")
    private Integer imageHeight;
    /**
     * 排序
     */
    private Integer sortindex;
    /**
     * 文件描述
     */
    private String descript;
    /**
     * 来源
     */
    private String source;
    /**
     * 来源id
     */
    @TableField("source_id")
    private String sourceId;
    /**
     * 分类id
     */
//    @TableField("classify")
    private String classify;
    /**
     * 查看次数
     */
    private Integer viewcount;
    /**
     * 上传者id
     */
    @TableField("create_userId")
    private Integer createUserid;
    /**
     * 上传者名称
     */
    @TableField("create_username")
    private String createUsername;
    /**
     * 上传时间
     */
    @TableField(value = "create_datetime", fill = FieldFill.INSERT)
    private Date createDatetime;
    /**
     * 上传者ip
     */
    @TableField("create_userIP")
    private String createUserip;
    /**
     * 是否显示
     */
    @TableField("Is_show")
    private Boolean isShow;
    @TableField("ph_ash1")
    private String phAsh1;
    @TableField("ph_ash2")
    private String phAsh2;
    /**
     * 文件原名
     */
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

    public Integer getCreateUserid() {
        return createUserid;
    }

    public void setCreateUserid(Integer createUserid) {
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

    public Boolean getShow() {
        return isShow;
    }

    public void setShow(Boolean isShow) {
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
        return this.id;
    }

    @Override
    public String toString() {
        return "TSysAttachment{" +
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
                "}";
    }
}
