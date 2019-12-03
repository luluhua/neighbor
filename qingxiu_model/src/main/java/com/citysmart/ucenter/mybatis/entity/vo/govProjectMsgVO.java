package com.citysmart.ucenter.mybatis.entity.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @author li
 * @date 2019/4/25
 */
@Setter
@Getter
public class govProjectMsgVO {
    private String msgContent;
    private String dtCreate;
    private String sender;
    private String msgid;
    private String recordId;

    @Override
    public String toString() {
        return "govProjectMsgVO{" +
                "msgContent=" + msgContent +
                ", dtCreate=" + dtCreate +
                ", sender=" + sender +
                ", msgid=" + msgid +
                ", recordId=" + recordId +
                "}";
    }
}
