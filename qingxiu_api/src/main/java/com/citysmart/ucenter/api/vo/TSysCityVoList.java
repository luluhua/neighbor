package com.citysmart.ucenter.api.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
@Setter
@Getter
public class TSysCityVoList {

    private Integer id;
    private String abbreviation;
    List<TSysCityVo> items;
}
