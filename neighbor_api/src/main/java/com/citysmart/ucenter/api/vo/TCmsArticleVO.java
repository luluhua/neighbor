package com.citysmart.ucenter.api.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2019/3/22
 */
@Setter
@Getter
public class TCmsArticleVO {
    private String id;
    private String title;
    private String brief;
    private String pubTime;
    private String imgUrl;
    private String tags;

    @Override
    public String toString() {
        return "TCmsArticleVO{" +
                "id=" + id +
                ", title=" + title +
                ", brief=" + brief +
                ", pubTime=" + pubTime +
                ", imgUrl=" + imgUrl +
                ", tags=" + tags +
                "}";
    }
}
