package com.citysmart.ucenter.module.wholesalestore.vo;

import com.citysmart.ucenter.mybatis.model.app.TLjUserAddress;
import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2019/12/25
 */
@Getter
@Setter
public class userVo {

    private String id;
    private String nickname;
    private String mobile;
    private String avatarUrl;
    private String email;
    private TLjUserAddress address;

}
