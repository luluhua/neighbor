package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * 通用统计实体
 * */
@Getter
@Setter
public class EPublicVo {
    /**
     * 标题
     * */
    private String title;
    /**
     * 数量
     * */
    private Double num;
    /**
     * 其他数量
     * */
    private Double othernum;
    /**
     * 时间
     * */
    private String sj;
    /**
     * 总数
     * */
    private Double totalnum;
    /**
     * 其他数量1
     * */
    private Double othernum1;
}
