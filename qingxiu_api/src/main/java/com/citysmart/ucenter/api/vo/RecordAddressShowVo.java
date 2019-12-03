package com.citysmart.ucenter.api.vo;

import lombok.Data;

/**
 * @author lub
 * @description:
 * @date:14:11 2019/7/10
 */
@Data
public class RecordAddressShowVo {
    private Integer id;
    private Integer addressId;
    private String  contactName;
    private String  contactPhone;
    private String addressDetail;
    private Integer addressStatus = 0;
    private String  remark;
    private Integer isSelected = 0;
}
