package com.citysmart.ucenter.module.login;

import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.component.jwt.JWTUtil;
import com.citysmart.common.component.jwt.JwtToken;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.json.JsonResult;
import com.citysmart.common.util.IpUtil;
import com.citysmart.common.util.PBKDF2Util;
import com.citysmart.ucenter.common.HttpHelper;
import com.citysmart.ucenter.common.Util.*;
import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import com.citysmart.ucenter.module.system.service.ITLjUserSecurityService;
import com.citysmart.ucenter.module.system.service.ITSysUserLogService;
import com.citysmart.ucenter.module.system.service.ITSysUserSecurityService;
import com.citysmart.ucenter.mybatis.entity.vo.registreVO;
import com.citysmart.ucenter.mybatis.model.TSmsConfig;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUserSecurity;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.tuyang.beanutils.BeanCopyUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.apache.tomcat.util.codec.binary.Base64;
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
            return redirectTo(("/m/login".equals(header) || header == "") ? "/index" : "/login");
        } catch (Exception e) {
            e.printStackTrace();
            model.addFlashAttribute("error", "用户名或密码错误");
            sysLogService.insertLog("用户登录失败：" + e.getMessage(), userName, IpUtil.getIpAddr(request), 1, 1);
            return redirectTo("/login");
        }
    }


    private String createJwtToken(TLjUser user) throws Exception {
        //创建 jwt token
        Long time = Long.valueOf(RedisUtil.getValueByKey("jwt.expire.time"));
        Long refreshtime = Long.valueOf(RedisUtil.getValueByKey("jwt.refresh.time"));
        String token = JWTUtil.sign(user.getGuid(), user.getPassword(), time);
        Subject currentUser = SecurityUtils.getSubject();
        JwtToken jwtToken = new JwtToken(token);
        if (!currentUser.isAuthenticated()) {
            currentUser.login(jwtToken);
            //存入redis
//            RedisApiUtils.setApi(tAppUser.getUsername(), token, Integer.parseInt(time.toString()));
//            //获取过期时间及刷新时间
//            AppUserVo appUserVo = BeanCopyUtils.copyBean(tAppUser, AppUserVo.class);
//            byte[] src = Base64.decodeBase64(token);
//            DecodedJWT jwt = JWT.decode(new String(src));
//            appUserVo.setExpiresAtTime(jwt.getExpiresAt().getTime());
//            appUserVo.setRefreshTime(JwtUtil.getRefreshTime(jwt.getExpiresAt().getTime(), refreshtime));
//            appUserVo.setToken(token);
//            //绑定用户设备
//            bindingUserDevice(tAppUser);
            return redirectTo("/login");
        }
        return redirectTo("/login");
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

    /**
     * 登录发送短信
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/getLoginVerification")
    @ResponseBody
    public Rest getLoginVerification(Model model, HttpServletRequest request, String phone, String captcha) {
        if (userService.selectOne(new EntityWrapper<TLjUser>().eq("username", PWDStrongUtil.Encryption3DEs(phone))) == null) {
            return Rest.failure("手机号码未注册");
        }
        String rightCode = (String) request.getSession().getAttribute("rightCode");
        if (rightCode.equals(captcha)) {
            TSmsConfig config = sendsmsrUtil.getTSmsConfig();
            JsonResult result = sendsmsrUtil.sendMessageByHttp(config, phone, sendsmsrUtil.LOGIN_CODE);
            if (result.getCode() == 0) {
                return Rest.ok(result.getMsg());
            }
            return Rest.failure(result.getMsg());
        }
        return Rest.failure("图形验证码错误");
    }

}
