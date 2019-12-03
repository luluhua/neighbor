package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.citysmart.ucenter.mybatis._Model;

/**
 * <p>
 * <p>
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_attachments")
public class TAttachments extends _Model<TAttachments> {

    private static final long serialVersionUID = 1L;
    /**
     * 服务id
     */
    @TableField("service_id")
    private String serviceId;
    /**
     * 文件类型,1：图片 2:其他
     */
    @TableField("file_type")
    private Integer fileType;
    /**
     * 文件地址
     */
    @TableField("file_url")
    private String fileUrl;
    /**
     * 文件名称
     */
    @TableField("file_name")
    private String fileName;
    /**
     * 文件大小
     */
    @TableField("file_size")
    private Long fileSize;
    /**
     * 文件扩展
     */
    @TableField("file_ext")
    private String fileExt;
    /**
     * 排序
     */
    @TableField("sort_index")
    private Integer sortIndex;

    /**
     * 分组id
     */
    @TableField("group_id")
    private Integer groupId;

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public Integer getFileType() {
        return fileType;
    }

    public void setFileType(Integer fileType) {
        this.fileType = fileType;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Long getFileSize() {
        return fileSize;
    }

    public void setFileSize(Long fileSize) {
        this.fileSize = fileSize;
    }

    public String getFileExt() {
        return fileExt;
    }

    public void setFileExt(String fileExt) {
        this.fileExt = fileExt;
    }

    public Integer getSortIndex() {
        return sortIndex;
    }

    public void setSortIndex(Integer sortIndex) {
        this.sortIndex = sortIndex;
    }


    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }
}
