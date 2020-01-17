package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;

/**
 * @author li
 * @date 2020/1/17
 */
@Setter
@Getter
public class dialogueVO {
    private Integer id;
    private String userAvatar = "";
    private String content;
    private String files;
    private String uset;
    private String userid;
    private Integer type;

}
