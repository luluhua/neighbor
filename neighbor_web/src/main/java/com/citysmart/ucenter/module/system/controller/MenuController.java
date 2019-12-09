package com.citysmart.ucenter.module.system.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.system.service.ISysMenuService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.SysMenu;
import com.citysmart.ucenter.mybatis.model.TThirdInterfaceConfig;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.soap.Detail;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 角色控制器
 *
 * @author Gaojun.Zhou
 * @date 2016年12月13日 上午10:23:41
 */
@Controller
@RequestMapping("/system/menu")
public class MenuController extends SuperController {

    /**
     * 菜单服务
     */
    @Autowired
    private ISysMenuService sysMenuService;

    static List<SysMenu> parentCategoryList = new ArrayList<SysMenu>();

    /**
     * 分页查询菜单
     */
    @RequiresPermissions("listMenu")
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<SysMenu> page = getPage(pageNumber, pageSize);
//        page.setOrderByField("code");
//        page.setAsc(true);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<SysMenu> ew = new EntityWrapper<SysMenu>();
        if (StringUtils.isNotBlank(search)) {
            ew.where("menuName like CONCAT('%',{0},'%')", search);
            model.addAttribute("search", search);
        }
        String deep = request.getParameter("deep");
        if (StringUtils.isNotBlank(deep)) {
            ew.eq("deep", deep);
        }
        model.addAttribute("deep", deep);
        String type = request.getParameter("serviceType");
        if (StringUtils.isNotBlank(type)) {
            ew.eq("service_type", type);
        }
        model.addAttribute("serviceType", type);
        String is_enabled = request.getParameter("isEnabled");
        if (StringUtils.isNotBlank(is_enabled)) {
            ew.eq("is_enabled", is_enabled);
        }
        model.addAttribute("isEnabled", is_enabled);
        ew.orderBy("code");
        Page<SysMenu> pageData = sysMenuService.selectPage(page, ew);

        for (SysMenu menu : pageData.getRecords()) {
            if (menu.getPid() == null || menu.getDeep() != 3) {
                menu.setMenuName(StringUtils.join("<i class='fa fa-folder-open'></i> ", menu.getMenuName()));
            } else {
                menu.setMenuName(StringUtils.join("<i class='fa fa-file'></i> ", menu.getMenuName()));
            }
            for (int i = 1; i < menu.getDeep(); i++) {
                menu.setMenuName(StringUtils.join("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", menu.getMenuName()));
            }

        }

        model.addAttribute("pageData", pageData);
        return "/system/menu/list";
    }

    /**
     * 增加菜单
     */
    @RequiresPermissions("addMenu")
    @RequestMapping("/add")
    public String add(Model model) {

        EntityWrapper<SysMenu> ew = new EntityWrapper<SysMenu>();
        ew.orderBy("code", true);
        ew.eq("pid", "0");
        List<SysMenu> list = sysMenuService.selectList(ew);
        EntityWrapper<SysMenu> ews = new EntityWrapper<SysMenu>();
        ews.orderBy("code", true);
        ews.eq("deep", 1);
        List<SysMenu> submenulist = sysMenuService.selectList(ews);
        model.addAttribute("list", list);
        model.addAttribute("submenulist", submenulist);
        return "/system/menu/add";

    }

    /**
     * 添加目录
     */
