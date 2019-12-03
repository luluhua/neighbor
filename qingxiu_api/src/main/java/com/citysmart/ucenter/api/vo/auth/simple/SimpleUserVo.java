package com.citysmart.ucenter.api.vo.auth.simple;

import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 简单处理的用户信息
 * </p>
 *
 * @author zhouyanjian
 * @date 2019/9/16 15:18
 */
@Getter
@Setter
public class SimpleUserVo {
    private String loginAccount;
    private String nickname;
    private String avatar;
    private Integer gender;
}
