package com.citysmart.ucenter.module.login;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.IpUtil;
import com.citysmart.common.util.PBKDF2Util;
import com.citysmart.ucenter.common.HttpHelper;
import com.citysmart.ucenter.common.Util.PWDStrongUtil;
import com.citysmart.ucenter.common.Util.ShiroUtil;
import com.citysmart.ucenter.common.Util.ShiroUtilWeb;
import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import com.citysmart.ucenter.module.system.service.ITLjUserSecurityService;
import com.citysmart.ucenter.module.system.service.ITSysUserLogService;
import com.citysmart.ucenter.module.system.service.ITSysUserSecurityService;
import com.citysmart.ucenter.mybatis.entity.vo.registreVO;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUserSecurity;
import com.google.code.kaptcha.impl.DefaultKaptcha;
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

/**
 * @author li
 * @date 2019/12/5
 */
@Controller
public class loginController extends SuperController {

    @Autowired
    DefaultKaptcha defaultKaptcha;

    /**
     * 日志服务
     */
    @Autowired
    private ITSysUserLogService sysLogService;
    @Autowired
    private ITLjUserService userService;
    @Autowired
    private ITLjUserSecurityService userSecurityService;


    @Autowired
    private ITSysUserSecurityService sysUserSecurityService;

    @RequestMapping("/login")
    public String show(Model model) {
        return "/wholesalestore/login";
    }


    /**
     * 执行登录
     */

    @RequestMapping(value = "/clientDoLogin", method = RequestMethod.POST)
    public String clientDoLogin(HttpServletRequest httpServletRequest, String userName, String password, String captcha, Integer isPasslogin,
                                String header, RedirectAttributesModelMap model) {

        try {
            HttpServletRequest
                    request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String userIp = IpUtil.getIpAddr(request);
            String rightCode = (String) httpServletRequest.getSession().getAttribute("rightCode");
            if (isPasslogin != 1) {
                if (rightCode.equals(captcha)) {
                    return redirectTo("/login");
                }
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
            return redirectTo(("/m/login".equals(header) || header == "") ? "/eec/index" : "/login");
        } catch (Exception e) {
            e.printStackTrace();
            model.addFlashAttribute("error", "用户名或密码错误");
            sysLogService.insertLog("用户登录失败：" + e.getMessage(), userName, IpUtil.getIpAddr(request), 1, 1);
            return redirectTo("/login");
        }
    }

    @RequestMapping("/logout")
    @ResponseBody
    public Rest register(Model model, HttpServletRequest request) {
        HttpServletRequest req = (HttpServletRequest) request;
        Subject currentUser = SecurityUtils.getSubject();
        currentUser.logout();
        return Rest.ok();
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
        TLjUser sysUser = userService.selectOne(new EntityWrapper<TLjUser>().eq("username", PWDStrongUtil.Encryption3DEs(username)));
        if (sysUser == null) {
            return null;
        }
        TLjUserSecurity
                UserSecurity = userSecurityService.selectOne(new EntityWrapper<TLjUserSecurity>().eq("user_id", sysUser.getId()));
        if (UserSecurity == null) {
            return null;
        }
        String hash = PBKDF2Util.createHash(password.toCharArray(), UserSecurity.getSalt());
        UsernamePasswordToken token = new UsernamePasswordToken(sysUser.getUsername(), PBKDF2Util.getHash(hash));
        return token;

    }

    /**
     * 验证码
     */
    @RequestMapping("/login/captcha")
    @ResponseBody
    public void defaultKaptcha(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
            throws Exception {
        byte[] captchaChallengeAsJpeg = null;
        ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
        try {
            // 生产验证码字符串并保存到session中
            String createText = defaultKaptcha.createText();
            httpServletRequest.getSession().setAttribute("rightCode", createText);
            // 使用生产的验证码字符串返回一个BufferedImage对象并转为byte写入到byte数组中
            BufferedImage challenge = defaultKaptcha.createImage(createText);
            ImageIO.write(challenge, "jpg", jpegOutputStream);
        } catch (IllegalArgumentException e) {
            httpServletResponse.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        // 定义response输出类型为image/jpeg类型，使用response输出流输出图片的byte数组
        captchaChallengeAsJpeg = jpegOutputStream.toByteArray();
        httpServletResponse.setHeader("Cache-Control", "no-store");
        httpServletResponse.setHeader("Pragma", "no-cache");
        httpServletResponse.setDateHeader("Expires", 0);
        httpServletResponse.setContentType("image/jpeg");
        ServletOutputStream responseOutputStream = httpServletResponse.getOutputStream();
        responseOutputStream.write(captchaChallengeAsJpeg);
        responseOutputStream.flush();
        responseOutputStream.close();
    }

}
