package com.citysmart.ucenter.api.vo.govcenter;

import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2019/3/23
 */
@Setter
@Getter
public class TCmsArticleDetailsVO {
    private String title;
    private String brief;
    private String pubTime;
    private String imgUrl;
    private String tags;
    private String articleContent;
    private String source;
    private String author;
    private Integer viewCount;
    private String articleBrief;

    @Override
    public String toString() {
        return "TCmsArticleDetailsVO{" +
                "title=" + title +
                ", brief=" + brief +
                ", pubTime=" + pubTime +
                ", imgUrl=" + imgUrl +
                ", tags=" + tags +
                ", articleContent=" + articleContent +
                ", source=" + source +
                ", author=" + author +
                ", viewCount=" + viewCount +
                ", articleBrief=" + articleBrief +
                "}";
    }
}
