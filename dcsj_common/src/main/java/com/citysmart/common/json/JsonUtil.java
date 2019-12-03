package com.citysmart.common.json;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;

import java.util.Map;

public class JsonUtil {

    /**
     * json 转map
     * @return
     */
    public static Map<String, Object> json2map(String str_json) {
        Map<String, Object> res = null;
        try {
            Gson gson = new Gson();
            res = gson.fromJson(str_json, new TypeToken<Map<String, Object>>() {
            }.getType());
        } catch (JsonSyntaxException e) {
        }
        return res;
    }
}
