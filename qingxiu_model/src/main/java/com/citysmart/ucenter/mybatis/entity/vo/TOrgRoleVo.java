package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TOrgRoleVo {

    private Integer id;

    private Integer orgId;
    private Integer roleId;
    private String deptName;
    private String roleName;

}