//	@RequiresPermissions("addMenu")
    @Log("创建目录菜单")
    @RequestMapping("/doAddDir")
    @ResponseBody
    public Rest doAddDir(SysMenu sysMenu, Model model) {
        int first_manu_nub = sysMenuService.countchildTreeMenuByPid("0");
        if (first_manu_nub == 0) {
            sysMenu.setCode("1");
        } else if (first_manu_nub < 10) {
            sysMenu.setCode("0" + (first_manu_nub + 1));
        } else {
            sysMenu.setCode((first_manu_nub + 1) + "");
        }
        sysMenu.setPid("0");
        sysMenu.setDeep(1);
        sysMenuService.insert(sysMenu);
        return Rest.ok();
    }

    /**
     * 添加菜单
     */
    @RequiresPermissions("addMenu")
    @Log("创建菜单")
    @RequestMapping("/doAddMenu")
    @ResponseBody
    public Rest doAddMenu(SysMenu sysMenu, Model model) {
        SysMenu new_sys_manu;
        if (StringUtils.isNotBlank(sysMenu.getPid())) {
            int first_manu_nub = sysMenuService.countchildTreeMenuByPid(sysMenu.getPid());
            new_sys_manu = sysMenuService.selectById(sysMenu.getPid());
            sysMenu.setServiceType(new_sys_manu.getServiceType());
            if (first_manu_nub == 0) {
                sysMenu.setCode(new_sys_manu.getCode() + "01");
            } else if (first_manu_nub < 10) {
                sysMenu.setCode(new_sys_manu.getCode() + "0" + (first_manu_nub + 1));
            } else {
                sysMenu.setCode(new_sys_manu.getCode() + (first_manu_nub + 1) + "");
            }
        } else {
            return Rest.failure("创建菜单必须选择对应的目录!");
        }
        if (new_sys_manu.getDeep() == 2) {
            sysMenu.setDeep(4);
        } else {
            sysMenu.setDeep(2);
        }

        sysMenuService.insert(sysMenu);
        return Rest.ok();
    }

    /**
     * 编辑菜单
     */
    @RequiresPermissions("editMenu")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        SysMenu sysMenu = sysMenuService.selectById(id);
        model.addAttribute("sysMenu", sysMenu);
        if (sysMenu.getDeep() == 1) {
            return "/system/menu/edit";
        } else if (sysMenu.getDeep() == 2 || sysMenu.getDeep() == 4) {
            EntityWrapper<SysMenu> ew = new EntityWrapper<SysMenu>();
            ew.orderBy("code", true);
//            ew.eq("pid", "0");
            ew.where("deep<=2");
            List<SysMenu> list = sysMenuService.selectList(ew);
            model.addAttribute("list", list);
            return "/system/menu/editMenu";
        } else {
            EntityWrapper<SysMenu> ew = new EntityWrapper<SysMenu>();
            ew.orderBy("code", true);
            ew.eq("pid", "0");
            List<SysMenu> list = sysMenuService.selectList(ew);  //第一层菜单
            SysMenu pSysMenu = sysMenuService.selectById(sysMenu.getPid());
            int tyr = 0;
            if (pSysMenu.getDeep() == 4) {
                model.addAttribute("list", list);
                model.addAttribute("pSysMenu", pSysMenu);
                SysMenu sae = sysMenuService.selectById(!"1".equals(pSysMenu.getPid()) ? pSysMenu.getPid() : "");
                EntityWrapper<SysMenu> ewer = new EntityWrapper<SysMenu>();
                ewer.eq("is_deleted", Delete.未删除);
                ewer.eq("pid", sae.getPid());
                List<SysMenu> menulist = sysMenuService.selectList(ewer);
                model.addAttribute("menulist", menulist);
                model.addAttribute("pSysMenus", sae);
                model.addAttribute("tyr", tyr);
            } else {
                tyr = 1;
                model.addAttribute("list", list);
                model.addAttribute("pSysMenus", pSysMenu);
                model.addAttribute("tyr", tyr);
                model.addAttribute("pSysMenu", sysMenu);
            }


            return "/system/menu/editAction";
        }
    }

    /**
     * 执行编辑菜单
     */
    @RequiresPermissions("editMenu")
    @Log("编辑菜单")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(SysMenu sysMenu, Model model) {
        String new_code = sysMenu.getCode();
        if (sysMenu.getDeep() == 2) {
            SysMenu new_sys_manu = sysMenuService.selectById(sysMenu.getPid());
            new_code = new_sys_manu.getCode() + sysMenu.getCode().substring(2);
            sysMenu.setServiceType(new_sys_manu.getServiceType());
            if (new_sys_manu.getDeep() == 2) {
                sysMenu.setDeep(4);
            }
        } else if (sysMenu.getDeep() == 3) {
            SysMenu new_sys_manu = sysMenuService.selectById(sysMenu.getPid());
            new_code = new_sys_manu.getCode() + sysMenu.getCode().substring(3, sysMenu.getCode().length());
            sysMenu.setServiceType(new_sys_manu.getServiceType());
        }
        sysMenu.setCode(new_code);
        sysMenuService.updateById(sysMenu);
        return Rest.ok();
    }

    /**
     * 执行编辑菜单
     */
    @RequiresPermissions("deleteMenu")
    @Log("删除菜单")
    @RequestMapping("/delete")
    @ResponseBody
    public Rest delete(String id) {
        sysMenuService.deleteById(id);
        return Rest.ok();
    }

    /**
     * 根据父节点获取子菜单
     */
    @RequestMapping("/json")
    @ResponseBody
    public Rest json(String pid) {
        EntityWrapper<SysMenu> ew = new EntityWrapper<SysMenu>();
        ew.where("deep !=3");
        ew.orderBy("sort");
        ew.addFilter("pid = {0} ", pid);
        List<SysMenu> list = sysMenuService.selectList(ew);

        List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
        for (SysMenu m : list) {
            Map<String, Object> map = Maps.newHashMap();
            map.put("id", m.getId());
            map.put("text", StringUtils.join(m.getCode(), "-", m.getMenuName()));
            listMap.add(map);
        }
        return Rest.okData(listMap);
    }


    /**
     * 验证菜单资源名称是否存在
     */
    @RequestMapping("/checkMenuResource")
    @ResponseBody
    public Rest checkMenuResource(String resource) {

        List<SysMenu> list = sysMenuService.selectList(new EntityWrapper<SysMenu>().addFilter("resource = {0}", resource));
        if (list.size() > 0) {
            return Rest.failure("资源已存在,请换一个尝试.");
        }
        return Rest.ok();
    }

    @RequiresPermissions("addMenu")
    @Log("新增功能菜单")
    @RequestMapping("/doAddAction")
    @ResponseBody
    public Rest doAddAction(SysMenu sysMenu) {
        if (StringUtils.isNotBlank(sysMenu.getPid())) {
            int first_manu_nub = sysMenuService.countchildTreeMenuByPid(sysMenu.getPid());
            SysMenu new_sys_manu = sysMenuService.selectById(sysMenu.getPid());
            if (first_manu_nub == 0) {
                sysMenu.setCode(new_sys_manu.getCode() + "01");
            } else if (first_manu_nub < 10) {
                sysMenu.setCode(new_sys_manu.getCode() + "0" + (first_manu_nub + 1));
            } else {
                sysMenu.setCode(new_sys_manu.getCode() + (first_manu_nub + 1) + "");
            }
            sysMenu.setServiceType(new_sys_manu.getServiceType());
        } else {
            return Rest.failure("创建功能必须选择对应的菜单!");
        }

        sysMenu.setDeep(3);
        sysMenuService.insert(sysMenu);
        return Rest.ok();
    }


    @RequiresPermissions("deleteMenu")
    @RequestMapping("/updateSortAll")
    @ResponseBody
    public Rest updateSortAll(@RequestParam(value = "id[]") String[] id, @RequestParam(value = "value[]") int[] values) {
        try {
            if (id == null || values == null) {
                return Rest.failure("请选择修改排序记录");
            }
            SysMenu sysMenu = null;
            List<SysMenu> sysMenuList = new ArrayList<SysMenu>();
            for (int i = 0; i < id.length; i++) {
                sysMenu = new SysMenu();
                sysMenu.setId(id[i]);
                sysMenu.setSort(values[i]);
                sysMenuList.add(sysMenu);
            }
            sysMenuService.updateBatchById(sysMenuList);
            return Rest.ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Rest.failure("批量修改排序异常");
    }

    @RequestMapping("/getServiceType/{id}")
    @ResponseBody
    public String getServiceType(@PathVariable String id) {
        String servic_type = sysMenuService.selectById(id).getServiceType();
        return servic_type;
    }

    private static List<SysMenu> getParentCategory(List<SysMenu> allCategoryList, String categoryAuId) {
        for (SysMenu category : allCategoryList) {
            // 判断是否存在父节点
            if (category.getId().equals(categoryAuId)) {
                // 递归遍历上一级
                getParentCategory(allCategoryList, category.getPid().toString());
                parentCategoryList.add(category);
            }
        }
        System.out.println("parentCategoryList=" + parentCategoryList);
        return parentCategoryList;
    }

}
