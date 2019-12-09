package com.citysmart.ucenter.mybatis.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Setter
@Getter
public class StatisticsVO {
    @ApiModelProperty(value = "参数")
    private String vo;
    @ApiModelProperty(value = "标题")
    private String title;
    @ApiModelProperty(value = "数量")
    private BigDecimal num;

    @Override
    public String toString() {
        return "StatisticsVO{" + "vo='" + vo + '\'' + ", title='" + title + '\'' + ", num=" + num + '}';
    }
}
