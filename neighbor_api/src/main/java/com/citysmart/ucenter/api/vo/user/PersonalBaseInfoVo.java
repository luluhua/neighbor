package com.citysmart.ucenter.api.vo.user;

import com.citysmart.common.util.DcsjStringUtl;
import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class PersonalBaseInfoVo {

    private String gid;
    private String idCard;
    private String mobile;
    private String avatar;
    private Integer gender;
    private Integer authStatus;
    private Integer userType;
    private String username;
    private String nickname;
    private Integer accountType;//0 普通用户 1内部用户
    public PersonalBaseInfoVo() {
        super();
    }

    public PersonalBaseInfoVo(String gid, String idCard, String mobile,
                              String avatar, Integer gender, Integer authStatus,
                              Integer userType,String username,String nickname,Integer accountType) {
        this.gid=gid;

        this.idCard=DcsjStringUtl.toVoverString(idCard, DcsjStringUtl.PARM_TYPE_SFZ);
        this.mobile=DcsjStringUtl.toVoverString(mobile, DcsjStringUtl.PARM_TYPE_PHONE);
        this.avatar=avatar;
        this.gender=gender;
        this.authStatus=authStatus;
        this.userType=userType;
        this.username=username;
        this.nickname=nickname;
        this.accountType=accountType;

    }
}
