package com.citysmart.ucenter.module.system.entity.vo;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;

@Setter
@Getter
public class OrgRoleEditVo {
    @NotNull(message = "部门不能为空")
    private Integer orgId;
    @NotNull(message = "角色不能为空")
    private Integer[] roleId;
}
