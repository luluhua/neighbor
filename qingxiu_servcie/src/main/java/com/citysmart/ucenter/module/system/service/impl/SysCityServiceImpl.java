package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.system.service.ISysCityService;
import com.citysmart.ucenter.mybatis.mapper.SysCityMapper;
import com.citysmart.ucenter.mybatis.model.SysCity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 中国区域表 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-03-26
 */
@Service
public class SysCityServiceImpl extends ServiceImpl<SysCityMapper, SysCity> implements ISysCityService {

    @Autowired
    SysCityMapper sysCityMapper;

    @Override
    public List<SysCity> parentList(Integer id) {
        StringBuilder sql = new StringBuilder();
        sql.append(
                "SELECT * FROM sys_city where pid=(SELECT pid FROM sys_city where id=(SELECT pid FROM sys_city where id=")
                .append(id).append("))");
        System.out.print(sql.toString());
        List<SysCity> list = sysCityMapper.queryBySql(sql.toString());
        return list;

    }

    /**
     * 获取某个节点下所有的子节点(包含当前节点)
     *
     * @param rootId
     * @return
     */
    @Override
    public List<SysCity> allChildList(Integer rootId) {
        List<SysCity> cities = new ArrayList<>();
        SysCity city = this.sysCityMapper.selectById(rootId);
        if (city == null) {
            return cities;
        }
        cities.add(city);
        cities.addAll(this.childList(rootId));
        return cities;
    }

    /**
     * 递归获取某个节点下所有的子节点
     *
     * @param rootId
     * @return
     */
    private List<SysCity> childList(Integer rootId) {
        List<SysCity> cities = new ArrayList<>();
        List<SysCity> childList = this.selectList(new EntityWrapper<SysCity>().eq("pid", rootId));
        if (!childList.isEmpty()) {
            cities.addAll(childList);
            for (SysCity city : childList) {
                cities.addAll(childList(city.getId()));
            }
        }
        return cities;
    }

    @Override
    public Integer getcityidByCunitId(Integer id) {


        return this.baseMapper.getcityidByCunitId(id);
    }
}
