package com.citysmart.ucenter.api.controller.appc;

import com.citysmart.common.json.JsonResult;
import com.citysmart.common.json.JsonSuccessResult;
import com.citysmart.ucenter.common.util.DingDingUtil;
import com.dingtalk.api.response.OapiAttendanceListRecordResponse;
import com.dingtalk.api.response.OapiUserGetDeptMemberResponse;
import com.dingtalk.api.response.OapiUserGetResponse;
import com.taobao.api.ApiException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author li
 * @date 2020/4/29
 */
@Api(tags = "05、钉钉测试接口")
@RestController
public class DingDindgTestController {


    @ApiOperation("删除token")
    @RequestMapping(value = "/DeleteToken", method = {RequestMethod.POST, RequestMethod.GET})
    public JsonResult DeleteToken() throws Exception {
        DingDingUtil.DeleteToken();
        return new JsonSuccessResult("成功");

    }


    @ApiOperation("获取角色列表")
    @RequestMapping(value = "/getRoleList", method = {RequestMethod.POST, RequestMethod.GET})
    public JsonResult getRoleList() throws Exception {
        try {
            List list = new ArrayList();
            List lsit = DingDingUtil.getDepartmentList(null, false);
            OapiUserGetDeptMemberResponse deptUuseID = DingDingUtil.getDeptUserIdList("289630584".toString());
            OapiAttendanceListRecordResponse details = DingDingUtil.getAttendanceList(deptUuseID.getUserIds());
            for (int i = 0; i < details.getRecordresult().size(); i++) {
                OapiUserGetResponse user = DingDingUtil.getUserDetails(details.getRecordresult().get(i).getUserId());
                Map<String, Object> map = new HashMap<>();
                map.put("userName", "用户名：" + user.getName());
                map.put("userAddress", "打卡地址：" + details.getRecordresult().get(i).getUserAddress());
                map.put("userCheckTime", "打卡时间：" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(details.getRecordresult().get(i).getUserCheckTime()));
                map.put("planId", "排班ID：" + details.getRecordresult().get(i).getPlanId());
                map.put("groupId", "考勤组ID：" + details.getRecordresult().get(i).getGroupId());
                list.add(map);
            }
            return new JsonSuccessResult("成功", list);
        } catch (ApiException e) {
            e.getErrMsg();
            return null;
        }
    }

    @ApiOperation("获取设备列表")
    @RequestMapping(value = "/equipmentList", method = {RequestMethod.POST, RequestMethod.GET})
    public JsonResult getEquipmentList() throws Exception {
        List list = DingDingUtil.getEquipmentList();
        return new JsonSuccessResult("成功", list);

    }

    public static String getCheckType(String checkType) {
        switch (checkType) {
            case "OnDuty":
                return "上班";
            case "OffDuty":
                return "下班";
            default:
                return "其他";
        }
    }

    public static String getTimeResult(String timeResult) {
        switch (timeResult) {
            case "Normal":
                return "正常";
            case "Early":
                return "早退";
            case "Late":
                return "迟到";
            case "SeriousLate":
                return "严重迟到";
            case "Absenteeism":
                return "旷工迟到";
            case "NotSigned":
                return "未打卡";
            default:
                return "其他";
        }
    }

    public static String getGroup(String statusText) {
        switch (statusText) {
            case "ATM":
                return "考勤机";
            case "DING_ATM":
                return "钉钉考勤机";
            case "USER":
                return "用户打卡";
            case "SYSTEM":
                return "考勤系统";

            case "BEACON":
                return "IBeacon";

            case "BOSS":
                return "老板改签";

            case "APPROVE":
                return "审批系统";
            case "AUTO_CHECK":
                return "自动打卡";
            default:
                return "其他";
        }
    }
}
