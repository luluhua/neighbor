package com.citysmart.common.json;

public class JsonSuccessResult extends JsonResult{
    public JsonSuccessResult() {

        super(0, SUCCESS, null);
    }

    public JsonSuccessResult(Object data) {

        super(0, SUCCESS, data);
    }

    public JsonSuccessResult(String msg, Object data) {

        super(0, msg, data);
    }

    public JsonSuccessResult(String msg) {

        super(0, msg, "");
    }
}
