package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;


/**
 * <p>
 * 系统设置表
 * </p>
 *
 * @author GaoJun.Zhou
 * @since 2017-03-06
 */
@TableName("t_sys_setting")
public class SysSetting extends Model<SysSetting> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Integer Id;
    /**
     * KEY
     */
    private String sysKey;
    /**
     * 名称
     */
    private String sysName;
    /**
     * 值
     */
    private String sysValue;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 说明
     */
    private String sysDesc;

    /**
     * 分组
     */
    private Integer sysSettingGroup;


    public Integer getId() {
        return Id;
    }

    public void setId(Integer Id) {
        this.Id = Id;
    }

    public String getSysKey() {
        return sysKey;
    }

    public void setSysKey(String sysKey) {
        this.sysKey = sysKey;
    }

    public String getSysName() {
        return sysName;
    }

    public void setSysName(String sysName) {
        this.sysName = sysName;
    }

    public String getSysValue() {
        return sysValue;
    }

    public void setSysValue(String sysValue) {
        this.sysValue = sysValue;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getSysDesc() {
        return sysDesc;
    }

    public void setSysDesc(String sysDesc) {
        this.sysDesc = sysDesc;
    }

    @Override
    protected Serializable pkVal() {
        return this.Id;
    }

    public Integer getSysSettingGroup() {
        return sysSettingGroup;
    }

    public void setSysSettingGroup(Integer sysSettingGroup) {
        this.sysSettingGroup = sysSettingGroup;
    }
}
