package com.citysmart.common.bean;

import lombok.Getter;
import lombok.Setter;
import org.apache.http.Header;
import org.apache.http.cookie.Cookie;

import java.util.List;

@Getter
@Setter
public class HttpReposonVo {

    private String responseString;
    private List<Cookie> cookies;
    private Header[] headers;
}
