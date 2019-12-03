package com.citysmart.ucenter.mybatis.entity.vo;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class TAppUserSharelogVo {
    private String id;
    private String mobile;
    private String gid;
    private Date dtCreate;
    private Integer shareNum;
    private String shareCode;
    private Integer browseNum;
    private Integer dowloadNum;
    private Integer activationNum;
    private Integer isDeleted;

}
