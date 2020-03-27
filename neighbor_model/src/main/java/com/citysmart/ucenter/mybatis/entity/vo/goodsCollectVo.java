package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2020/3/26
 */
@Setter
@Getter
public class goodsCollectVo {
    private String id;
    private String goodsId;
    private String goodsName;
    private String goodsImages;
    private String location;
    private Integer status;
    private Integer isDeleted;
}
