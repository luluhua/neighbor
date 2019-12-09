package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * app用户所有上传或填写资料
 * */
@Getter
@Setter
public class FillInfoVO {
    private Integer id;

    private Integer userid;
    /**
     * 填写或上传内容，key-value形式，json格式
     */
    private String jsonStr;
    private String username;

    @Override
    public String toString() {
        return "FillInfoVO{" + "id=" + id + ", userid=" + userid + ", jsonStr='" + jsonStr + '\'' + ", username='" +
                username + '\'' + '}';
    }
}
