package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.citysmart.ucenter.mybatis._Model;

/**
 * <p>
 *
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_third_interface_config")
public class TThirdInterfaceConfig extends _Model<TThirdInterfaceConfig> {

    private static final long serialVersionUID = 1L;


    /**
     * 接口名称
     */
    @TableField("interface_name")
    private String interfaceName;
    /**
     * 接口类型
     */
    @TableField("interface_type")
    private Integer interfaceType;
    /**
     * 接口版本
     */
    @TableField("interface_version")
    private String interfaceVersion;
    /**
     * 接口来源
     */
    @TableField("interface_origin")
    private Integer interfaceOrigin;
    /**
     * 接口地址
     */
    @TableField("interface_href")
    private String interfaceHref;
    /**
     * 接口图标
     */
    @TableField("interface_icon")
    private String interfaceIcon;
    /**
     * 接口状态,0 ：使用 1:已停用
     */
    @TableField("interface_status")
    private Integer interfaceStatus;
    /**
     * 排序
     */
    @TableField("sort_index")
    private Integer sortIndex;
    /**
     * 备注
     */
    private String remark;

    /**
     * 分组
     */
    @TableField("interface_group")
    private Integer interfaceGroup;

    /**
     * 接口参数
     */
    @TableField("interface_parameter")
    private String interfaceParameter;
    /**
     * 请求方式
     */
    @TableField("request_mode")
    private Integer requestMode;

    /**
     * 接口标识 code
     */
    @TableField("interface_code")
    private String interfaceCode;

    public Integer getInterfaceType() {
        return interfaceType;
    }

    public void setInterfaceType(Integer interfaceType) {
        this.interfaceType = interfaceType;
    }

    public String getInterfaceVersion() {
        return interfaceVersion;
    }

    public void setInterfaceVersion(String interfaceVersion) {
        this.interfaceVersion = interfaceVersion;
    }

    public Integer getInterfaceOrigin() {
        return interfaceOrigin;
    }

    public void setInterfaceOrigin(Integer interfaceOrigin) {
        this.interfaceOrigin = interfaceOrigin;
    }

    public String getInterfaceHref() {
        return interfaceHref;
    }

    public void setInterfaceHref(String interfaceHref) {
        this.interfaceHref = interfaceHref;
    }

    public String getInterfaceIcon() {
        return interfaceIcon;
    }

    public void setInterfaceIcon(String interfaceIcon) {
        this.interfaceIcon = interfaceIcon;
    }

    public Integer getInterfaceStatus() {
        return interfaceStatus;
    }

    public void setInterfaceStatus(Integer interfaceStatus) {
        this.interfaceStatus = interfaceStatus;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark.trim();
    }


    public Integer getInterfaceGroup() {
        return interfaceGroup;
    }

    public void setInterfaceGroup(Integer interfaceGroup) {
        this.interfaceGroup = interfaceGroup;
    }

    public String getInterfaceName() {
        return interfaceName;
    }

    public void setInterfaceName(String interfaceName) {
        this.interfaceName = interfaceName;
    }

    public Integer getSortIndex() {
        return sortIndex;
    }

    public void setSortIndex(Integer sortIndex) {
        this.sortIndex = sortIndex;
    }

    public String getInterfaceParameter() {
        return interfaceParameter;
    }

    public void setInterfaceParameter(String interfaceParameter) {
        this.interfaceParameter = interfaceParameter.trim();
    }

    public Integer getRequestMode() {
        return requestMode;
    }

    public void setRequestMode(Integer requestMode) {
        this.requestMode = requestMode;
    }

    public String getInterfaceCode() {
        return interfaceCode;
    }

    public void setInterfaceCode(String interfaceCode) {
        this.interfaceCode = interfaceCode;
    }
}
