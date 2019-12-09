package com.citysmart.ucenter.module.sq_test;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.HttpClientUtil;
import com.citysmart.common.util.oauth2.SignUtil;
import com.citysmart.ucenter.common.Util.RedisUtil;
import com.citysmart.ucenter.module.oauth2.service.IOauthClientsService;
import com.citysmart.ucenter.mybatis.model.oauth2.OauthClients;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/sq")
public class SqController extends SuperController {
    public static final Logger logger = Logger.getLogger(SqController.class);
    public final static String OAUTH2_URL = RedisUtil.getValueByKey("oauth2.url");
    @Autowired
    public IOauthClientsService iOauthClientsService;



    @RequestMapping("/sq")
    public String sqH5(Model model) {
        String client_id=request.getParameter("clientId");
        if(StringUtils.isBlank(client_id)){
            model.addAttribute("msg","授权页面地址不存在或已删除");
            return "/base/error";
        }
        OauthClients oauthClients=iOauthClientsService.selectOne(
                new EntityWrapper<OauthClients>().eq("clientId",client_id));
        if(oauthClients==null){
            model.addAttribute("msg","授权应用不存在或已删除");
            return "/base/error";
        }
        String scope=oauthClients.getScope();
        if(scope.indexOf(",")>0){
            if(scope.indexOf("snsapi_userinfo")>0){
                scope="snsapi_userinfo";
            }else if(scope.indexOf("openApi")>0){
                scope="openApi";
            }else{
                scope="snsapi_base";
            }
        }

        StringBuffer oauth2_url=new StringBuffer(OAUTH2_URL);
        oauth2_url.append("/oauth/authorize");
        oauth2_url.append("?response_type=code");
        oauth2_url.append("&client_id=").append(client_id);
        oauth2_url.append("&redirect_uri=").append(oauthClients.getRegisteredRedirectUri());
        oauth2_url.append("&scope=").append(scope);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>result:"+oauth2_url.toString());
        model.addAttribute("oauth2_url",oauth2_url.toString());
        return "/oauth2/sqH5";
    }

