package com.citysmart.ucenter.api.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Setter
@Getter
public class MapVo {

    @ApiModelProperty(value="纬度",name="lat",required = false)
    private BigDecimal lat;

    @ApiModelProperty(value="经度",name="lng",required = false)
    private  BigDecimal lng;
}
