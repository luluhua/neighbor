package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class GovConsultVO {
    private Integer id;

    private Integer projectId;

    /**
     * 所属部门名（逻辑字段）
     */
    private String orgName;



    private Integer serviceType;
    /**
     * 咨询主题
     */
    private String themeName;
    /**
     * 咨询标题
     */
    private String title;
    /**
     * 咨询内容
     */
    private String content;
    /**
     * 咨询用户id
     */
    private Integer userid;
    /**
     * 咨询用户(手机用户昵称)
     */
    private String userName;
    /**
     * 咨询状态 0 未回复 1 已回复 2 提问(已回复)
     */
    private Integer consultStatus;
    /**
     * 手机用户绑定的手机号码
     * */
    private String userMobile;
    /**
     * 咨询时间
     * */
    private Date dtCreate;
    /**
     * 更新时间(注册用户有提交时更新)
     * add zhouyanjian 2019 09 03
     */
    private Date dtUpdate;

    /**
     * 回复时间(管理用户有提交时更新)
     * add zhouyanjian 2019 09 03
     */
    private Date dtReply;

    /**
     * 是否置顶：0否，1是（结果由consult_status的值判断是否置顶）
     * add zhouyanjian 2019 09 03
     */
    private Integer isTop;



    /**
     * 所属部门ID（逻辑字段） -1是其他部门，0基层部门，反之其他都是行政部门
     * add zhouyanjian 2019 09 03
     */
    private String orgId;
    /**
     * 列表查询关键字
     * add zhouyanjian 2019 09 03
     */
    private String search;
    /**
     * 列表查询时间段
     * add zhouyanjian 2019 09 03
     */
    private String daterange;

    /**
     * 1未回复，2已回复
     * add zhouyanjian 2019 09 03
     */
    private String status;

    /**
     * 是否置顶的业务逻辑
     * add zhouyanjian 2019 09 03
     * @return
     */
    public Integer getIsTop(){
        if(consultStatus != null){
            if(consultStatus.intValue() == 0 || consultStatus.intValue() == 2){
                isTop = 1;
            }else{
                isTop = 0;
            }
        }
        return isTop;
    }

    /**
     * 咨询时间开始
     * */
    private String updateTimeStart;

    /**
     * 咨询时间结束
     * */
    private String updateTimeEnd;
}
