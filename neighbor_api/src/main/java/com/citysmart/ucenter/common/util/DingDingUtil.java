//package com.citysmart.ucenter.common.util;
//
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONObject;
//import com.dingtalk.api.DefaultDingTalkClient;
//import com.dingtalk.api.DingTalkClient;
//import com.dingtalk.api.request.*;
//import com.dingtalk.api.response.*;
//import com.taobao.api.ApiException;
//import org.apache.commons.lang3.StringUtils;
//import org.apache.log4j.Logger;
//
//import java.util.List;
//
///**
// * @author li
// * @date 2020/4/1
// */
//public class DingDingUtil {
//    public static final Logger logger = Logger.getLogger(DingDingUtil.class);
//
//    public static final String APP_KEY = RedisUtil.getValueByKey("DDing_appkey");
//    public static final String APP_SECRETA = RedisUtil.getValueByKey("DDing_appsecreta");
//    public static final String ACCESS_TOKEN = "access_token";
//
//
//    /**
//     * 获取token
//     *
//     * @return
//     * @throws Exception
//     */
//    public static String getToken() throws Exception {
//        try {
//            String accessToken = RedisUtil.getValueByKey(ACCESS_TOKEN);
//            if (accessToken != null) {
//                return accessToken;
//            }
//            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/gettoken");
//            OapiGettokenRequest req = new OapiGettokenRequest();
//            req.setAppkey(APP_KEY);
//            req.setAppsecret(APP_SECRETA);
//            req.setHttpMethod("GET");
//            OapiGettokenResponse rsp = client.execute(req);
//            RedisUtil.setKeyValueByExpires(ACCESS_TOKEN, rsp.getAccessToken(), rsp.getExpiresIn().intValue());
//            return rsp.getAccessToken();
//        } catch (ApiException e) {
//            e.printStackTrace();
//            return e.getErrMsg();
//        }
//    }
//
//
//    /**
//     * 获取管理员列表
//     *
//     * @return
//     * @throws Exception
//     */
//    public static List getAdminList() throws Exception {
//        try {
//            String accessToken = getToken();
//            DingTalkClient clients = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/get_admin");
//            OapiUserGetAdminRequest requestss = new OapiUserGetAdminRequest();
//            requestss.setHttpMethod("GET");
//            OapiUserGetAdminResponse response = clients.execute(requestss, accessToken);
//            return response.getAdminList();
//        } catch (ApiException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//    /**
//     * 获取角色列表
//     *
//     * @return
//     * @throws Exception
//     */
//    public static List getRoleList() throws Exception {
//        try {
//            String accessToken = getToken();
//            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/role/list");
//            OapiRoleListRequest request = new OapiRoleListRequest();
//            request.setOffset(0L);
//            request.setSize(10L);
//            OapiRoleListResponse response = client.execute(request, accessToken);
//            return response.getResult().getList();
//        } catch (ApiException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//    /**
//     * 获取角色详情
//     *
//     * @param id 角色ID
//     * @return
//     * @throws Exception
//     */
//    public static OapiRoleGetroleResponse getRoleDetails(long id) throws Exception {
//        try {
//            String accessToken = getToken();
//            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/role/getrole");
//            OapiRoleGetroleRequest req = new OapiRoleGetroleRequest();
//            req.setRoleId(1001L);
//            OapiRoleGetroleResponse rsp = client.execute(req, accessToken);
//            return rsp;
//        } catch (ApiException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//    /**
//     * 获取角色下得员工列表
//     *
//     * @param roleId 角色ID
//     * @return response
//     * @throws Exception
//     */
//    public static OapiRoleSimplelistResponse getSimpleList(long roleId) throws Exception {
//        try {
//            String accessToken = getToken();
//            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/role/simplelist");
//            OapiRoleSimplelistRequest request = new OapiRoleSimplelistRequest();
//            request.setRoleId(roleId);
//            request.setOffset(0L);
//            request.setSize(10L);
//
//            OapiRoleSimplelistResponse response = client.execute(request, accessToken);
//            return response;
//        } catch (ApiException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//    /**
//     * 获取部门列表
//     *
//     * @param id 父部门id（如果不传，默认部门为根部门，根部门ID为1
//     *           fetchChild 是否递归部门的全部子部门，ISV微应用固定传递false
//     * @return
//     * @throws Exception
//     */
//    public static List getDepartmentList(String id, boolean fetchChild) throws Exception {
//        try {
//            String accessToken = getToken();
//            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/list");
//            OapiDepartmentListRequest request = new OapiDepartmentListRequest();
//            request.setId(id);
//            request.setFetchChild(fetchChild);
//            request.setHttpMethod("GET");
//            OapiDepartmentListResponse response = client.execute(request, accessToken);
//            return response.getDepartment();
//        } catch (ApiException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//    /**
//     * 获取部门详情
//     *
//     * @param id 部门ID
//     * @return response
//     * @throws Exception
//     */
//    public static OapiDepartmentGetResponse getDepartmentDetails(String id) throws Exception {
//        try {
//            String accessToken = getToken();
//            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/get");
//            OapiDepartmentGetRequest request = new OapiDepartmentGetRequest();
//            request.setId(id);
//            request.setHttpMethod("GET");
//            OapiDepartmentGetResponse response = client.execute(request, accessToken);
//            return response;
//        } catch (ApiException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//
//    /**
//     * 获取部门用户
//     *
//     * @param departmentId 用户id
//     * @return response
//     * @throws Exception
//     */
//    public static OapiUserSimplelistResponse getSimplelistUserDetails(long departmentId) throws Exception {
//        try {
//            String accessToken = getToken();
//            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/simplelist");
//            OapiUserSimplelistRequest request = new OapiUserSimplelistRequest();
//            request.setDepartmentId(departmentId);
//            request.setOffset(0L);
//            request.setSize(10L);
//            request.setHttpMethod("GET");
//            OapiUserSimplelistResponse response = client.execute(request, accessToken);
//            return response;
//        } catch (ApiException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//    /**
//     * 获取用户详情
//     *
//     * @param id 用户ID
//     * @return response
//     * @throws Exception
//     */
//    public static OapiUserGetResponse getUserDetails(String id) throws Exception {
//        try {
//            String accessToken = getToken();
//            DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/get");
//            OapiUserGetRequest request = new OapiUserGetRequest();
//            request.setUserid(id);
//            request.setHttpMethod("GET");
//            OapiUserGetResponse response = client.execute(request, accessToken);
//            return response;
//        } catch (ApiException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//}
