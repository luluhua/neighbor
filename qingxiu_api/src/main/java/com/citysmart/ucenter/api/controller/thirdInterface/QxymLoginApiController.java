package com.citysmart.ucenter.api.controller.thirdInterface;

import com.alibaba.fastjson.JSONObject;
import com.citysmart.common.bean.HttpReposonVo;
import com.citysmart.common.json.JsonFailResult;
import com.citysmart.common.json.JsonResult;
import com.citysmart.common.json.JsonSuccessResult;
import com.citysmart.common.util.HttpClientUtil;
import com.citysmart.ucenter.common.anno.AppLogin;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.common.util.RedisUtil;
import com.citysmart.ucenter.common.util.ShiroUtil;
import com.citysmart.ucenter.common.util.qxyMD5;
import com.citysmart.ucenter.mybatis.model.TAppUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.http.cookie.Cookie;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author li
 * @date 2019/8/1
 */
@Api(tags = "08、其他相关接口")
@RestController
@RequestMapping("/yunmei")
public class QxymLoginApiController {

    private static final String YUNMIN_POST = "https://yun.longsunhd.com/api.php?ctl=qxuser&act=dologin";

    private static final String TRNANTID = "qxy";

    private static final String QXY_MD5_KEY = "longsun159456";

    @AppLogin
    @Log("青秀云媒登录接口")
    @ApiOperation(value = "青秀云媒登录接口")
    @RequestMapping(value = "/yunmei_login", method = {RequestMethod.POST})
    public JsonResult yunmin_login() {
        TAppUser appUser = ShiroUtil.getTAppUser();
        JSONObject jsonObject = new JSONObject();
        HttpReposonVo httpReposonVo = null;
        if (appUser != null) {
            String key1 = appUser.getUsername() + appUser.getId();
            String md5 = qxyMD5.getPhpMd5(key1.getBytes());
            String key2 = md5 + QXY_MD5_KEY;
            String token = qxyMD5.getPhpMd5(key2.getBytes());
            jsonObject.put("tenantid", TRNANTID);
            jsonObject.put("username", appUser.getUsername());
            jsonObject.put("member_id", appUser.getId());
            jsonObject.put("figureurl", RedisUtil.getValueByKey("http.img.url") + appUser.getAvatar());
            jsonObject.put("token", token);
            try {
                httpReposonVo = HttpClientUtil.postResponseCookieAndHeader(YUNMIN_POST, jsonObject);
                if (httpReposonVo != null) {
                    String responseString = httpReposonVo.getResponseString();
                    JSONObject jsonObjects = JSONObject.parseObject(responseString);
                    String r = jsonObjects.getString("result");
                    JSONObject jsonObjecte = JSONObject.parseObject(r);
                    String code = jsonObjecte.getString("errorCode");
                    String errorMessage = jsonObjecte.getString("errorMessage");
                    if (Integer.valueOf(code) == 1) {
                        Map<String, Object> map = new HashMap<>(16);
                        List<Cookie> cookieList=httpReposonVo.getCookies();
                        if(cookieList==null||cookieList.isEmpty()){
                            return new JsonFailResult("登录失败");
                        }
                        StringBuffer stringBuffer=new StringBuffer();
                        for(int i=0,j=cookieList.size();i<j;i++){
                            Cookie cookie=cookieList.get(i);
                            if("PHPSESSID".equals(cookie.getName())){
                                stringBuffer.append("PHPSESSID=").append(cookie.getValue()).append(";");
                            }
                            if("userid".equals(cookie.getName())){
                                stringBuffer.append("userid=").append(cookie.getValue()).append(";");
                            }
                            if("appid".equals(cookie.getName())){
                                stringBuffer.append("appid=").append(cookie.getValue()).append(";");
                            }
                            if("uhash".equals(cookie.getName())){
                                stringBuffer.append("uhash=").append(cookie.getValue()).append(";");
                            }

                        }
                        map.put("cookies",stringBuffer.toString());
//                        map.put("cookies", httpReposonVo.getCookies());
//                        map.put("headers", httpReposonVo.getHeaders());
                        return new JsonSuccessResult("成功", map);
                    } else {
                        return new JsonFailResult(errorMessage);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                return new JsonFailResult("接口异常");
            }
        }
        return new JsonFailResult(JsonResult.NO_LOGIN_CODE, "未登录");
    }

}
