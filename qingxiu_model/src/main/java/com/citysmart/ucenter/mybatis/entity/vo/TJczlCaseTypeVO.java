package com.citysmart.ucenter.mybatis.entity.vo;


/**
 * @author li
 * @date 2019/5/13
 */

public class TJczlCaseTypeVO {
    private Integer id;
    private Integer deptId;
    private String cRemark;
    private String cName;
    private String deptName;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getcRemark() {
        return cRemark;
    }

    public void setcRemark(String cRemark) {
        this.cRemark = cRemark;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    @Override
    public String toString() {
        return "TJczlCaseTypeVO{" +
                "id=" + id +
                ", deptId=" + deptId +
                ", cRemark=" + cRemark +
                ", cName=" + cName +
                ", deptName=" + deptName +
                "}";
    }

}
