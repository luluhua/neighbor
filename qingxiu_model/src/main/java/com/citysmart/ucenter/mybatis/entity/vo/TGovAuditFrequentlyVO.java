package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2019/5/3
 */
@Getter
@Setter
public class TGovAuditFrequentlyVO {

    private String orgName;
    private String content;
    private Integer orgId;
    private Integer id;

    @Override
    public String toString() {
        return "TGovAuditFrequentlyVO{" +
                "orgName=" + orgName +
                ", content=" + content +
                ", orgId=" + orgId +
                ", id=" + id +
                "}";
    }
}
