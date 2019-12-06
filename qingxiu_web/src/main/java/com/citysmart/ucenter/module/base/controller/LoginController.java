package com.citysmart.ucenter.module.base.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.json.JsonResult;
import com.citysmart.common.util.IpUtil;
import com.citysmart.common.util.PBKDF2Util;
import com.citysmart.common.util.TCaptchaVerifyUtil;
import com.citysmart.ucenter.common.util.PWDStrongUtil;
import com.citysmart.ucenter.common.util.RedisUtil;
import com.citysmart.ucenter.common.util.ShiroUtil;
import com.citysmart.ucenter.module.system.service.ITSysUserLogService;
import com.citysmart.ucenter.module.system.service.ITSysUserSecurityService;
import com.citysmart.ucenter.module.system.service.ITSysUserService;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import com.citysmart.ucenter.mybatis.model.TSysUserSecurity;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 登录控制器
 *
 * @author Gaojun.Zhou
 * @date 2016年12月14日 下午2:54:01
 */

@RequestMapping("/login")
@Controller
public class LoginController extends SuperController {
    /**
     * 日志服务
     */
    @Autowired
    private ITSysUserLogService sysLogService;

    @Autowired
    DefaultKaptcha defaultKaptcha;
    @Autowired
    private ITSysUserService userService;
    /**
     * 用户密码服务
     */
    @Autowired
    private ITSysUserSecurityService sysUserSecurityService;
    private final static String APP_ID = RedisUtil.getValueByKey("captcha.appid");
    private final static String APP_SECRET = RedisUtil.getValueByKey("captcha.app.secretkey");
    private static final String VERIFY_URI = RedisUtil.getValueByKey("captcha.verify.url");

    /**
     * 执行登录
     */

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(HttpServletRequest httpServletRequest, String userName, String password, String captcha,
                          String return_url, String ticket, String rand, RedirectAttributesModelMap model) {

        try {
            HttpServletRequest
                    request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String userIp = IpUtil.getIpAddr(request);
            if (TCaptchaVerifyUtil.verifyTicket(VERIFY_URI, APP_ID, APP_SECRET, ticket, rand, userIp) < 0) {
                model.addFlashAttribute("error", "验证码错误");
                return redirectTo("/login");
            }
            // 2. check username & password
            UsernamePasswordToken usernamePasswordToken = getUserPasswordToken(userName, password);
            if (usernamePasswordToken == null) {
                model.addFlashAttribute("error", "用户名或密码错误");
                return redirectTo("/login");
            }
            Subject currentUser = SecurityUtils.getSubject();
            if (!currentUser.isAuthenticated()) {
                try {
                    //1天-过期
//                    currentUser.getSession().setTimeout(60000);
                    currentUser.login(usernamePasswordToken);
                    ShiroUtil.getSessionUser();
                } catch (UnknownAccountException uae) {
                    model.addFlashAttribute("error", "用户名或密码错误");
                    sysLogService.insertLog("用户登录失败：未知用户", userName, IpUtil.getIpAddr(request), 1, 1);
                    return redirectTo("/login");
                } catch (IncorrectCredentialsException ice) {
                    model.addFlashAttribute("error", "用户名或密码错误");
                    sysLogService.insertLog("用户登录失败：用户名或密码错误", userName, IpUtil.getIpAddr(request), 1, 1);
                    return redirectTo("/login");
                } catch (LockedAccountException lae) {
                    model.addFlashAttribute("error", "用户登录失败：账号已锁定");
                    sysLogService.insertLog("用户登录失败：账号已锁定", userName, IpUtil.getIpAddr(request), 1, 1);
                    return redirectTo("/login");
                } catch (ExcessiveAttemptsException eae) {
                    model.addFlashAttribute("error", eae.getMessage());
                    sysLogService.insertLog(eae.getMessage(), userName, IpUtil.getIpAddr(request), 1, 1);
                    return redirectTo("/login");
                }
            }
            /**
             * 记录登录日志
             */
            sysLogService.insertLog("用户登录成功", userName, IpUtil.getIpAddr(request), 1, 1);
            return redirectTo("/index");

        } catch (Exception e) {
            e.printStackTrace();
            model.addFlashAttribute("error", "用户名或密码错误");
            sysLogService.insertLog("用户登录失败：" + e.getMessage(), userName, IpUtil.getIpAddr(request), 1, 1);
            return redirectTo("/login");
        }
    }

    /**
     * 验证用户名密码是否正确
     * 正确后返回封装shiro UsernamePasswordToken
     *
     * @param username
     * @param password
     * @return
     * @throws InvalidKeySpecException
     * @throws NoSuchAlgorithmException
     */
    private UsernamePasswordToken getUserPasswordToken(String username, String password) throws InvalidKeySpecException, NoSuchAlgorithmException {
        TSysUser sysUser = userService.selectOne(new EntityWrapper<TSysUser>().eq("username", username));
        if (sysUser == null) {
            return null;
        }
        TSysUserSecurity
                sysUserSecurity = sysUserSecurityService.selectOne(new EntityWrapper<TSysUserSecurity>().eq("user_id", sysUser.getId()));
        if (sysUserSecurity == null) {
            return null;
        }
        String hash = PBKDF2Util.createHash(password.toCharArray(), sysUserSecurity.getSalt());
        UsernamePasswordToken token = new UsernamePasswordToken(sysUser.getUsername(), PBKDF2Util.getHash(hash));
        return token;

    }

