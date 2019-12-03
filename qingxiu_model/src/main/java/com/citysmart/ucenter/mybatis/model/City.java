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
public class City extends Model<City> {

    private static final long serialVersionUID = 1L;

    @TableId("code_c")
    private String codeC;
    private String name;
    @TableField("code_p")
    private String codeP;


    public String getCodeC() {
        return codeC;
    }

    public void setCodeC(String codeC) {
        this.codeC = codeC;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCodeP() {
        return codeP;
    }

    public void setCodeP(String codeP) {
        this.codeP = codeP;
    }

    @Override
    protected Serializable pkVal() {
        return this.codeC;
    }

    @Override
    public String toString() {
        return "City{" +
        "codeC=" + codeC +
        ", name=" + name +
        ", codeP=" + codeP +
        "}";
    }
}
