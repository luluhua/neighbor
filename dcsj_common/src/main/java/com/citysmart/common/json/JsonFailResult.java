package com.citysmart.common.json;

public class JsonFailResult extends JsonResult{
    public JsonFailResult() {

        super(1, FAIL, null);
    }

    public JsonFailResult(Object obj) {

        super(1, FAIL, obj);
    }

    public JsonFailResult(String msg, Object obj) {

        super(1, msg, obj);
    }

    public JsonFailResult(int ret, Object obj) {

        super(ret, FAIL, obj);
    }

    public JsonFailResult(int ret, String msg, Object obj) {

        super(ret, msg, obj);
    }

    public JsonFailResult(int ret, String msg) {
        super(ret, msg,"");
    }
    public JsonFailResult(String msg) {
        super(1, msg,"");
    }
}
