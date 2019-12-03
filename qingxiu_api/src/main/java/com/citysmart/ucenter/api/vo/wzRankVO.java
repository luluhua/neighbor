package com.citysmart.ucenter.api.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @author li
 * @date 2019/4/16
 */
@Setter
@Getter
public class wzRankVO {
    private String groupName;
    private List list;

    @Override
    public String toString() {
        return "wzRankVO{" +
                "groupName=" + groupName +
                ", list=" + list +
                "}";
    }
}