    @RequestMapping("/getCode")
    public String getCode(Model model,String code){
        if(StringUtils.isBlank(code)){
            model.addAttribute("msg","code不能为空");
            return "/base/error";
        }
        //获取token
        try{
            Map<String, String> map =new HashMap(1);
            map.put("redirect_uri", "https://qxqtest.gxgov.net/m/sq/getCode");
            map.put("code",code);
            map.put("grant_type", "authorization_code");
            map.put("client_id", "01704038a299437486b7e4367ef772e1");
            map.put("client_secret", "ca0130a728264bf5af95aed2db460050");
            map.put("scope", "snsapi_userinfo");
            String url="https://qxqtest.gxgov.net/oauth-server/oauth/token";
            JSONObject jsonObject=JSONObject.parseObject(HttpClientUtil.doPost(url, map,"application/x-www-form-urlencoded"));
            if(jsonObject!=null){
                logger.error("token信息为："+jsonObject.toJSONString());
                String status=jsonObject.getString("status");
                if(StringUtils.isNotBlank(status)){
                    if("400".equals(status)){
                        model.addAttribute("msg",jsonObject.getString("msg"));
                    }else{
                        model.addAttribute("msg",jsonObject.getString("message"));
                    }
                    return "/base/error";
                }else{
                    String access_token=jsonObject.getString("access_token");
                    //获取用户信息
                    String getUserInfo="https://qxqtest.gxgov.net/oauth-server/openApi/user/v1/query";
                    Map<String, Object> map2 =new HashMap(1);
                    Map<String, Object> headerMap= getHeaderMap(map2,access_token,"01704038a299437486b7e4367ef772e1","ca0130a728264bf5af95aed2db460050");
                    JSONObject userJsonObject=JSONObject.parseObject(HttpClientUtil.doPost(getUserInfo, map2,headerMap,"application/x-www-form-urlencoded"));
                    logger.info("用户信息为："+userJsonObject.toJSONString());
                    Integer userInfoCode=userJsonObject.getInteger("code");
                    if(userInfoCode!=10000){
                        model.addAttribute("msg","获取用户信息错误："+userJsonObject.toJSONString());
                        return "/base/error";
                    }
                    String message=userJsonObject.getString("message");
                    userJsonObject= userJsonObject.getJSONObject("data");
                    String idCard=userJsonObject.getString("idCard");
                    String mobile=userJsonObject.getString("mobile");
                    String loginAccount=userJsonObject.getString("loginAccount");
                    String name=userJsonObject.getString("name");
                    model.addAttribute("msg","message:"+message+",用户信息为:loginAccount："+loginAccount+"-idCard:"+idCard+"-手机号码："+mobile+"-name："+name);
                    return "/base/error";
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
            logger.error("code换取token失败,错误提示：" + e.getMessage());
        }
        model.addAttribute("msg",code);
        return "/base/error";
    }



    @RequestMapping("/sqTest")
    public String sqTest() {
        return "/base/sqTest";
    }

    @RequestMapping("/getCodeTest")
    public String getCodeTest(Model model,String code){
        if(StringUtils.isBlank(code)){
            model.addAttribute("msg","code不能为空");
            return "/base/error";
        }
        //获取token
        try{

            Map<String, String> map =new HashMap(1);
            map.put("redirect_uri", "http://192.168.1.45:8083/m/sq/getCodeTest");
            map.put("code",code);
            map.put("grant_type", "authorization_code");
            map.put("client_id", "01704038a299437486b7e4367ef772e1");
            map.put("client_secret", "ca0130a728264bf5af95aed2db460050");
            map.put("scope", "snsapi_userinfo");
            String url= "http://192.168.1.45:8024/oauth-server/oauth/token";
            JSONObject jsonObject=JSONObject.parseObject(HttpClientUtil.doPost(url, map,"application/x-www-form-urlencoded"));
            if(jsonObject!=null){
                logger.error("token信息为："+jsonObject.toJSONString());
                String status=jsonObject.getString("status");
                if(StringUtils.isNotBlank(status)){
                    if("400".equals(status)){
                        model.addAttribute("msg",jsonObject.getString("msg"));
                    }else{
                        model.addAttribute("msg",jsonObject.getString("message"));
                    }
                    return "/base/error";
                }else{
                    String access_token=jsonObject.getString("access_token");
                    //获取用户信息
                    String getUserInfo="http://192.168.1.45:8024/oauth-server/openApi/user/v1/query";
                    Map<String, Object> map2 =new HashMap(1);
                    Map<String, Object> headerMap= getHeaderMap(map2,access_token,"01704038a299437486b7e4367ef772e1","ca0130a728264bf5af95aed2db460050");
                    JSONObject userJsonObject=JSONObject.parseObject(HttpClientUtil.doPost(getUserInfo, map2,headerMap,"application/x-www-form-urlencoded"));
                    logger.info("用户信息为："+userJsonObject.toJSONString());
                    Integer userInfoCode=userJsonObject.getInteger("code");
                    if(userInfoCode!=10000){
                        model.addAttribute("msg","获取用户信息错误："+userJsonObject.toJSONString());
                        return "/base/error";
                    }
                    String message=userJsonObject.getString("message");
                    userJsonObject= userJsonObject.getJSONObject("data");
                    String idCard=userJsonObject.getString("idCard");
                    String mobile=userJsonObject.getString("mobile");
                    String loginAccount=userJsonObject.getString("loginAccount");
                    String name=userJsonObject.getString("name");
                    model.addAttribute("msg","message:"+message+",用户信息为:loginAccount："+loginAccount+"-idCard:"+idCard+"-手机号码："+mobile+"-name："+name);
                    return "/base/error";
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
            logger.error("code换取token失败,错误提示：" + e.getMessage());
        }
        model.addAttribute("msg",code);
        return "/base/error";
    }


    private  Map<String ,Object> getHeaderMap( Map<String, Object> queryParamMap,String access_token,String clientId,String clientSecret)
            throws Exception {
        String time=String.valueOf(System.currentTimeMillis());
        Map<String, Object> headerMap =new HashMap(4);
        headerMap.put("Authorization","bearer "+access_token);
        headerMap.put("clientId",clientId);
        headerMap.put("time",time);
        String sign=sign(queryParamMap,clientId,clientSecret,time);
        headerMap.put("sign",sign);
        return  headerMap;
    }

    private String sign( Map<String, Object> queryParamMap,String clientId,String clientSecret,String time) throws Exception {
        Map<String ,String> parm=new HashMap<>();
        for (Map.Entry<String, Object> entry : queryParamMap.entrySet()) {
            parm.put(entry.getKey(), entry.getValue().toString());
        }
        if (parm.size() > 0) {
            parm.put("key", clientSecret);
        }
        Map<String ,String> parmSign=new HashMap<>();
        parmSign.put("client_id",clientId);
        parmSign.put("time",time);
        parmSign.put("queryParam",SignUtil.paramsAccsii(parm));
        return SignUtil.createSign(parmSign, clientSecret);
    }
}
