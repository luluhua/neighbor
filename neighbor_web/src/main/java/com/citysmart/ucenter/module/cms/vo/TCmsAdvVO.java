package com.citysmart.ucenter.module.cms.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author li
 * @date 2019/4/15
 */
@Setter
@Getter
public class TCmsAdvVO {
    private String id;
    private Integer advposId;
    private String advTitle;
    private String advRemark;
    private String linkUrl;
    private String linkTarget;
    private Integer refType;
    private Integer advType;
    private Date dtStart;
    private Date dtEnd;
    private Integer status;
    private Integer sortIndex;
    private Date dtCreate;
    private Integer isDeleted;
    private String content;
    private String actionPage1;
    private String actionPage2;
    private String webContent;
    private String imgURL;

    @Override
    public String toString() {
        return "TCmsAdvVO{" +
                "id=" + id +
                ", advposId=" + advposId +
                ", advTitle=" + advTitle +
                ", linkUrl=" + linkUrl +
                ", linkTarget=" + linkTarget +
                ", refType=" + refType +
                ", advType=" + advType +
                ", dtStart=" + dtStart +
                ", dtEnd=" + dtEnd +
                ", status=" + status +
                ", sortIndex=" + sortIndex +
                ", dtCreate=" + dtCreate +
                ", isDeleted=" + isDeleted +
                ", content=" + content +
                ", actionPage1=" + actionPage1 +
                ", actionPage2=" + actionPage2 +
                ", webContent=" + webContent +
                ", imgURL=" + imgURL +
                "}";
    }

}
