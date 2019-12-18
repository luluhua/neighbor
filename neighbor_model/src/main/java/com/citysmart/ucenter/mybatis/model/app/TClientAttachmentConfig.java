package com.citysmart.ucenter.mybatis.model.app;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author lub
 * @since 2019-12-18
 */
@TableName("t_client_attachment_config")
public class TClientAttachmentConfig extends Model<TClientAttachmentConfig> {

    private static final long serialVersionUID = 1L;

    private String classify;
    @TableField("classify_type")
    private String classifyType;
    @TableField("dt_create")
    private Date dtCreate;


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
        return null;
    }

    @Override
    public String toString() {
        return "TClientAttachmentConfig{" +
        "classify=" + classify +
        ", classifyType=" + classifyType +
        ", dtCreate=" + dtCreate +
        "}";
    }
}
