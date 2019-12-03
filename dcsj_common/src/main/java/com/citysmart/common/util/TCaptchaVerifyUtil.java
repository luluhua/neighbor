package com.citysmart.common.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.net.URLEncoder;

public class TCaptchaVerifyUtil {
    public static int verifyTicket(String verifyUrl, String appId, String appSecret,String ticket, String rand, String userIp) {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpGet httpGet;
        CloseableHttpResponse response = null;
        try {
            httpGet = new HttpGet(String.format(verifyUrl, appId, appSecret, URLEncoder.encode(ticket, "UTF-8"),
                                                URLEncoder.encode(rand, "UTF-8"), URLEncoder.encode(userIp, "UTF-8")));
            response = httpclient.execute(httpGet);

            HttpEntity entity = response.getEntity();
            if (entity != null) {
                String res = EntityUtils.toString(entity);

                JSONObject result = JSON.parseObject(res);
                // 返回码
                int code = result.getInteger("response");
                // 恶意等级
                int evilLevel = result.getInteger("evil_level");

                // 验证成功
                if (code == 1) {
                    return evilLevel;
                }
            }
        } catch (java.io.IOException e) {
            // 忽略
        } finally {
            try {
                response.close();
            } catch (Exception ignore) {

            }
        }
        return -1;
    }
}
