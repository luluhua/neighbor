package com.citysmart.ucenter.api.vo.jcbs;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Getter
@Setter
@ApiModel
public class JcbsProjectRequestVo {

    /**
     * 街道、乡镇
     */
    public static final String TYPE_STREE = "0";
    /**
     * 社区、村委
     */
    public static final String TYPE_COMMUNITY = "1";
    /**
     * 主题
     */
    public static final String TYPE_THEME = "2";
    /**
     * 部门
     */
    public static final String TYPE_DEPT = "3";
    /**
     * 青秀区
     */
    public static final Integer CITY_QINGXIU = 2924;

//    @ApiModelProperty(value="街道、乡镇（与社区、村委二选一）",name="streeId")
//    private Integer streeId;
//    @ApiModelProperty(value="社区、村委（街道、乡镇二选一）",name="communityId")
//    private Integer communityId;
//    @ApiModelProperty(value="部门（主题二选一）",name="deptId")
//    private Integer deptId;
//    @ApiModelProperty(value="主题（部门二选一）",name="themeId")
//    private Integer themeId;


    @ApiModelProperty(value = "classifyType 0 街道、乡镇 1社区、村委 2 主题 3 部门", name = "classifyType", required = true)
    @NotNull(message = "classifyType为空")
    private String classifyType;


    @ApiModelProperty(value = "ID", name = "id", required = true)
    @NotNull(message = "ID为空")
    private Integer id;

    @ApiModelProperty(value = "纬度", name = "lat", required = false)
    private BigDecimal lat;

    @ApiModelProperty(value = "经度", name = "lng", required = false)
    private BigDecimal lng;
    @ApiModelProperty(value = "事项名称", name = "projectTitle")
    private String projectTitle;
    @ApiModelProperty(value = "页码")
    private Integer pageNumber;
    private Integer pageSize = 15;
}
