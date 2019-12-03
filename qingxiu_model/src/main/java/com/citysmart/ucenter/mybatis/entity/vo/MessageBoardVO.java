package com.citysmart.ucenter.mybatis.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author li
 * @date 2019/5/10
 */
@Getter
@Setter
public class MessageBoardVO {
    private Integer id;
    private String title;
    private String content;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date dtCreate;
    private Integer replyState;
    private String url;

    @Override
    public String toString() {
        return "MessageBoardVO{" +
                "id=" + id +
                ", title=" + title +
                ", content=" + content +
                ", dtCreate=" + dtCreate +
                ", replyState=" + replyState +
                ", url=" + url +
                "}";
    }


}
