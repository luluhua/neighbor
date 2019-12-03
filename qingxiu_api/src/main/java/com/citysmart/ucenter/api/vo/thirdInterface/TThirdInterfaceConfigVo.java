package com.citysmart.ucenter.api.vo.thirdInterface;

import com.citysmart.ucenter.mybatis.model.TThirdInterfaceConfig;
import com.tuyang.beanutils.annotation.BeanCopySource;
import com.tuyang.beanutils.annotation.CopyProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@BeanCopySource(source = TThirdInterfaceConfig.class)
public class TThirdInterfaceConfigVo {
    private Integer id;
    @CopyProperty(property = "interfaceName")
    private String name;
    @CopyProperty(property = "interfaceCode")
    private String code;
}
