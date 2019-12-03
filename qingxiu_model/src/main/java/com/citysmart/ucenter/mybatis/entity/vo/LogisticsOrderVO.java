package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LogisticsOrderVO {

    /**
     * 快递单号
     * */
    private String number;

    /**
     * 快递公司编码,一律用小写字母
     * */
    private String type;

    /**
     * 是否签收标记(1已签收)
     * */
    private Integer issign;

    /**
     * 快递单当前状态，快递单当前状态，0：快递收件(揽件)1.在途中 2.正在派件 3.已签收 4.派送失败 5.疑难件 6.退件签收
     * */
    private Integer deliverystatus;

    /**
     * 快递公司名称
     * */
    private String expName;

    /**
     * 快递公司网站
     * */
    private String expSite;

    /**
     * 快递公司咨询电话
     * */
    private String expPhone;

    /**
     * 快递员
     * */
    private String courier;

    /**
     * 快递员电话
     * */
    private String courierPhone;

}
