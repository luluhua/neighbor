package com.citysmart.common.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WebGlVo {

    private String context;
    private String version;
    private String vendor;
    private String sl_version;
    private String max_texture_size;
    private String renderer;
    private int screen_height;
    private int screen_width;
    private String code;

}
