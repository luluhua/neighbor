package com.citysmart.ucenter.module.login;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.json.JsonResult;
import com.citysmart.common.util.IpUtil;
import com.citysmart.ucenter.common.Util.PWDStrongUtil;
import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import com.citysmart.ucenter.module.system.service.ITSysUserLogService;
import com.citysmart.ucenter.mybatis.model.TSmsConfig;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.citysmart.ucenter.mybatis.entity.vo.registreVO;
import org.springframework.web.bind.annotation.ResponseBody;
import com.citysmart.ucenter.common.Util.sendsmsrUtil;

import javax.servlet.http.HttpServletRequest;

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
            if (!sendsmsrUtil.verify(vo.getUsername(), vo.getPhoneCode(), sendsmsrUtil.REGISTER_CODE)) {
                return Rest.failure("短信验证码不正确");
            }
            userService.insertUser(vo);
            sysLogService.insertLog("用户注册", vo.getUsername(), IpUtil.getIpAddr(request), 1, 1);
            return Rest.okUrl("注册成功,马上跳转登录页", "/login");
        } catch (DuplicateKeyException e) {
            return Rest.failure("用户名已存在");
        } catch (Exception e) {
            sysLogService.insertLog("用户注册失败", vo.getUsername(), IpUtil.getIpAddr(request), 1, 1);
            return Rest.failure("用户创建失败");

        }
    }

    /**
     * 注册发送短信
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/getVerification")
    @ResponseBody
    public Rest getVerification(Model model, HttpServletRequest request, String phone, String captcha) {
        if (userService.selectOne(new EntityWrapper<TLjUser>().eq("username", PWDStrongUtil.Encryption3DEs(phone))) != null) {
            return Rest.failure("手机号码已注册");
        }
        String rightCode = (String) request.getSession().getAttribute("rightCode");
        if (rightCode.equals(captcha)) {
            TSmsConfig config = sendsmsrUtil.getTSmsConfig();
            JsonResult result = sendsmsrUtil.sendMessageByHttp(config, phone, sendsmsrUtil.REGISTER_CODE);
            if (result.getCode() == 0) {
                return Rest.ok(result.getMsg());
            }
            return Rest.failure(result.getMsg());
        }
        return Rest.failure("图形验证码错误");
    }
}
