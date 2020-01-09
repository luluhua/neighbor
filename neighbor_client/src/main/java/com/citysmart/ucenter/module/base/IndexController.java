package com.citysmart.ucenter.module.base;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页控制器
 *
 * @author Gaojun.Zhou
 * @ClassName: IndexController
 * @date 2016年12月8日 下午8:42:40
 */
@Controller
public class IndexController {


    @RequestMapping("/toMap")
    public String toMap(Model model) {
        return "/common/gdMap";
    }
}
