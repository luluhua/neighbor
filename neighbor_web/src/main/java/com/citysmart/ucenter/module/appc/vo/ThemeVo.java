package com.citysmart.ucenter.module.appc.vo;

import lombok.Data;

@Data
public class ThemeVo {
    /**
     * 主题id
     */
    private Integer id;
    /**
     * 主题名称
     */
    private String themeTitle;
    /**
     * 是否选中
     */
    private Boolean isSelected = false;
}
