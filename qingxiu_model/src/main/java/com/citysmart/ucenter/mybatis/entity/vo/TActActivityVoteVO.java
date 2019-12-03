package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author li
 * @date 2019/10/10
 */
@Getter
@Setter
public class TActActivityVoteVO {

    private Integer id;
    private Integer activityId;
    private String voteIp;
    private Integer userId;
    private String username;
    private Date dtVote;
}
