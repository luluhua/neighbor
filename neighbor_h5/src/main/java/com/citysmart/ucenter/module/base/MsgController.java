package com.citysmart.ucenter.module.base;

import com.citysmart.common.controller.SuperController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/msg")
public class MsgController extends SuperController {

    @RequestMapping(path = "/alert")
    public String alert() {
        return "/base/alertMsg";
    }
    @RequestMapping(path = "/alertDH")
    public String alertDH() {
        return "/base/alertMsg_dh";
    }
}
