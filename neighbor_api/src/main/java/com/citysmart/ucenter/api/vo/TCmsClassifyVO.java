package com.citysmart.ucenter.api.vo;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;

/**
 * @author li
 * @date 2019/3/22
 */
@Setter
@Getter
public class TCmsClassifyVO extends BaseVo {
    private String title;
    private Integer id;
    private Integer pid;
    private String iconUrl;

    @Override
    public String toString() {
        return "TCmsClassifyVO{" +
                "title=" + title +
                ", id=" + id +
                ", pid=" + pid +
                ", iconUrl=" + iconUrl +
                "}";
    }

    public void setIconUrl(String iconUrl) {
        if(StringUtils.isBlank(iconUrl)){return;}
        this.iconUrl = ICON_PREFIX + iconUrl;
    }


}
