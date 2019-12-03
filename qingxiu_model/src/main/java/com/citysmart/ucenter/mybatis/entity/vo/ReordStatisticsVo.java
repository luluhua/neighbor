package com.citysmart.ucenter.mybatis.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2019/4/23
 */
@Setter
@Getter
public class ReordStatisticsVo {

    @ApiModelProperty(value = "待受理")
    private Integer awaitDispose;

    @ApiModelProperty(value = "审批中")
    private Integer inReview;

    @ApiModelProperty(value = "已完结")
    private Integer awaitSend;

    @ApiModelProperty(value = "未通过")
    private Integer awaitMake;

}
