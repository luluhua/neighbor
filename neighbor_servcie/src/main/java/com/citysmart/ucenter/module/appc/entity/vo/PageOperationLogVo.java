package com.citysmart.ucenter.module.appc.entity.vo;

import com.citysmart.ucenter.mybatis.model.app.TAppPageOperationLog;
import com.tuyang.beanutils.annotation.BeanCopySource;
import com.tuyang.beanutils.annotation.CopyProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * <p>
 * TODO
 * </p>
 *
 * @author zhouyanjian
 * @date 2019/8/29 16:40
 */
@Data
@BeanCopySource(source = TAppPageOperationLog.class)
@ApiModel
public class PageOperationLogVo implements Serializable {
    /**
     * 模块
     */
    @NotNull(message = "模块不能为空")
    @ApiModelProperty(value = "模块",required = true)
    private String model;
    /**
     * 名称
     */
    @NotNull(message = "名称不能为空")
    @ApiModelProperty(value = "名称",required = true)
    private String name;
    /**
     * 页面地址
     */
    @NotNull(message = "页面地址不能为空")
    @ApiModelProperty(value = "页面地址",required = true)
    private String url;
    /**
     * 页面key
     */
    @NotNull(message = "页面key不能为空")
    @ApiModelProperty(value = "页面key",required = true)
    private String key;
    /**
     * 功能名称
     */
    @ApiModelProperty(value = "功能名称")
    private String funName;
    /**
     * 开始访问时间
     */
    @ApiModelProperty(value = "开始访问时间")
    @CopyProperty(ignored = true)
    private Long startTime;
    /**
     * 结束访问时间
     */
    @ApiModelProperty(value = "结束访问时间")
    @CopyProperty(ignored = true)
    private Long endTime;
    /**
     * 页面类型：1：原生， 2：H5， 3：功能
     */
    @ApiModelProperty(value = "页面类型")
    private Integer pageType;
    /**
     * 值
     */
    @ApiModelProperty(value = "值")
    private String val;
    /**
     * 用户Gid
     */
    @ApiModelProperty(value = "用户Gid")
    private String gid;
}
