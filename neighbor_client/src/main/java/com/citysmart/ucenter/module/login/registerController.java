package com.citysmart.ucenter.module.login;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.IpUtil;
import com.citysmart.ucenter.common.Util.PWDStrongUtil;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import com.citysmart.ucenter.module.system.service.ITSysUserLogService;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUserSecurity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.citysmart.ucenter.mybatis.entity.vo.registreVO;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author li
 * @date 2019/12/9
 */
@Controller
public class registerController extends SuperController {

    @Autowired
    private ITLjUserService userService;

    @Autowired
    private ITSysUserLogService sysLogService;

    @RequestMapping("/register")
    @ResponseBody
    public Rest register(registreVO vo, Model model) {
        try {
            if (!vo.getPassword().equals(vo.getPassword1())) {
                return Rest.failure("两次密码输入不一致");
            }
            vo.setUsername(PWDStrongUtil.Encryption3DEs(vo.getUsername()));
            if (userService.selectOne(new EntityWrapper<TLjUser>().eq("username", vo.getUsername())) != null) {
                return Rest.failure("用户名已存在");
            }
            userService.insertUser(vo);
            sysLogService.insertLog("用户注册", vo.getUsername(), IpUtil.getIpAddr(request), 1, 1);
            return Rest.ok();
        } catch (DuplicateKeyException e) {
            return Rest.failure("用户名已存在");
        } catch (Exception e) {
            sysLogService.insertLog("用户注册失败", vo.getUsername(), IpUtil.getIpAddr(request), 1, 1);
            return Rest.failure("用户创建失败");

        }
    }
}
