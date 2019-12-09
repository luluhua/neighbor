package com.citysmart.ucenter.api.vo.app;

import com.citysmart.ucenter.common.anno.Log;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ShareQRcodeVo {
    private String qrCodeUrl;
    private Integer x;
    private Integer y;
    private Integer w;
    private Integer h;
    private String bgUrl;


}
