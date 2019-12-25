package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author li
 * @date 2019/12/25
 */
@Getter
@Setter
public class GoodsGradeVo {

    private String id;

    private String userName;

    private String userAvatar;

    private String explains;

    private Integer gradeType;

    private String files;

    private Date dtCreate;

    private Integer score;
}
