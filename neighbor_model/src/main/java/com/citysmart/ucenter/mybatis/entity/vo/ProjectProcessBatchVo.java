package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProjectProcessBatchVo {

    Integer serviceType;
    String projectIds;
    String processId;
    String downloadFileUrl;
    String httpurl;
}