    /**
     * 忘记密码
     *
     * @param model
     */
    @RequestMapping(value = "/forgetPassword", method = RequestMethod.GET)
    public String getForgetPassword(Model model) {
        return "/forgetPassword";
    }

    /**
     * 忘记密码
     *
     * @param model
     */
    @RequestMapping(value = "/forgetPassword", method = RequestMethod.POST)
    public String postForgetPassword(String userName, String mobile, String verifCode, String password, Model model, RedirectAttributesModelMap model2) {
        if (StringUtils.isAnyBlank(mobile, userName, verifCode, password)) {
            model.addAttribute("error", "请求错误");
            return redirectTo("/login/forgetPassword");
        }
        if (PWDStrongUtil.pwdStrongModes(password) < 4) {
            model.addAttribute("error", "密码强度不足");
            return redirectTo("/login/forgetPassword");
        }
        //用户名查询，验证用户和手机是否绑定的
        TSysUser user = getUserNameAndMobile(userName, mobile);
        if (null == user) {
            model.addAttribute("error", "用户名或手机号不存在");
            return redirectTo("/login/forgetPassword");
        }

        //修改密码
        TSysUserSecurity sysUserSecurity = sysUserSecurityService
                .selectOne(new EntityWrapper<TSysUserSecurity>().eq("user_id", user.getId()));
        try {
            String hash = PBKDF2Util.createHash(password.toCharArray(), null);
            String salt = PBKDF2Util.getSalt(hash);
            String newPassword = PBKDF2Util.getHash(hash);
            sysUserSecurity.setPassword(newPassword);
            sysUserSecurity.setPassword2(newPassword);
            sysUserSecurity.setPassword3(newPassword);
            sysUserSecurity.setSalt(salt);
            sysUserSecurityService.update(sysUserSecurity, new EntityWrapper<TSysUserSecurity>().eq("user_id", user.getId()));
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "重置密码意外中断，请稍后重试");
            return redirectTo("/login/forgetPassword");
        }
        model2.addFlashAttribute("success", "修改密码成功");
        return redirectTo("/login");
    }

    /**
     * 忘记密码
     *
     * @param mobile
     */
    @RequestMapping(value = "/sendVerifCode", method = RequestMethod.POST)
    @ResponseBody
    public Rest postSendVerifCode(String mobile, String userName, String ticket, String rand) {
        if (StringUtils.isAnyBlank(mobile, userName, ticket, rand)) {
            return Rest.failure("滑块验证失败");
        }
        HttpServletRequest
                request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String userIp = IpUtil.getIpAddr(request);
        if (TCaptchaVerifyUtil.verifyTicket(VERIFY_URI, APP_ID, APP_SECRET, ticket, rand, userIp) < 0) {
            return Rest.failure("滑块验证失败");
        }
        //用户名查询，验证用户和手机是否绑定的
        if (!checkUserNameAndMobile(userName, mobile)) {
            return Rest.failure("用户名或手机号不存在");
        }
        //为该用户的手机号发送短信
        return Rest.ok();
    }

    /**
     * 验证用户和手机是否绑定的
     *
     * @param userName
     * @param mobile
     * @return
     */
    private boolean checkUserNameAndMobile(String userName, String mobile) {
        if (null == getUserNameAndMobile(userName, mobile)) {
            return false;
        }
        return true;
    }

    private TSysUser getUserNameAndMobile(String userName, String mobile) {
        EntityWrapper<TSysUser> ew = new EntityWrapper<TSysUser>();
        ew.eq("userName", userName);
        List<TSysUser> userList = userService.selectList(ew);
        if (userList == null || userList.isEmpty()) {
            return null;
        }
        TSysUser user = null;
        for (TSysUser e : userList) {
            if (StringUtils.equals(mobile, e.getMobile()) || StringUtils.equals(mobile, PWDStrongUtil.Decrypt3DEs(e.getMobile()))) {
                user = e;
            }
        }
        if (null == user) {
            return null;
        }
        return user;
    }

    /***
     * @Author liuguicheng
     * @Description //TODO 检测登录状态
     * @Date 11:31 2019/6/20
     * @return code 1 未登录 0已登录
     **/
    @ResponseBody
    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
    public Map<String, Object> checkLogin() {
        Map<String, Object> result = new HashMap<String, Object>(1);
        if (ShiroUtil.getSessionUser() == null) {
            result.put("code", 1);
        } else {
            result.put("code", 0);
        }
        return result;
    }

}