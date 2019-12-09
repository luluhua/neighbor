package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChannelUserVo {
    private Integer id;
    private Integer channelId;
    private String gid;
    private String shareCode;
    private Integer shareNum;
    private Integer browseNum;
    private Integer dowloadNum;
    private Integer activationNum;
}
