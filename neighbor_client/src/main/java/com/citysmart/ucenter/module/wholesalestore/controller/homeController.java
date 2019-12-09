package com.citysmart.ucenter.module.wholesalestore.controller;

import com.citysmart.common.controller.SuperController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author li
 * @date 2019/12/5
 */
@Controller
@RequestMapping("/eec")
public class homeController extends SuperController {

    @RequestMapping("/index")
    public String show(Model model) {
        return "/wholesalestore/index";
    }
}
