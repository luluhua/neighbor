package com.citysmart.common.bean;

/**
 * @author liuguicheng
 * @version 1.0
 * @Time：2019.03.09 下午1:29:08
 */
public class Rest {

    private long code = 0;

    private long count = 0;

    private Object data;

    private String msg;

    private String url;

    public long getCode() {
        return code;
    }

    public void setCode(long code) {
        this.code = code;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Rest() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Rest(long code, long count, Object data, String msg, String url) {
        super();
        this.code = code;
        this.count = count;
        this.data = data;
        this.msg = msg;
        this.url = url;
    }

    public static Rest ok() {
        return new Rest(200, 0, null, "","");
    }

    public static Rest ok(String msg) {
        return new Rest(200, 0, null, msg,"");
    }

    public static Rest okData(Object data) {
        return new Rest(200, 0, data, "ok","");
    }

    public static Rest failure(String msg) {
        // TODO Auto-generated method stub
        return new Rest(500, 0, null, msg,"");
    }

    public static Rest okUrl(String url) {
        return new Rest(200, 0, null, null, url);
    }

    ;
}
