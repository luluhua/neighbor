package com.citysmart.ucenter.module.sq_test;

import com.alibaba.fastjson.JSONObject;
import com.auth0.jwt.JWT;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.HttpClientUtil;
import com.citysmart.ucenter.common.Util.RedisUtil;
import com.citysmart.ucenter.module.oauth2.service.IOauthClientsService;
import com.citysmart.ucenter.mybatis.model.oauth2.OauthClients;
import org.apache.commons.lang3.StringUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * H5简易的code授权
 * </p>
 *
 * @author zhouyanjian
 * @date 2019/9/18 12:44
 */
@Controller
@RequestMapping("/code")
public class SimpleCodeController extends SuperController {

    @Autowired
    private IOauthClientsService iOauthClientsService;

    private void pintln(String title, HttpServletRequest request){
        Enumeration bodyNames = request.getParameterNames();
        StringBuilder bodyStr = new StringBuilder(title+" params:\n");
        while (bodyNames.hasMoreElements()) {
            String key = (String) bodyNames.nextElement();
            String value = request.getParameter(key);
            bodyStr.append(key).append(":").append(value).append("\n");
        }
        bodyStr.append("uri:").append(request.getRequestURI());
        logger.warn(bodyStr.toString());
    }

    /**
     * 获取token，判断是否是app中打开的
     *
     * @param model
     * @return
     */
    @RequestMapping("/sq")
    public String sqH5(Model model, HttpServletRequest request) {
        pintln("H5简易授权-->1.获取token:/sq", request);
        String redirectUri = request.getParameter("redirectUri");
        String clientId = request.getParameter("clientId");
        String state = request.getParameter("state");
        StringBuffer getCodeUrl = new StringBuffer();
        getCodeUrl.append("/m/code/get");
        getCodeUrl.append("?clientId=").append(clientId);
        getCodeUrl.append("&redirectUri=").append(urlDecoder(redirectUri));
        if(StringUtils.isNotBlank(state)){
            getCodeUrl.append("&state=").append(urlDecoder(state));
        }
        model.addAttribute("getCodeUrl", getCodeUrl.toString());
        // TODO 测试使用token 不传不起效
        String token = request.getParameter("token");
        model.addAttribute("isDemo", StringUtils.isNotBlank(token));
        model.addAttribute("token", token);
        return "/oauth2/sqCode";
    }

    /**
     * 获取code
     *
     * @param model
     * @return
     */
    @RequestMapping("/get")
    public String getH5(Model model, HttpServletRequest request) {
        pintln("H5简易授权-->2.获取code:/get", request);
        String redirectUri = request.getParameter("redirectUri");
        String clientId = request.getParameter("clientId");
        String state = request.getParameter("state");
        String token = request.getParameter("token");
        if (StringUtils.isAnyBlank(clientId, redirectUri, token)) {
            model.addAttribute("msg", "参数不全，不能进行授权");
            return "/base/error";
        }
        EntityWrapper<OauthClients> oauthClientsEntityWrapper = new EntityWrapper<>();
        oauthClientsEntityWrapper.eq("clientId", clientId);
        OauthClients oauthClients = iOauthClientsService.selectOne(oauthClientsEntityWrapper);
        if (oauthClients == null) {
            model.addAttribute("msg", "应用不存在或已删除，不能进行授权");
            return "/base/error";
        }
        //从token获取gid
        String gid = readCode(token, "gid");
        //请求api获取code

        String apiUrl = RedisUtil.getValueByKey("api.url") + "/auth/simple/v1/get_code";
        Map<String, String> params = new HashMap<>();
        params.put("gid", gid);
        params.put("clientId", clientId);
        String contentType = "application/x-www-form-urlencoded";
        JSONObject jsonObject = null;
        try {
            String responeStr = HttpClientUtil.doPostForm(apiUrl, params, contentType);
            jsonObject = JSONObject.parseObject(responeStr);
        } catch (Exception e) {
            logger.error("请求接口【{}】异常：{}", new Object[]{apiUrl, e.getMessage()});
        }
        int code = jsonObject.getIntValue("code");
        if (code > 0) {
            model.addAttribute("msg", jsonObject.getString("msg"));
            return "/base/error";
        }
        redirectUri = redirectUri + "?code=" + jsonObject.get("data");
        if(StringUtils.isNotBlank(state)){
            redirectUri = redirectUri + "&state=" + urlDecoder(state);
        }
        model.addAttribute("redirectUri", redirectUri);
        // TODO 测试使用 不传不起效
        String demo = request.getParameter("demo");
        model.addAttribute("isDemo", StringUtils.isNotBlank(demo));
        return "/oauth2/getCode";
    }

    /**
     * 打开认证界面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/open_real_page")
    public String openReal(Model model, HttpServletRequest request){
        pintln("H5简易授权-->3.要求打开认证界面:/open_real_page", request);
        return "/oauth2/openRealPage";
    }

    /**
     * 提示：请在手上青秀app打开链接
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/tips")
    public String tips(Model model, HttpServletRequest request){
        pintln("H5简易授权-->9.提示未知app中打开:/tips", request);
        return "/oauth2/tips";
    }

    public String readCode(String encodeCode, String key) {
        try {
            byte[] src = Base64.decodeBase64(encodeCode);
            DecodedJWT jwt = JWT.decode(new String(src));
            return jwt.getClaim(key).asString();
        } catch (JWTDecodeException e) {
            e.printStackTrace();
            return "";
        }
    }

    private String urlDecoder(String url){
        try {
            url = URLDecoder.decode(url, "utf-8");
        }catch (Exception e){
            e.printStackTrace();
        }
        return url;
    }
}
