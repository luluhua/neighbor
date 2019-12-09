package com.citysmart.ucenter.mybatis.model.app;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 用户分享记录
 * </p>
 *
 * @author liuguicheng
 * @since 2019-09-02
 */
@TableName("t_app_user_sharelog")
public class TAppUserSharelog extends Model<TAppUserSharelog> {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private String id;
    /**
     * 用户gid
     */
    private String gid;
    /**
     * 创建时间
     */
    @TableField("dt_create")
    private Date dtCreate;

    /**
     * 分享次数
     */
    @TableField("share_num")
    private Integer shareNum;
    /**
     * 分享碼
     */
    @TableField("share_code")
    private String shareCode;

    /**
     * 浏览数
     */
    @TableField("browse_num")
    private Integer browseNum;
    /**
     * 下载数
     */
    @TableField("dowload_num")
    private Integer dowloadNum;
    /**
     * 激活数
     */
    @TableField("activation_num")
    private Integer activationNum;
    /**
     * 删除标识
     */
    @TableLogic
    @TableField(value = "is_deleted", fill = FieldFill.INSERT)
    private Integer isDeleted;


    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public Date getDtCreate() {
        return dtCreate;
    }

    public void setDtCreate(Date dtCreate) {
        this.dtCreate = dtCreate;
    }

    public String getShareCode() {
        return shareCode;
    }

    public void setShareCode(String shareCode) {
        this.shareCode = shareCode;
    }

    public Integer getBrowseNum() {
        return browseNum;
    }

    public void setBrowseNum(Integer browseNum) {
        this.browseNum = browseNum;
    }

    public Integer getDowloadNum() {
        return dowloadNum;
    }

    public void setDowloadNum(Integer dowloadNum) {
        this.dowloadNum = dowloadNum;
    }

    public Integer getActivationNum() {
        return activationNum;
    }

    public void setActivationNum(Integer activationNum) {
        this.activationNum = activationNum;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }

    public String getId() {
        return id;
    }

    public Integer getShareNum() {
        return shareNum;
    }

    public void setShareNum(Integer shareNum) {
        this.shareNum = shareNum;
    }

    public void setId(String id) {
        this.id = id;
    }


    @Override
    public String toString() {
        return "TAppUserSharelog{" +
        "gid=" + gid +
        ", dtCreate=" + dtCreate +
        ", shareCode=" + shareCode +
        ", browseNum=" + browseNum +
        ", dowloadNum=" + dowloadNum +
        ", activationNum=" + activationNum +
        ", isDeleted=" + isDeleted +
        "}";
    }
}
