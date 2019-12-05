package com.citysmart.ucenter.module.login;

import com.citysmart.common.controller.SuperController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author li
 * @date 2019/12/5
 */
@Controller
public class loginController extends SuperController {

    @RequestMapping("/login")
    public String show(Model model) {
        return "/wholesalestore/login";
    }
}
