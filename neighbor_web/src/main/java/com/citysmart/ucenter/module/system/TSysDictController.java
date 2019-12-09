package com.citysmart.ucenter.module.system;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.ucenter.module.system.service.ITSysDictService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.TSysDict;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Controller
@RequestMapping("/tSysDict/dict")
public class TSysDictController extends SuperController {

    @Autowired
    public ITSysDictService service;
    ////////////////////////////////////////////字典分组管理/////////////////////////////

    /**
     * 分页查询
     */
    @RequestMapping("/listGroup/{pageNumber}")
    public String listGroup(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TSysDict> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSysDict> ew = new EntityWrapper<TSysDict>();
        if (StringUtils.isNotBlank(search)) {
            ew.where("(type like CONCAT('%',{0},'%')", search)
                    .or("label like CONCAT('%',{0},'%'))", search);
            model.addAttribute("search", search);
        }
        ew.eq("module_id", 0);
        Page<TSysDict> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/system/dict/group/list";
    }

    /**
     * 新增
     */
    @RequiresPermissions("addTSysDict")
    @RequestMapping("/addGroup")
    public String addGroup(Model model) {
        getPList(model);
        model.addAttribute("sortIdex", getMaxSortIndex());
        return "/system/dict/group/add";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTSysDict")
    @RequestMapping("/doAddGroup")
    @ResponseBody
    public Rest doAddGroup(TSysDict entity, String[] roleId) {
        if (getCodeExistence(entity.getCode(), null)) {
            return Rest.failure("分组代码已存在");
        }
        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除
     */
    @RequiresPermissions("deleteTSysDict")
    @RequestMapping("/deleteGroup")
    @ResponseBody
    public Rest deleteGroup(Integer id) {
        if (checkChild(id)) {
            return Rest.failure("选择删除分组包含：多个字典，请先删除相关字典");
        }
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 批量删除
     *
     * @return
     */
    @RequiresPermissions("deleteTSysDict")
    @RequestMapping("/deleteAllGroup")
    @ResponseBody
    public Rest deleteAllGroup(@RequestParam(value = "id[]") String[] id) {
        try {
            if (id == null) {
                return Rest.failure("请选择需删除记录");
            }
            List<String> listIds = Arrays.asList(id);
            for (String _id : listIds) {
                if (checkChild(Integer.parseInt(_id))) {
                    return Rest.failure("选择删除分组包含：多个字典，请先删除相关字典");
                }
            }
            service.deleteBatchIds(listIds);
            return Rest.ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Rest.failure("删除异常");
    }

    private boolean checkChild(Integer moduleId) {
        EntityWrapper ew = new EntityWrapper<TSysDict>();
        ew.eq("module_id", moduleId);
        ew.eq("is_deleted", Delete.未删除.getValue());
        List<TSysDict> sysDictList = service.selectList(ew);
        if (sysDictList != null && !sysDictList.isEmpty()) {
            return true;
        }
        return false;
    }

    /**
     * 编辑
     */
    @RequiresPermissions("editTSysDict")
    @RequestMapping("/editGroup/{id}")
    public String editGroup(@PathVariable Integer id, Model model) {
        TSysDict entity = service.selectById(id);
        getPList(model);
        model.addAttribute("dict", entity);
        return "/system/dict/group/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTSysDict")
    @RequestMapping("/doEditGroup")
    @ResponseBody
    public Rest doEditGroup(TSysDict entity, Model model) {
        if (getCodeExistence(entity.getCode(), entity.getId())) {
            return Rest.failure("分组代码已存在");
        }
        service.updateById(entity);
        return Rest.ok();
    }


    /**
     * 批量修改-分组
     *
     * @return
     */
    @RequiresPermissions("editTSysDict")
    @RequestMapping("/updateSortAllGroup")
    @ResponseBody
    public Rest updateSortAllGroup(@RequestParam(value = "id[]") int[] id, @RequestParam(value = "value[]") int[] values) {
        try {
            if (id == null || values == null) {
                return Rest.failure("请选择修改排序记录");
            }
            TSysDict tSysDict = null;
            List<TSysDict> tSysDictList = new ArrayList<TSysDict>();
            for (int i = 0; i < id.length; i++) {
                tSysDict = new TSysDict();
                tSysDict.setId(id[i]);
                tSysDict.setSortIndex(values[i]);
                tSysDictList.add(tSysDict);
            }
            service.updateBatchById(tSysDictList);
            return Rest.ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Rest.failure("批量修改排序异常");
    }

    private Integer getMaxSortIndex() {
        TSysDict dictGroup = service.selectOne(new EntityWrapper<TSysDict>()
                .eq("is_deleted", Delete.未删除.getValue())
                .eq("module_id", 0)
                .orderBy("sort_index", false));
        if (dictGroup != null) {
            return dictGroup.getSortIndex() + 10;
        }
        return 1;
    }


    /////////////////////////////////////////////字典管理/////////////////////////////////

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize, String search, Model model) {

        Page<TSysDict> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TSysDict> ew = new EntityWrapper<TSysDict>();
        if (StringUtils.isNotBlank(search)) {
            ew.where("(type like CONCAT('%',{0},'%')", search)
                    .or("remark like CONCAT('%',{0},'%')", search)
                    .or("label like CONCAT('%',{0},'%'))", search);
            model.addAttribute("search", search);
        }
        List<String> sortList = new ArrayList<>();
        sortList.add("type");
        sortList.add("sort_index");
        ew.orderAsc(sortList);
        getDictGroupById(model);
        String moduleId = request.getParameter("moduleId");
        ew.eq("module_id", moduleId);
        Page<TSysDict> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/system/dict/list";
    }

    private void getDictGroupById(Model model) {
        String moduleId = request.getParameter("moduleId");
        if (StringUtils.isNotBlank(moduleId)) {
            model.addAttribute("sortIdex", getMaxSortIndex(Integer.parseInt(moduleId)));
            //分组id不存在，进入提示页面
            TSysDict dictGroup = service.selectOne(new EntityWrapper<TSysDict>().eq("id", moduleId));
            model.addAttribute("dictGroup", dictGroup);
        }
    }

    /**
     * 新增
     */
    @RequiresPermissions("addTSysDict")
    @RequestMapping("/add")
    public String add(Model model) {

        getDictGroupById(model);
        getPList(model);
        return "/system/dict/add";
    }

    /**
     * 执行新增
     */
    @RequiresPermissions("addTSysDict")
    @RequestMapping("/doAdd")
    @ResponseBody
    public Rest doAdd(TSysDict entity, String[] roleId) {
        if (getCodeExistence(entity.getCode(), null)) {
            return Rest.failure("字典代码已存在");
        }
        service.insert(entity);
        return Rest.ok();
    }

    /**
     * 删除
     */
    @RequiresPermissions("deleteTSysDict")
    @RequestMapping("/delete")
    @ResponseBody
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 批量删除
     *
     * @return
     */
    @RequiresPermissions("deleteTSysDict")
    @RequestMapping("/deleteAll")
    @ResponseBody
    public Rest deleteAll(@RequestParam(value = "id[]") String[] id) {
        try {
            if (id == null) {
                return Rest.failure("请选择需删除记录");
            }
            List<String> listIds = Arrays.asList(id);
            service.deleteBatchIds(listIds);
            return Rest.ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Rest.failure("删除异常");
    }

    /**
     * 编辑
     */
    @RequiresPermissions("editTSysDict")
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable Integer id, Model model) {
        TSysDict entity = service.selectById(id);
        model.addAttribute("dict", entity);
        model.addAttribute("dictGroup", getDictGroup());
//        getProjectList(model);
        return "/system/dict/edit";
    }

    /**
     * 执行编辑
     */
    @RequiresPermissions("editTSysDict")
    @RequestMapping("/doEdit")
    @ResponseBody
    public Rest doEdit(TSysDict entity, Model model) {
        if (getCodeExistence(entity.getCode(), entity.getId())) {
            return Rest.failure("字典代码已存在");
        }
        service.updateById(entity);
        return Rest.ok();
    }


    /**
     * 获取已有字典
     */
    private void getPList(Model model) {
        EntityWrapper<TSysDict> ew = new EntityWrapper<TSysDict>();
        ew.orderBy("sortIndex", true);
        List<TSysDict> list = service.selectList(ew);
        model.addAttribute("list", list);
    }


    /**
     * 批量修改-分组
     *
     * @return
     */
    @RequiresPermissions("editTSysDict")
    @RequestMapping("/updateSortAll")
    @ResponseBody
    public Rest updateSortAll(@RequestParam(value = "id[]") int[] id, @RequestParam(value = "value[]") int[] values) {
        try {
            if (id == null || values == null) {
                return Rest.failure("请选择修改排序记录");
            }
            TSysDict tSysDict = null;
            List<TSysDict> tSysDictList = new ArrayList<TSysDict>();
            for (int i = 0; i < id.length; i++) {
                tSysDict = new TSysDict();
                tSysDict.setId(id[i]);
                tSysDict.setSortIndex(values[i]);
                tSysDictList.add(tSysDict);
            }
            service.updateBatchById(tSysDictList);
            return Rest.ok();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Rest.failure("批量修改排序异常");
    }

    private Integer getMaxSortIndex(Integer modelId) {
        TSysDict dictGroup = service.selectOne(new EntityWrapper<TSysDict>()
                .eq("is_deleted", Delete.未删除.getValue())
                .eq("module_id", modelId)
                .orderBy("sort_index", false));
        if (dictGroup != null) {
            return dictGroup.getSortIndex() + 10;
        }
        return 1;
    }

    private List<TSysDict> getDictGroup() {
        List<TSysDict> dictGroups = service.selectList(new EntityWrapper<TSysDict>()
                .eq("is_deleted", Delete.未删除.getValue())
                .eq("module_id", 0)
                .orderBy("sort_index", false));
        return dictGroups;
    }


    private boolean getCodeExistence(String code, Integer id) {
        EntityWrapper ew = new EntityWrapper<TSysDict>();
        ew.eq("code", code);
        if (id != null) {
            ew.ne("id", id);
        }
        TSysDict dictGroup = service.selectOne(ew);
        if (dictGroup != null) {
            return true;
        }
        return false;
    }


    /**
     * 跳转  批量添加字典
     *
     * @param moduleId
     * @param model
     * @return
     */
    @RequestMapping("/toAddBatch")
    public String toAddBatch(Integer moduleId, Model model) {
        getDictGroupById(model);
//        getProjectList(model);
        return "/system/dict/addbatch";
    }

    /**
     * 批量添加字典
     *
     * @param entity
     * @param model
     * @return
     */
    @RequestMapping("/doAddBatch")
    @ResponseBody
    public Rest doAddBatch(TSysDict entity, String[] labelAs,
                           String[] valueAs, Model model) {
        if (getCodeExistence(entity.getCode(), entity.getId())) {
            return Rest.failure("字典代码已存在");
        }
        try {
            if (labelAs != null && valueAs != null) {
                List<TSysDict> tSysDictList = new ArrayList<TSysDict>();
                Integer _sortIndex = entity.getSortIndex();
                TSysDict tmpEntity = null;
                for (int i = 0; i < labelAs.length; i++) {
                    tmpEntity = new TSysDict();
                    _sortIndex = _sortIndex + 10;
//                    tmpEntity.setProjectId(entity.getProjectId());
                    tmpEntity.setCode((entity.getCode() + _sortIndex));
                    tmpEntity.setLabel(labelAs[i]);
                    tmpEntity.setValue(String.valueOf(valueAs[i]));
                    tmpEntity.setSortIndex(_sortIndex);
                    tmpEntity.setType(entity.getType());
                    tmpEntity.setModuleId(entity.getModuleId());
                    tmpEntity.setRemark(entity.getRemark());
                    tmpEntity.setParentId(entity.getParentId());
                    tSysDictList.add(tmpEntity);
                }
                service.insertBatch(tSysDictList);
            }

            return Rest.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return Rest.failure("添加失败:字典代码已存在");
        }

    }
}
