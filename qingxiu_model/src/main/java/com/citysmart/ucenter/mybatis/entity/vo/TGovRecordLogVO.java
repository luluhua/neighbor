package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author li
 * @date 2019/5/5
 */
@Getter
@Setter
public class TGovRecordLogVO {
    private Integer id;
    private Integer userId;
    private String username;
    private String orgnmae;
    private Integer step;
    private String remark;
    private Date dtCreate;

    @Override
    public String toString() {
        return "TGovRecordLogVO{" +
                "id=" + id +
                ", userId=" + userId +
                ", username=" + username +
                ", orgnmae=" + username +
                ", username=" + orgnmae +
                ", step=" + step +
                ", remark=" + remark +
                ", dtCreate=" + dtCreate +
                "}";
    }
}
