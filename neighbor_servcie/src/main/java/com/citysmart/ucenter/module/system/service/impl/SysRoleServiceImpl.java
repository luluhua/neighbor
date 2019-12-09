package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.system.service.ISysRoleService;
import com.citysmart.ucenter.mybatis.entity.vo.SysRoleQueryVo;
import com.citysmart.ucenter.mybatis.mapper.SysRoleMapper;
import com.citysmart.ucenter.mybatis.model.SysRole;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * SysRole 表数据服务层接口实现类
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements ISysRoleService {
    @Override
    public Page<SysRole> selectListByVo(Page page, SysRoleQueryVo vo) {
        return page.setRecords(this.baseMapper.selectListByVo(vo));
    }

    /**
     * 删除单个角色信息
     * */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteOneRole(Integer roleId) throws Exception {
        if(roleId==null){
            throw new RuntimeException("角色id不能为空");
        }
        //判定部门是否有在办的流程任务数据，如果有，不能删除
        StringBuffer sql1 = new StringBuffer("");
        sql1.append("select count(1) as num from ACT_RU_IDENTITYLINK a \n");
        sql1.append("left join t_sys_org_role b \n");
        sql1.append("on a.user_id_=b.id \n");
        sql1.append("where a.task_id_ is not null  \n");
        sql1.append("and b.role_id="+ roleId+" \n");
        Integer count1 = this.baseMapper.countFromActRuIdentitylink(sql1.toString());
        if (count1 > 0) {
            throw new RuntimeException("此次删除的角色存在有在办流程记录，不允许删除");
        }
        //判定部门是否有对应的流程模板数据，如果有，不能删除
        StringBuffer sql2 = new StringBuffer("");
        sql2.append("select count(1) as num from ACT_DE_MODEL a where EXISTS ( \n");
        sql2.append(
                "select 1 from t_sys_org_role b where locate(CONCAT('\"roleId\":',b.role_id,','),model_editor_json)>0 \n");
        sql2.append("and b.role_id=" + roleId + ") \n");
        Integer count2 = this.baseMapper.countFromActDeModel(sql2.toString());
        if (count2 > 0) {
            throw new RuntimeException("此次删除的角色存在有流程模板记录，不允许删除");
        }
        this.baseMapper.deleteById(roleId);
    }

    /**
     * 批量删除角色信息
     * */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void batchDeleteRoles(List<String> roleIds) throws Exception {
        if(roleIds==null||roleIds.size()==0){
            throw new RuntimeException("角色id不能为空");
        }
        String RoleIds="";
        for(String roleId:roleIds){
            RoleIds+=roleId+",";
        }
        if(RoleIds.length()==0){
            throw new RuntimeException("角色id不能为空");
        }else{
            RoleIds=RoleIds.substring(0,RoleIds.length()-1);
        }
        //判定部门是否有在办的流程任务数据，如果有，不能删除
        StringBuffer sql1 = new StringBuffer("");
        sql1.append("select count(1) as num from ACT_RU_IDENTITYLINK a \n");
        sql1.append("left join t_sys_org_role b \n");
        sql1.append("on a.user_id_=b.id \n");
        sql1.append("where a.task_id_ is not null  \n");
        sql1.append("and b.role_id in ("+ RoleIds+") \n");
        Integer count1 = this.baseMapper.countFromActRuIdentitylink(sql1.toString());
        if (count1 > 0) {
            throw new RuntimeException("此次删除的角色存在有在办流程记录，不允许删除");
        }
        //判定部门是否有对应的流程模板数据，如果有，不能删除
        StringBuffer sql2 = new StringBuffer("");
        sql2.append("select count(1) as num from ACT_DE_MODEL a where EXISTS ( \n");
        sql2.append(
                "select 1 from t_sys_org_role b where locate(CONCAT(',',b.role_id,'-'),model_editor_json)>0 \n");
        sql2.append("and b.role_id in (" + RoleIds + ")) \n");
        Integer count2 = this.baseMapper.countFromActDeModel(sql2.toString());
        if (count2 > 0) {
            throw new RuntimeException("此次删除的角色存在有流程模板记录，不允许删除");
        }
        try {
            this.baseMapper.deleteBatchIds(roleIds);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException("角色批量删除操作异常");
        }
    }


}