package com.citysmart.ucenter.module.showwheel;

import com.citysmart.common.controller.SuperController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 显示轮播内容
 * */
@Controller
@RequestMapping("/showwheel")
public class ShowWheelController extends SuperController {
    @RequestMapping("/index")
    public String show(Model model){
        return "/showwheel/index";
    }
}
