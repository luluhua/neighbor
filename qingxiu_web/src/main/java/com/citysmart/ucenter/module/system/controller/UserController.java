package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.PBKDF2Util;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.common.util.PWDStrongUtil;
import com.citysmart.ucenter.common.util.PatternUtil;
import com.citysmart.ucenter.module.system.service.*;
import com.citysmart.ucenter.mybatis.entity.vo.SysRoleQueryVo;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.*;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

//import org.apache.shiro.authz.annotation.RequiresPermissions;

/**
 * 用户控制器
 *
 * @author Gaojun.Zhou
 * @date 2016年12月13日 上午10:22:41
 */
@Controller
@RequestMapping("/system/user")
public class UserController extends SuperController {
    @Autowired
    public ITSysUserService sysUserService;
    @Autowired
    private ISysRoleService sysRoleService;
    @Autowired
    private ISysUserRoleService sysUserRoleService;
    @Autowired
    public ISysCityService iSysCityService;
    @Autowired
    private ITSysUserSecurityService sysUserSecurityService;

    /**
     * 分页查询用户
     */
    @RequiresPermissions("listUser")
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize,
                       String search, Model model, Integer deptId) {
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
        }
        if (deptId != null) {
            model.addAttribute("deptId", deptId);
        }
        if (PatternUtil.isMobile(search)) {
            search = PWDStrongUtil.Encryption3DEs(search);
        }
        Page<Map<Object, Object>> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        Page<Map<Object, Object>> pageData = sysUserService.selectUserPage(page, search, deptId);
        model.addAttribute("pageData", pageData);
        return "/system/user/list";
    }

    /**
     * 新增用户
     */
    @RequiresPermissions("addUser")
    @RequestMapping("/add")
    public String add(Model model) {

        return "/system/user/add";
    }

    /**
     * 执行新增
     */
    @Log("创建用户")
    @RequiresPermissions("addUser")
    @RequestMapping("/doAdd")
    @ResponseBody
    public Rest doAdd(TSysUser user, @RequestParam(value = "roleId[]", required = false) Integer[] roleId) {
        try {
            user.setMobile(PWDStrongUtil.Encryption3DEs(user.getMobile()));
            sysUserService.insertUser(user, roleId);
            return Rest.ok();
        } catch (DuplicateKeyException e) {
            return Rest.failure("用户名已存在");
        } catch (Exception e) {
            return Rest.failure("用户创建失败");
        }
    }

    /**
     * 删除用户
     */
    @Log("删除用户")
    @RequiresPermissions("deleteUser")
    @RequestMapping("/delete")
    @ResponseBody
    public Rest delete(Integer id) {
        //删除密码记录
        EntityWrapper<TSysUserSecurity> ew = new EntityWrapper<TSysUserSecurity>();
        ew.eq("user_id", id);
        sysUserSecurityService.delete(ew);
        //删除用户
        sysUserService.delete(id);
        return Rest.ok();
    }

    /**
     * 编辑用户
     */
    @RequestMapping("/edit/{id}")
    @RequiresPermissions("editUser")
    public String edit(@PathVariable Integer id, Model model) {
        Page<SysRole> page = getPage(1, 200);
        TSysUser sysUser = sysUserService.selectById(id);
        SysRoleQueryVo vo = new SysRoleQueryVo();
        vo.setDeptId(sysUser.getDeptId());
        List<SysRole> sysRoles = sysRoleService.selectListByVo(page, vo).getRecords();
        EntityWrapper<SysUserRole> ew = new EntityWrapper<SysUserRole>();
        ew.eq("userId ", id);
        List<SysUserRole> mySysUserRoles = sysUserRoleService.selectList(ew);
        List<String> myRolds = Lists.transform(mySysUserRoles, input -> String.valueOf(input.getRoleId()));

        model.addAttribute("sysUser", sysUser);
        model.addAttribute("sysRoles", sysRoles);
        model.addAttribute("myRolds", myRolds);
        return "/system/user/edit";
    }

    /**
     * 执行编辑
     */
    @Log("编辑用户")
    @RequiresPermissions("editUser")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(TSysUser sysUser, @RequestParam(value = "roleId[]", required = false) Integer[] roleId,
                       Model model) {
        sysUser.setMobile(PWDStrongUtil.Encryption3DEs(sysUser.getMobile()));
        sysUserService.updateUser(sysUser, roleId);
        return Rest.ok();
    }


    /**
     * 禁用/启用
     */
    @Log("编辑用户状态")
    @RequiresPermissions("editUser")
    @RequestMapping("/updateStatus")
    @ResponseBody
    public Rest updateStatus(Integer id, Integer status) {
        EntityWrapper<TSysUser> ew = new EntityWrapper<TSysUser>();
        ew.eq("id", id);
        TSysUser sysUser = new TSysUser();
        sysUser.setStatus(status);
        boolean row = sysUserService.update(sysUser, ew);
        if (!row) {
            return Rest.failure("操作异常");
        }
        return Rest.ok();
    }


    /**
     * 跳转设置密码页面
     */
    @RequestMapping("/toSettingPsd/{id}")
    @RequiresPermissions("editUser")
    public String toSettingPsd(@PathVariable Integer id, Model model) {
        TSysUser sysUser = sysUserService.selectById(id);
        model.addAttribute("sysUser", sysUser);
        return "/system/user/settingPsd";
    }

    @Log("重置用户密码")
    @RequiresPermissions("editUser")
    @RequestMapping("/reSettingPsd/{id}")
    @ResponseBody
    public Rest reSettingPsd(@PathVariable Integer id) {
        TSysUser user = this.sysUserService.selectById(id);
        if (user == null) {
            return Rest.failure("操作异常");
        }

        //查询用户密码记录
        EntityWrapper<TSysUserSecurity> ew = new EntityWrapper<TSysUserSecurity>();
        ew.eq("user_id", id);
        TSysUserSecurity sysUserSecurity = sysUserSecurityService.selectOne(ew);
        //不存在，则添加新（正常情况不可能不存在）
        if (sysUserSecurity == null) {
            sysUserSecurity = new TSysUserSecurity();
            sysUserSecurity.setUserId(id);
        }
        // 20190618 add zyj 按密码规则生成随机的8位密码
        String newPawd = getNewPwd();
        try {
            String hash = PBKDF2Util.createHash(newPawd.toCharArray(), null);
            String salt = PBKDF2Util.getSalt(hash);
            String password = PBKDF2Util.getHash(hash);
            sysUserSecurity.setPassword(password);
            sysUserSecurity.setPassword2(password);
            sysUserSecurity.setPassword3(password);
            sysUserSecurity.setSalt(salt);
            boolean row = sysUserSecurityService.update(sysUserSecurity, ew);
            if (!row) {
                return Rest.failure("操作异常");
            }
            // 20190618 add zyj
            String mssage = "您的手上青秀后台管理登录密码已经重置为： ******* ";
            // TODO 发送短信
            Map<String, String> data = new HashMap<>();
            data.put("name", user.getRealname());
            data.put("mobile", PWDStrongUtil.Decrypt3DEs(user.getMobile()));
            data.put("pwd", newPawd);
            //返回手机号、姓名和新密码
            Rest result = Rest.ok();
            result.setData(data);
            return result;
        } catch (Exception e) {
            return Rest.failure("密码重置失败");
        }
    }

    /**
     * 20190618 add zyj 按密码规则生成随机的8位密码
     *
     * @return
     */
    public String getNewPwd() {
        //密码规则大于6位，含数字、大小写字母、特殊符号
        char[] ma = "0123456789".toCharArray();
        char[] la = "abcdefghijkmnpqrstuvwxyz".toCharArray();
        char[] ua = "ABCDEFGHJKLMNPQRSTUVWXYZ".toCharArray();
        char[] da = "/-+*@#$*%&@".toCharArray();
        int len = 8;//默认8位
        //简化逻辑 数字3位，小字母3，大写1，符号1
        Random ra = new Random();
        List<Character> list = Lists.newArrayList();
        for (int i = 0; i < 3; i++) {
            list.add(ma[ra.nextInt(ma.length - 1)]);
        }
        for (int i = 0; i < 3; i++) {
            list.add(la[ra.nextInt(la.length - 1)]);
        }
        for (int i = 0; i < 1; i++) {
            list.add(ua[ra.nextInt(ua.length - 1)]);
        }
        for (int i = 0; i < 1; i++) {
            list.add(da[ra.nextInt(da.length - 1)]);
        }
        Collections.shuffle(list);
        return StringUtils.join(list, "");
    }


    @Log("一键重置所有用户密码（除超级管理员）")
    @RequiresPermissions("editUser")
    @RequestMapping("/reSettingAllPsd")
    @ResponseBody
    public Rest reSettingAllPsd() {
        TSysUser admin = this.sysUserService.selectOne(new EntityWrapper<TSysUser>().like("username", "admin"));
        //查询用户密码记录
        EntityWrapper<TSysUserSecurity> ew = new EntityWrapper<TSysUserSecurity>();
        ew.notIn("user_id", admin.getId());
        List<TSysUserSecurity> list = sysUserSecurityService.selectList(ew);
        for (TSysUserSecurity sysUserSecurity : list) {
            try {
                //不存在，则添加新（正常情况不可能不存在）
                if (sysUserSecurity == null || sysUserSecurity.getUserId() == null) {
                    continue;
                }
                TSysUser user = this.sysUserService.selectById(sysUserSecurity.getUserId());
                String hash = PBKDF2Util.createHash("123456".toCharArray(), null);
                String salt = PBKDF2Util.getSalt(hash);
                String password = PBKDF2Util.getHash(hash);
                sysUserSecurity.setPassword(password);
                sysUserSecurity.setPassword2(password);
                sysUserSecurity.setPassword3(password);
                sysUserSecurity.setSalt(salt);
                sysUserSecurityService
                        .update(sysUserSecurity, new EntityWrapper<TSysUserSecurity>().eq("user_id", user.getId()));
            } catch (Exception e) {
                continue;
            }
        }
        return Rest.ok();
    }

    /**
     * 保存设置密码
     *
     * @param password
     * @param password
     * @param id
     * @return
     */
    @Log("保存用户密码设置")
    @RequiresPermissions("editUser")
    @RequestMapping("/doUpdatePas")
    @ResponseBody
    public Rest doUpdatePas(Integer passType, String password, Integer id) {
        try {
            if (StringUtils.isBlank(password)) {
                return Rest.failure("密码不能为空");
            }
            if (!PatternUtil.validatorPassword(password)) {
                return Rest.failure("密码格式不正确");
            }
            TSysUser sysUser = sysUserService.selectById(id);
            //查询用户密码记录
            EntityWrapper<TSysUserSecurity> ew = new EntityWrapper<>();
            ew.eq("user_id", id);
            TSysUserSecurity sysUserSecurity = sysUserSecurityService.selectOne(ew);
            //不存在，则添加新（正常情况不可能不存在）
            if (sysUserSecurity == null) {
                sysUserSecurity = new TSysUserSecurity();
                sysUserSecurity.setUserId(id);
            }
            switch (passType) {
                //登录密码
                case 1:
                    sysUserSecurity.setPassword(PBKDF2Util.createHash(password, sysUser.getUsername()));
                    break;
                //二级密码
                case 2:
                    sysUserSecurity.setPassword2(PBKDF2Util.createHash(password, sysUser.getUsername()));
                    break;
                //三级密码
                case 3:
                    sysUserSecurity.setPassword3(PBKDF2Util.createHash(password, sysUser.getUsername()));
                    break;
                default:
                    break;
            }
            boolean row = sysUserSecurityService.update(sysUserSecurity, ew);
            if (!row) {
                return Rest.failure("操作异常");
            }

            return Rest.ok();
        } catch (Exception e) {
            return Rest.failure("操作异常");
        }
    }

    /**
     * 验证用户名是否已存在
     */
    @RequestMapping("/checkName")
    @ResponseBody
    public Rest checkName(String userName) {
        List<TSysUser> list = sysUserService.selectList(new EntityWrapper<TSysUser>().eq("username", userName));
        if (list.size() > 0) {
            return Rest.failure("用户名已存在");
        }
        return Rest.ok();
    }

    /**
     * 验证密码格式是否正确
     */
    @RequestMapping("/checkPassword")
    @ResponseBody
    public Rest checkPassword(String password) {
        if (PatternUtil.validatorPassword(password)) {
            return Rest.failure("密码必须由数字、字符、特殊字符三种中的两种组成，且长度不能少于6个字符");
        }
        return Rest.ok();
    }

    /**
     * 验证愿密码是否正确
     */
    @RequestMapping("/checkOldPsd")
    @ResponseBody
    public Rest checkOldPsd(Integer passType, Integer id, String oldpss) {
        try {
            TSysUser sysUser = sysUserService.selectById(id);
            if (sysUser == null) {
                return Rest.failure("用户不存在");
            }
            //查询用户密码记录
            EntityWrapper<TSysUserSecurity> ew = new EntityWrapper<TSysUserSecurity>();
            ew.eq("user_id", id);
            TSysUserSecurity sysUserSecurity = sysUserSecurityService.selectOne(ew);
            if (sysUserSecurity == null) {
                return Rest.failure("愿密码错误");
            }
            //用户输入密码加密
            String old = PBKDF2Util.createHash(oldpss, sysUser.getUsername());
            switch (passType) {
                //登录密码
                case 1:
                    if (old.equals(sysUserSecurity.getPassword())) {
                        return Rest.ok();
                    }
                    //二级密码
                case 2:
                    if (old.equals(sysUserSecurity.getPassword2())) {
                        return Rest.ok();
                    }
                    //三级密码
                case 3:
                    if (old.equals(sysUserSecurity.getPassword3())) {
                        return Rest.ok();
                    }
                default:
                    return Rest.failure("愿密码错误");
            }
        } catch (Exception e) {
            return Rest.failure("愿密码错误");
        }
    }


}
