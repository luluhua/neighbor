package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
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
public class Area extends Model<Area> {

    private static final long serialVersionUID = 1L;

    @TableId("code_a")
    private String codeA;
    private String name;
    @TableField("code_c")
    private String codeC;

    public String getCodeA() {
        return codeA;
    }

    public void setCodeA(String codeA) {
        this.codeA = codeA;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCodeC() {
        return codeC;
    }

    public void setCodeC(String codeC) {
        this.codeC = codeC;
    }

    @Override
    protected Serializable pkVal() {
        return this.codeA;
    }

    @Override
    public String toString() {
        return "Area{" +
                "codeA=" + codeA +
                ", name=" + name +
                ", codeC=" + codeC +
                "}";
    }
}
