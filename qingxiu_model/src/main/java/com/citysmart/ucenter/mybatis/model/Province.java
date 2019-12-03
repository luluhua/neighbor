package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 该实体为行政区域划分等级
 * </p>
 *
 * @author lub
 * @since 2019-03-18
 */
public class Province extends Model<Province> {

    private static final long serialVersionUID = 1L;

    @TableId("code_p")
    private String codeP;
    private String name;


    public String getCodeP() {
        return codeP;
    }

    public void setCodeP(String codeP) {
        this.codeP = codeP;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    protected Serializable pkVal() {
        return this.codeP;
    }

    @Override
    public String toString() {
        return "Province{" +
        "codeP=" + codeP +
        ", name=" + name +
        "}";
    }
}
