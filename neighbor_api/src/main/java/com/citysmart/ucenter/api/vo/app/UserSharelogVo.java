package com.citysmart.ucenter.api.vo.app;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;

@Getter
@Setter
public class UserSharelogVo {

    @NotNull(message="code不能为空")
    private String code;



}
