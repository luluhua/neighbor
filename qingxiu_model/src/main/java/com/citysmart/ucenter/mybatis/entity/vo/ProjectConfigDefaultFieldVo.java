package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProjectConfigDefaultFieldVo {
    private Integer recordId;
    private String defaultValueTableId;
    private String defaultValueField;
    private Integer userId;
    private String defaultValue;
    private String defaultFieldType;
}
