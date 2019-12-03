package com.citysmart.common.json;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class JsonResult {
    private class NullObj {

    }
    public static final int NO_LOGIN_CODE = 110201;
    public static final String SUCCESS = "成功";

    public static final String FAIL = "失败";

    private int code = 0;
    /**
     * 信息
     */
    private String msg = SUCCESS;

    private Object data = new NullObj();

    public JsonResult(int code, String msg, Object data) {

        this.code = code;
        if (msg != null) {
            this.msg = msg;
        }
        if (data != null) {
            this.data = data;
        }
    }
}
