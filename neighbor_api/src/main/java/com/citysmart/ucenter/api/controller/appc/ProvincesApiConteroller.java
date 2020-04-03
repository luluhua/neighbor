package com.citysmart.ucenter.api.controller.appc;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.json.JsonResult;
import com.citysmart.common.json.JsonSuccessResult;
import com.citysmart.ucenter.api.vo.TSysCityLinkageVo;
import com.citysmart.ucenter.api.vo.TSysCityVo;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.common.util.RedisUtil;
import com.citysmart.ucenter.module.system.service.ISysCityService;
import com.citysmart.ucenter.mybatis.model.SysCity;
import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.*;
import com.dingtalk.api.response.*;
import com.taobao.api.ApiException;
import com.tuyang.beanutils.BeanCopyUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author li
 * @date 2019/3/18
 */
@Api(tags = "08、其他相关接口")
@RestController
@RequestMapping("/app/provinces")
public class ProvincesApiConteroller extends SuperController {

    private static final String QINGXIU_PACKAGE_KEY = "QINGXIU_PACKAGE_KEY";


    @Autowired
    public ISysCityService service;

    @Log("行政区域联动接口")
    @ApiImplicitParams(
            @ApiImplicitParam(name = "pid", value = "父级id", dataType = "Integer", paramType = "query", required = true, defaultValue = "0"))
    @ApiOperation("行政区域联动")
    @RequestMapping(value = "/provincelist", method = {RequestMethod.POST, RequestMethod.GET})
    public JsonResult provincelist(Integer pid) {
        EntityWrapper<SysCity> ew = new EntityWrapper<SysCity>();
        ew.eq("pid", pid);
        ew.eq("enabled", 1);
        ew.notIn("name", "市辖区");
        List<SysCity> provincelist = service.selectList(ew);
        return new JsonSuccessResult("成功", BeanCopyUtils.copyList(provincelist, TSysCityLinkageVo.class));
    }


    @ApiOperation("钉钉获取token")
    @RequestMapping(value = "/gettoken", method = {RequestMethod.POST, RequestMethod.GET})
    public JsonResult test() {
        try {
            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/gettoken");
            OapiGettokenRequest req = new OapiGettokenRequest();
            req.setAppkey("dingjsnipthyk15hqlsh");
            req.setAppsecret("gTCVR1tKhhXsh96MjwiebMIq5aeKQ6q7CeXP49kxnaCQJHxCOu_YYFwUV5InDxrd");
            req.setHttpMethod("GET");
            OapiGettokenResponse rsp = client.execute(req);
            RedisUtil.setKeyValueByExpires("access_token", rsp.getAccessToken(), rsp.getExpiresIn().intValue());
        } catch (ApiException e) {
            e.printStackTrace();
        }
        return new JsonSuccessResult("成功");
    }

    @ApiOperation("钉钉获取部门iddepartment")
    @RequestMapping(value = "/gedepartment", method = {RequestMethod.POST, RequestMethod.GET})
    public JsonResult gedepartment() {
        try {
            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/list_ids");
            OapiDepartmentListIdsRequest request = new OapiDepartmentListIdsRequest();
            request.setId("123");
            request.setHttpMethod("GET");
            String accessToken = RedisUtil.getValueByKey("access_token");
            if (accessToken != null) {
//                OapiDepartmentListIdsResponse response = client.execute(request, accessToken);

                DingTalkClient clients = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/get_admin");
                OapiUserGetAdminRequest requestss = new OapiUserGetAdminRequest();
                requestss.setHttpMethod("GET");

                OapiUserGetAdminResponse response = clients.execute(requestss, accessToken);


                DingTalkClient clientsss = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/get");
                OapiUserGetRequest requestaaa = new OapiUserGetRequest();
                requestaaa.setUserid(response.getAdminList().get(0).getUserid());
                requestaaa.setHttpMethod("GET");
                OapiUserGetResponse responseaaa = clientsss.execute(requestaaa, accessToken);

                return new JsonSuccessResult("成功", responseaaa);
            } else {
                DingTalkClient clients = new DefaultDingTalkClient("https://oapi.dingtalk.com/gettoken");
                OapiGettokenRequest req = new OapiGettokenRequest();
                req.setAppkey("dingjsnipthyk15hqlsh");
                req.setAppsecret("gTCVR1tKhhXsh96MjwiebMIq5aeKQ6q7CeXP49kxnaCQJHxCOu_YYFwUV5InDxrd");
                req.setHttpMethod("GET");
                OapiGettokenResponse rsp = clients.execute(req);
                RedisUtil.setKeyValueByExpires("access_token", rsp.getAccessToken(), rsp.getExpiresIn().intValue());
                OapiDepartmentListIdsResponse response = client.execute(request, rsp.getAccessToken());
                return new JsonSuccessResult("成功", response);
            }

        } catch (ApiException e) {
            e.printStackTrace();
        }
        return new JsonSuccessResult("成功", response);
    }

}
