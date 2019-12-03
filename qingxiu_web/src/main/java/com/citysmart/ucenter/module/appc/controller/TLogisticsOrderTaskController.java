package com.citysmart.ucenter.module.appc.controller;

import com.alibaba.fastjson.JSONObject;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.HttpClientUtil;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.common.util.RedisUtil;
import com.citysmart.ucenter.mybatis.entity.vo.LogisticsOrderVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

/**
 * 物流订单轨迹节点信息
 * */
@Controller
@RequestMapping("/tLogisticsOrderTask")
public class TLogisticsOrderTaskController extends SuperController {

    /**
     * 实时查询
     * */
    @Log("物流实时查询")
    @RequestMapping("/actuallist")
    public String actuallist(String search, Model model) {
        if(search!=null&&search.trim().length()>0){
            model.addAttribute("search", search);
            try{
                //调用接口进行订单号实时查询
                //测试单号：780098068058
                String url = "http://wuliu.market.alicloudapi.com/kdi";
                Map<String, Object> header_map=new HashMap<>(1);
                String appcode=RedisUtil.getValueByKey("wuliu_appcode");
                if(appcode==null||appcode.trim().length()==0){
                    model.addAttribute("msg", "请先进入【系统配置】中，配置物流实时查询第三方接口appcode的信息");
                    return "/order/actuallist";
                }
                header_map.put("Authorization","APPCODE " + appcode);
                Map<String,Object> questMap=new HashMap<String,Object>(1);
                questMap.put("no",search);//物流订单单号
                String result="";
                result= HttpClientUtil.doGetAddHeader(url, questMap, header_map);
                if(result!=null){
                    Map<String, Object> data = JSONObject.parseObject(result);
                    if(data!=null&&data.get("status")!=null){
                        int status=Integer.valueOf(data.get("status").toString()).intValue();
                        if(status!=0){
                            String errorMsg="";
                            switch (status){
                                case 201:
                                    errorMsg="快递单号错误";
                                    break;
                                case 203:
                                    errorMsg="快递公司不存在";
                                    break;
                                case 204:
                                    errorMsg="快递公司识别失败";
                                    break;
                                case 205:
                                    errorMsg="没有信息";
                                    break;
                                case 207:
                                    errorMsg="该单号被限制，错误单号";
                                    break;
                                default:
                                    errorMsg="物流实时查询接口调用异常";
                                    break;
                            }
                            model.addAttribute("msg", errorMsg);
                        }else{
                            //查询正常，将查询结果记录在订单查询历史表中
                            Map<String, Object> resultData=JSONObject.parseObject(data.get("result").toString());
                            if(resultData!=null){
                                LogisticsOrderVO order=new LogisticsOrderVO();
                                //订单单号
                                order.setNumber(resultData.get("number").toString());
                                //物流公司编码
                                order.setType(resultData.get("type").toString());
                                //是否签收标记
                                order.setIssign(Integer.valueOf(resultData.get("issign").toString()));
                                //快递单当前状态
                                order.setDeliverystatus(Integer.valueOf(resultData.get("deliverystatus").toString()));
                                //快递公司名称
                                order.setExpName(resultData.get("expName").toString());
                                //快递公司网站
                                order.setExpSite(resultData.get("expSite").toString());
                                //快递公司咨询电话
                                order.setExpPhone(resultData.get("expPhone").toString());
                                //快递员
                                order.setCourier(resultData.get("courier").toString());
                                //快递员电话
                                order.setCourierPhone(resultData.get("courierPhone").toString());
                                model.addAttribute("order", order);
                                model.addAttribute("actualResult", result);
                            }
                        }
                    }
                }else {
                    model.addAttribute("msg", "物流第三方接口异常，请及时联系系统管理员进行处理！");
                }
            }
            catch (Exception e){
                e.printStackTrace();
                model.addAttribute("msg", "物流实时查询异常");
            }
        }
        return "/order/actuallist";
    }
}
