package com.citysmart.ucenter.module.fwxy;

import com.citysmart.common.controller.SuperController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 服务协议
 */
@Controller
@RequestMapping("/fwxy")
public class FwxyController extends SuperController {

    @RequestMapping("/show")
    public String show(Model model) {
        return "fwxy/show";
    }
}
