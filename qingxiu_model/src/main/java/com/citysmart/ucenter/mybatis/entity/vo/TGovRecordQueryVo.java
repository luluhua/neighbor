package com.citysmart.ucenter.mybatis.entity.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@ApiModel
public class TGovRecordQueryVo {
    @ApiModelProperty(value = "用户id")
    private Integer apuId;
    @ApiModelProperty(value = "事项名称")
    private String projectTitle;
    @ApiModelProperty(value = "中间表id")
    private String addressId;

    private Integer status;

    private Integer deptId;

    private String daterange;

    private String aduitTime;

    private String apuName;

    private Integer userId;

    /**
     * 提交日期开始
     * */
    private String createTimeStart;

    /**
     * 提交日期结束
     * */
    private String createTimeEnd;

    /**
     * 审批日期开始
     * */
    private String aduitTimeStart;

    /**
     * 审批日期结束
     * */
    private String aduitTimeEnd;
}
