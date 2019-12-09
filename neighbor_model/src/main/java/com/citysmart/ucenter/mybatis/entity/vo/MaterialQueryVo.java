package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MaterialQueryVo {
    private Integer isMust;
    private Integer configSource;
    private Integer formId;
    private Integer recordId;

    public MaterialQueryVo(Integer isMust, Integer configSource, Integer formId, Integer recordId) {
        this.isMust = isMust;
        this.configSource = configSource;
        this.formId = formId;
        this.recordId = recordId;
    }
}
