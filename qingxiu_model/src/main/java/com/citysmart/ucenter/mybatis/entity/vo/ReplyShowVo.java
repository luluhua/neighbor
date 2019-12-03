package com.citysmart.ucenter.mybatis.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ReplyShowVo {
    @ApiModelProperty(value = "操作部门")
    private String processDept;

    @ApiModelProperty(value = "操作人")
    private String process;

    @ApiModelProperty(value = "操作内容")
    private String processText;

    @ApiModelProperty(value = "操作时间")
    private String processUpdate;
}
