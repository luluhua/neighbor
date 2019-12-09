package com.citysmart.ucenter.module.base;

import com.citysmart.common.controller.SuperController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/authorizationtest")
public class AuthorizationTestController extends SuperController {

    /**
     * 獲取授權
     */
    @RequestMapping("/toAuthorization")
    public String toAuthorization(Model model) {

        return  "/authorizationtest/toAuthorization";
    }





    /**
     * 獲取授權
     */
    @RequestMapping("/getCode")
    public String getCode(@RequestParam(value = "code",required = false) String code, Model model, RedirectAttributes redirectAttributes) {
        if(StringUtils.isBlank(code)){
            redirectAttributes.addFlashAttribute("msg","code不能为空");
            return redirectTo("/common/errord");
        }
        model.addAttribute("code",code);
        return  "/authorizationtest/getToken";
    }
}
