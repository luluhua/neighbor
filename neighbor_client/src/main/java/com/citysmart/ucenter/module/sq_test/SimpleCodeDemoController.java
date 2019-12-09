package com.citysmart.ucenter.module.sq_test;

import com.alibaba.fastjson.JSONObject;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.HttpClientUtil;
import com.citysmart.ucenter.common.Util.RedisUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * H5简易的code授权示例
 * </p>
 *
 * @author zhouyanjian
 * @date 2019/9/18 12:44
 */
@Controller
@RequestMapping("/demo_code")
public class SimpleCodeDemoController extends SuperController {

    private static Map<String, String> data = new HashMap<>();

    /**
     * 测试主页
     *
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model) {
        model.addAttribute("codeUri", data.get("codeUri"));
        model.addAttribute("redirectUri", data.get("redirectUri"));
        model.addAttribute("clientId", data.get("clientId"));
        model.addAttribute("state", data.get("state"));
        model.addAttribute("token", data.get("token"));
        return "/oauth2/demo/index";
    }

    /**
     * 测试主页
     *
     * @param model
     * @return
     */
    @RequestMapping("/getCode")
    public String getCode(Model model, HttpServletRequest request) {
        String redirectUri = request.getParameter("redirectUri");
        String clientId = request.getParameter("clientId");
        String token = request.getParameter("token");
        String state = request.getParameter("state");
        String codeUri = request.getParameter("codeUri");
        data.put("redirectUri", redirectUri);
        data.put("clientId", clientId);
        data.put("token", token);
        data.put("codeUri", codeUri);
        data.put("state", state);

        String getCodeUrl = codeUri + "?redirectUri=" + urlDecoder(redirectUri) +
                "&clientId=" + clientId;
        if(StringUtils.isNotBlank(state)){
            getCodeUrl = getCodeUrl + "&state=" + state;
        }
        if(StringUtils.isNotBlank(token)){
            getCodeUrl = getCodeUrl + "&token=" + token + "&demo=1";
        }
        model.addAttribute("getCodeUrl", getCodeUrl);

        return "/oauth2/demo/getCode";
    }

    /**
     * 接收code
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/accept", method = RequestMethod.GET)
    public String accept(Model model, HttpServletRequest request) {
        String code = request.getParameter("code");
        model.addAttribute("code", code);
        String state = request.getParameter("state");
        model.addAttribute("state", state);
        //调用授权中心的获取用户信息 oauth.server.url
        String apiUrl = RedisUtil.getValueByKey("oauth2.url") + "/simple_code/v1/user_info";
        Map<String, String> params = new HashMap<>();
        params.put("code", code);
        String contentType = "application/x-www-form-urlencoded";
        JSONObject jsonObject = null;
        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("clientId", data.get("clientId"));
        try {
            String responeStr = HttpClientUtil.doPostForm(apiUrl, params, headerMap, contentType);
            jsonObject = JSONObject.parseObject(responeStr);
        } catch (Exception e) {
            logger.error("请求接口【{}】异常：{}", new Object[]{apiUrl, e.getMessage()});
        }
        int row = jsonObject.getIntValue("code");
        if (row > 0) {
            model.addAttribute("msg", jsonObject.getString("message"));
            return "/base/error";
        }
        model.addAttribute("userInfo", jsonObject.get("data").toString());
        return "/oauth2/demo/accept";
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
