package com.citysmart.ucenter.module.appc.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2019/4/29
 */
@Setter
@Getter
public class dewnloadVO {
    private String filename;
    private String fileUrl;
    private Integer type;  //1 申请材料下载  2 审核材料下载

    @Override
    public String toString() {
        return "dewnloadVO{" +
                "filename=" + filename +
                ", fileUrl=" + fileUrl +
                ", type=" + type +
                "}";
    }
}
