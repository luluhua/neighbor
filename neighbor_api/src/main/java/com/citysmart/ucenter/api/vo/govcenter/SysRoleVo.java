package com.citysmart.ucenter.api.vo.govcenter;

import com.citysmart.ucenter.mybatis.entity.vo.TOrgRoleVo;
import com.tuyang.beanutils.annotation.BeanCopySource;
import com.tuyang.beanutils.annotation.CopyProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@BeanCopySource(source = TOrgRoleVo.class)
public class SysRoleVo {
    private Integer id;
    private Integer orgId;
    private Integer roleId;
    @CopyProperty(property = "roleName")
    private String name;
    private String deptName;
}
