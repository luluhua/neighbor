package com.citysmart.ucenter.mybatis.model.app;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * app用户行为日志
 * </p>
 *
 * @author zhouyanjian
 * @since 2019-08-29
 */
@Data
@TableName("t_app_page_operation_log")
public class TAppPageOperationLog extends Model<TAppPageOperationLog> {

    private static final long serialVersionUID = 1L;

    @TableId(type=IdType.AUTO)
    private Integer id;
    /**
     * 模块
     */
    private String model;
    /**
     * 名称
     */
    private String name;
    /**
     * 页面地址
     */
    private String url;
    /**
     * 页面key
     */
    private String key;
    /**
     * 功能名称
     */
    @TableField("fun_name")
    private String funName;
    /**
     * 开始访问时间
     */
    @TableField("start_time")
    private Date dtStartTime;
    /**
     * 结束访问时间
     */
    @TableField("end_time")
    private Date dtEndTime;
    /**
     * 时长（秒）
     */
    @TableField("time_length")
    private Integer timeLength;
    /**
     * 设备token
     */
    @TableField("equipment_token")
    private String equipmentToken;
    /**
     * 页面类型：1：原生， 2：H5， 3：功能
     */
    @TableField("page_type")
    private Integer pageType;
    /**
     * 设备类型：ios，android
     */
    @TableField("mobile_platform")
    private String mobilePlatform;
    /**
     * app版本
     */
    @TableField("app_version")
    private String appVersion;
    /**
     * APP包名
     */
    @TableField("package_name")
    private String packageName;
    /**
     * 值
     */
    private String val;
    /**
     * 用户Gid
     */
    private String gid;
    /**
     * 访问IP
     */
    @TableField("request_ip")
    private String requestIp;
    /**
     * 客户端操作系统版本
     */
    @TableField("mobile_system_version")
    private String mobileSystemVersion;
    /**
     * 客户端手机型号
     */
    @TableField("mobile_model")
    private String mobileModel;
    /**
     * 创建时间
     */
    @TableField("dt_create")
    private Date dtCreate;
    /**
     * 是否删除：0否，1是
     */
    @TableField("is_deleted")
    private Integer isDeleted;

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
