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
 * 附件上传配置
 * </p>
 *
 * @author ${author}
 * @since 2019-06-10
 */
@TableName("t_sys_attachment_config")
public class TSysAttachmentConfig extends Model<TSysAttachmentConfig> {

    private static final long serialVersionUID = 1L;
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 附件分类
     */
    private String classify;
    /**
     * 可上传的附件类型
     */
    @TableField("classify_type")
    private String classifyType;
    @TableField(value = "dt_create", fill = FieldFill.INSERT)
    private Date dtCreate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    public String getClassifyType() {
        return classifyType;
    }

    public void setClassifyType(String classifyType) {
        this.classifyType = classifyType;
    }

    public Date getDtCreate() {
        return dtCreate;
    }

    public void setDtCreate(Date dtCreate) {
        this.dtCreate = dtCreate;
    }


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "TSysAttachmentConfig{" +
                "classify=" + classify +
                ", classifyType=" + classifyType +
                ", dtCreate=" + dtCreate +
                "}";
    }
}
