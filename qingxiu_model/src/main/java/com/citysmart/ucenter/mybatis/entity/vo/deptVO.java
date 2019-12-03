package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;


/**
 * @author li
 * @date 2019/5/9
 */
@Getter
@Setter
public class deptVO {
    private Integer deptid;
    private String deptname;

    @Override
    public String toString() {
        return "deptVO{" +
                "deptid=" + deptid +
                ", deptname=" + deptname +
                "}";
    }

}
