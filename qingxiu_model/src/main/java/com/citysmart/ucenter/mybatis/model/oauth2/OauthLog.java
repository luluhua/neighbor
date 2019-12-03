package com.citysmart.ucenter.mybatis.model.oauth2;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 授权日志
 * </p>
 *
 * @author zhouyanjian
 * @since 2019-09-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("oauth_log")
public class OauthLog extends Model<OauthLog> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 应用编号
     */
    @TableField("client_id")
    private String clientId;
    /**
     * 应用供应商
     */
    @TableField("client_provider")
    private String clientProvider;
    /**
     * 用户GID
     */
    private String gid;
    /**
     * 组件（模块/服务）简易授权（simple_code)
     */
    private String module;
    /**
     * 方法名
     */
    private String method;
    /**
     * 报文
     */
    private String message;
    /**
     * 参数
     */
    private String params;
    /**
     * 结果
     */
    private String result;
    /**
     * 请求ip
     */
    @TableField("from_ip")
    private String fromIp;
    /**
     * 是否成功：0否，1是
     */
    @TableField("is_success")
    private Integer isSuccess;
    /**
     * 创建日期
     */
    @TableField("dt_create")
    private Date dtCreate;
    /**
     * 是否删除 1:已删除 0：未删除
     */
    @TableField("is_deleted")
    private Integer isDeleted;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
