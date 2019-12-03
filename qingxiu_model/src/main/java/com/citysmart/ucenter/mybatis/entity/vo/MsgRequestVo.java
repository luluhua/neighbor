package com.citysmart.ucenter.mybatis.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import jdk.nashorn.internal.ir.annotations.Ignore;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MsgRequestVo {

    @ApiModelProperty(value = "頁碼",required = true,dataType = "int")
    private Integer pageNumber;
    @Ignore
    private Integer pageSize;
    @Ignore
    private String gid;
}
