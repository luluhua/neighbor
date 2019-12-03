package com.citysmart.ucenter.api.vo;

import io.swagger.models.auth.In;
import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2019/3/25
 */
@Setter
@Getter
public class WzReplyVO {
    private String rpUser;
    private String rpDate;
    private String rpContent;
    private fileVO rpPics;

    @Override
    public String toString() {
        return "WzReplyVO{" +
                "rpUser=" + rpUser +
                ", rpDate=" + rpDate +
                ", rpContent=" + rpContent +
                ", rpPics=" + rpPics +
                "}";
    }
}
