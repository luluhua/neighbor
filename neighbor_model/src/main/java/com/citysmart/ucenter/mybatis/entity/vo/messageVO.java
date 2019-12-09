package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author li
 * @date 2019/5/8
 */
@Getter
@Setter
public class messageVO {
    private Integer id;
    private String title;
    private String content;
    private String username;
    private Date dtCreate;
    private Date recoveryTime;
    private String recoveryContent;

    @Override
    public String toString() {
        return "messageVO{" +
                "id=" + id +
                ", title=" + title +
                ", content=" + content +
                ", username=" + username +
                ", dtCreate=" + dtCreate +
                ", recoveryTime=" + recoveryTime +
                ", recoveryContent=" + recoveryContent +
                "}";
    }


}
