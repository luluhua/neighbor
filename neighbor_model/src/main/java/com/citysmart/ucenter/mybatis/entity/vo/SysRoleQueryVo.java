package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SysRoleQueryVo {
    private Integer id;
    private String name;
    private Integer deptId;
    private Integer roleState;
}
