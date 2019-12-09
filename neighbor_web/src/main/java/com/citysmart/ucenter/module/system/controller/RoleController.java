package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.system.entity.vo.TreeMenuAllowAccess;
import com.citysmart.ucenter.module.system.service.*;
import com.citysmart.ucenter.mybatis.entity.vo.SysRoleQueryVo;
import com.citysmart.ucenter.mybatis.model.SysRole;
import com.citysmart.ucenter.mybatis.model.SysRoleMenu;
import com.citysmart.ucenter.mybatis.model.SysUserRole;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

//import org.apache.shiro.authz.annotation.RequiresPermissions;

/**
 * 角色控制器
 *
 * @author Gaojun.Zhou
 * @date 2016年12月13日 上午10:23:41
 */
@Controller
@RequestMapping("/system/role")
public class RoleController extends SuperController {

    /**
     * 角色服务
     */
    @Autowired
    private ISysRoleService sysRoleService;
    /**
     * 角色用户服务
     */
    @Autowired
    private ISysUserRoleService sysUserRoleService;

    @Autowired
    private ITSysUserService sysUserService;
    /**
     * 菜单服务
     */
    @Autowired
    private ISysMenuService sysMenuService;
    /**
     * 角色权限服务
     */
    @Autowired
    private ISysRoleMenuService sysRoleMenuService;

    /**
     * 分页查询角色
     */
    @RequiresPermissions("listRole")
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<SysRole> page = getPage(pageNumber, pageSize);
//		page.setOrderByField("createTime");
        page.setAsc(false);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<SysRole> ew = new EntityWrapper<SysRole>();
        if (StringUtils.isNotBlank(search)) {
            ew.where("(name like CONCAT('%',{0},'%')", search)
                    .or("code like CONCAT('%',{0},'%'))", search);
            model.addAttribute("search", search);
        }
        Page<SysRole> pageData = sysRoleService.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/system/role/list";
    }

    /**
     * 新增角色
     */
    @RequiresPermissions("addRole")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/system/role/add";
    }


    /**
     * 执行新增角色
     */
    @RequiresPermissions("addRole")
    @Log("创建角色")
    @RequestMapping("/doAdd")
    @ResponseBody
    public Rest doAdd(SysRole role) {
        sysRoleService.insert(role);
        return Rest.ok();
    }

    /**
     * 删除角色
     */
    @RequiresPermissions("deleteRole")
    @Log("删除角色")
    @RequestMapping("/delete")
    @ResponseBody
    public Rest delete(Integer id) {
//        sysRoleService.deleteById(id);
        try {
            sysRoleService.deleteOneRole(id);
        }catch (Exception e){
            return Rest.failure(e.getMessage());
        }
        return Rest.ok();
    }


    /**
     * 批量删除角色
     */
    @RequiresPermissions("deleteBatchRole")
    @Log("批量删除角色")
    @RequestMapping("/deleteBatch")
    @ResponseBody
    public Rest deleteBatch(@RequestParam("id[]") List<String> ids) {
//        sysRoleService.deleteBatchIds(ids);
        try {
            sysRoleService.batchDeleteRoles(ids);
        }catch (Exception e){
            return Rest.failure(e.getMessage());
        }
        return Rest.ok();
    }

    /**
     * 编辑角色
     */
    @RequiresPermissions("editRole")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        SysRole sysRole = sysRoleService.selectById(id);
        model.addAttribute(sysRole);
        return "/system/role/edit";
    }

    /**
     * 执行编辑角色
     */
    @RequiresPermissions("editRole")
    @Log("编辑角色")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(SysRole sysRole, Model model) {
        sysRoleService.updateById(sysRole);
        return Rest.ok();
    }

    /**
     * 权限
     */
//	@RequiresPermissions("authRole")
    @RequestMapping("/auth/{id}")
    public String auth(@PathVariable String id, Integer service_type, Model model) {

        SysRole sysRole = sysRoleService.selectById(id);

        if (sysRole == null) {
            throw new RuntimeException("该角色不存在");
        }

        List<SysRoleMenu> sysRoleMenus = sysRoleMenuService.selectList(new EntityWrapper<SysRoleMenu>().eq("roleId", id));
        List<String> menuIds = Lists.transform(sysRoleMenus, input -> input.getMenuId());

        List<TreeMenuAllowAccess> treeMenuAllowAccesses = sysMenuService.selectTreeMenuAllowAccessByMenuIdsAndPid(menuIds, "0", service_type);

        model.addAttribute("sysRole", sysRole);
        model.addAttribute("treeMenuAllowAccesses", treeMenuAllowAccesses);
        return "system/role/auth";
    }

    /**
     * 权限
     */
//	@RequiresPermissions("authRole")
    @Log("角色分配权限")
    @RequestMapping("/doAuth")
    @ResponseBody
    public Rest doAuth(Integer roleId, @RequestParam(value = "mid[]", required = false) String[] mid) {
        sysRoleMenuService.addAuth(roleId, mid);
        return Rest.ok("OK,授权成功,1分钟后生效  ~");
    }

    /**
     * 获取角色下的所有用户
     */
    @RequestMapping("/getUsers")
    public String getUsers(String roleId, Model model) {

        List<SysUserRole> sysUserRoles = sysUserRoleService.selectList(new EntityWrapper<SysUserRole>().eq("roleId", roleId));

        List<String> userIds = Lists.transform(sysUserRoles, input -> String.valueOf(input.getUserId()));

        List<TSysUser> users = new ArrayList<TSysUser>();

        if (userIds.size() > 0) {
            EntityWrapper<TSysUser> ew = new EntityWrapper<TSysUser>();
            ew.in("id", userIds);
            users = sysUserService.selectList(ew);
        }

        model.addAttribute("users", users);
        return "system/role/users";
    }

    /**
     * 获取指定角色的用户数量
     */
    @RequestMapping("/getCount")
    @ResponseBody
    public String getCount(String roleId) {

        int count = sysUserRoleService.selectCount(new EntityWrapper<SysUserRole>().addFilter("roleId = {0}", roleId));
        return String.valueOf(count);
    }

    @RequestMapping(value = "getRoleList", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public Rest getUserList(Integer deptId) {
        Page<SysRole> page = getPage(1, 200);
        SysRoleQueryVo vo = new SysRoleQueryVo();
        vo.setRoleState(1);
        if (deptId != null) {
            vo.setDeptId(deptId);
        }
        Page<SysRole> result = this.sysRoleService.selectListByVo(page, vo);
        return Rest.okData(result.getRecords());
    }
}
