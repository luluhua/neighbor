package com.citysmart.ucenter.mybatis.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class MsgVo {
    private Integer id;
    private String title;
    private String content;
    private Integer state;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date time;
}
