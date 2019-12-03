package com.citysmart.ucenter.api.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2019/3/25
 */
@Setter
@Getter
public class WzSummaryVO {

    private Integer latest;
    private Integer woking;
    private Integer replied;
    private Integer completed;

    @Override
    public String toString() {
        return "WzSummaryVO{" +
                "latest=" + latest +
                ", woking=" + woking +
                ", replied=" + replied +
                ", completed=" + completed +
                "}";
    }


}
