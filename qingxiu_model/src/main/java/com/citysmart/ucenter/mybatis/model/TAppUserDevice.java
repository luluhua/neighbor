package com.citysmart.ucenter.mybatis.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.citysmart.ucenter.mybatis._Model;

import java.io.Serializable;

/**
 * <p>
 * 用戶登陸設備信息
 * </p>
 *
 * @author ${author}
 * @since 2019-05-07
 */
@TableName("t_app_user_device")
public class TAppUserDevice extends _Model<TAppUserDevice> {

    private static final long serialVersionUID = 1L;

    /**
     * 客户端版本
     */
    private String version;
    /**
     * 客户端系统标识     */
    private String pid;
    /**
     * 客户端唯一标识
     */
    private String cid;
    /**
     * 客户端操作系统的版本号
     */
    private String osv;
    /**
     * 客户端设备型号MODEL
     */
    private String osm;
    /**
     * app用戶GID
     */
    private String gid;



    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getOsv() {
        return osv;
    }

    public void setOsv(String osv) {
        this.osv = osv;
    }

    public String getOsm() {
        return osm;
    }

    public void setOsm(String osm) {
        this.osm = osm;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }



    @Override
    protected Serializable pkVal() {
        return this.getId();
    }

    @Override
    public String toString() {
        return "TAppUserDevice{" +
        "version=" + version +
        ", pid=" + pid +
        ", cid=" + cid +
        ", osv=" + osv +
        ", osm=" + osm +
        ", gid=" + gid +
        "}";
    }
}
