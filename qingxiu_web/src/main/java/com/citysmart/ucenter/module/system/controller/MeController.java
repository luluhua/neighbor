package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.PBKDF2Util;
import com.citysmart.ucenter.common.util.PWDStrongUtil;
import com.citysmart.ucenter.common.util.PatternUtil;
import com.citysmart.ucenter.common.util.ShiroUtil;
import com.citysmart.ucenter.module.system.service.*;
import com.citysmart.ucenter.mybatis.model.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

//import org.apache.shiro.SecurityUtils;
//import org.apache.shiro.subject.Subject;

/**
 * 用户中心控制器
 *
 * @author Gaojun.Zhou
 * @date 2016年12月16日 下午4:24:04
 */
@Controller
@RequestMapping("/system/me")
public class MeController extends SuperController {

    @Autowired
    private ITSysUserService sysUserService;
    @Autowired
    public ITSysUserSecurityService sysUserSecurityService;

    @Autowired
    private ISysUserRoleService sysUserRoleService;
    @Autowired
    private ISysRoleService sysRoleService;

    /**
     * 个人信息
     *
     * @param model
     * @return
     */
    @RequestMapping("/info")
    public String info(Model model) {
        TSysUser sysUser = sysUserService.selectById(ShiroUtil.getSessionUid());
        EntityWrapper<SysUserRole> roleUserEntityWrapper = new EntityWrapper<SysUserRole>();
        roleUserEntityWrapper.eq("userId", sysUser.getId());
        List<SysUserRole> mySysUserRoles = sysUserRoleService.selectList(roleUserEntityWrapper);
        String roleString = "";
        if (mySysUserRoles != null && mySysUserRoles.size() > 0) {
            for (SysUserRole roles : mySysUserRoles) {
                EntityWrapper<SysRole> roleEntityWrapper = new EntityWrapper<SysRole>();
                roleEntityWrapper.eq("id", roles.getRoleId());
                SysRole role = sysRoleService.selectOne(roleEntityWrapper);
                if (role != null) {
                    roleString += role.getName() + ",";
                }
            }
            if (roleString.length() > 0) {
                roleString = roleString.substring(0, roleString.length() - 1);
            }
        }
        model.addAttribute("sysUser", sysUser);
        model.addAttribute("sysRole", roleString);//角色信息
        model.addAttribute("mobile", PWDStrongUtil.Decrypt3DEs(sysUser.getMobile()));//手机号码
        model.addAttribute("realname", sysUser.getRealname());//真实姓名
        return "/system/me/info";
    }


    /**
     * 修改密码页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/pwd")
    public String pwd(Model model) {
        return "/system/me/pwd";
    }

    /**
     * 修改密码
     */
    @RequestMapping("/doChangePwd")
    public String doChangePwd(String password, String newpassword, String newpassword2, Model model,
                              RedirectAttributes redirectAttributes) {
        try {
            if (StringUtils.isBlank(password) || StringUtils.isBlank(newpassword) ||
                    StringUtils.isBlank(newpassword2)) {
                redirectAttributes.addFlashAttribute("msg", "旧密码及新密码不能为空.");
                return redirectTo("/system/me/pwd");
            }
            if (!PatternUtil.validatorPassword(newpassword)) {
                redirectAttributes.addFlashAttribute("msg", "密码必须由数字、字符、特殊字符(_、#、@)三种中的两种组成，且长度不能少于6个字符.");
                return redirectTo("/system/me/pwd");
            }
            Subject subject = SecurityUtils.getSubject();
            TSysUser sysUser = (TSysUser) subject.getPrincipal();
            //查询旧密码
            TSysUserSecurity sysUserSecurity = sysUserSecurityService
                    .selectOne(new EntityWrapper<TSysUserSecurity>().eq("user_id", sysUser.getId()));
            if (sysUserSecurity == null) {
                //未设置密码
                throw new LockedAccountException();
            }
            if (!PBKDF2Util.validatePassword(password, sysUserSecurity.getPassword(), sysUserSecurity.getSalt())) {
                redirectAttributes.addFlashAttribute("msg", "旧密码输入错误.");
                return redirectTo("/system/me/pwd");
            }

            if (!newpassword2.equals(newpassword)) {
                redirectAttributes.addFlashAttribute("msg", "两次输入的密码不一致.");
                return redirectTo("/system/me/pwd");
            }

            String hash = PBKDF2Util.createHash(newpassword.toCharArray(), null);
            String salt = PBKDF2Util.getSalt(hash);
            String newPassword = PBKDF2Util.getHash(hash);
            sysUserSecurity.setPassword(newPassword);
            sysUserSecurity.setPassword2(newPassword);
            sysUserSecurity.setPassword3(newPassword);
            sysUserSecurity.setSalt(salt);
            sysUserSecurityService
                    .update(sysUserSecurity, new EntityWrapper<TSysUserSecurity>().eq("user_id", sysUser.getId()));

            redirectAttributes.addFlashAttribute("info", "密码修改成功.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("info", "密码修改失败.");
        }
        return redirectTo("/system/me/pwd");
    }

    /**
     * 更新用户
     *
     * @param sysUser
     * @param model
     * @return
     */
    @RequestMapping("/updateUser")
    public String updateUser(TSysUser sysUser, Model model, RedirectAttributes redirectAttributes) {

        TSysUser user = sysUserService.selectById(sysUser.getId());
        if (StringUtils.isNotBlank(sysUser.getAvatarUrl())) {
            user.setAvatarUrl(sysUser.getAvatarUrl());
        }
        if (StringUtils.isNotBlank(sysUser.getNickname())) {
            user.setNickname(sysUser.getNickname());
        }
        sysUserService.updateById(user);
        model.addAttribute("sysUser", user);
        redirectAttributes.addFlashAttribute("info", "更新成功.");
        return redirectTo("/system/me/info");
    }
}
