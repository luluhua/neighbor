package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * 用户设备登录信息查询实体
 * */
@Getter
@Setter
public class DeviceVO {
    private Integer id;
    /**
     * 客户端版本
     */
    private String version;
    /**
     * 客户端系统标识
     */
    private String pid;
    /**
     * 客户端唯一标识
     */
    private String cid;
    /**
     * 客户端操作系统的版本号
     */
    private Integer osv;
    /**
     * 客户端设备型号MODEL
     */
    private String osm;
    /**
     * app用戶GID
     */
    private String gid;
    /**
     * app用户名称
     * */
    private String username;

    private Date dtcreate;

    @Override
    public String toString() {
        return "DeviceVO{" + "id=" + id + ", version='" + version + '\'' + ", pid='" + pid + '\'' + ", cid='" + cid +
                '\'' + ", osv=" + osv + ", osm='" + osm + '\'' + ", gid='" + gid + '\'' + ", username='" + username +
                '\'' + ", dtcreate=" + dtcreate + '}';
    }
}
