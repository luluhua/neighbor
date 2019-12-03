package com.citysmart.ucenter.api.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2019/3/22
 */
@Setter
@Getter
public class TCmsAdvVO {

    private String title;
    private String imgUrl;
    private Integer action;
    private String androidAction;
    private String iosAction;
    private String actionParam;
    private String webContent;

    @Override
    public String toString() {
        return "TCmsAdvVO{" +
                "title=" + title +
                ", action=" + action +
                ", androidAction=" + androidAction +
                ", iosAction=" + iosAction +
                ", webContent=" + webContent +
                "}";
    }

}
