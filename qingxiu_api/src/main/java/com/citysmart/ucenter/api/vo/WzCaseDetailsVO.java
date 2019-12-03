package com.citysmart.ucenter.api.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2019/3/26
 */
@Setter
@Getter
public class WzCaseDetailsVO {
    private Integer id;
    private String casenum;
    private String title;
    private String dep;
    private String content;
    private String username;
    private Integer viewCount;
    private String dtPromise;
    private String dtCreate;
    private String statusText;
    private WzReplyVO replylist;

    @Override
    public String toString() {
        return "WzCaseDetailsVO{" +
                "id=" + id +
                ", casenum=" + casenum +
                ", title=" + title +
                ", dep=" + dep +
                ", content=" + content +
                ", username=" + username +
                ", viewCount=" + viewCount +
                ", dtPromise=" + dtPromise +
                ", dtCreate=" + dtCreate +
                ", statusText=" + statusText +
                ", replylist=" + replylist +
                "}";
    }

}
