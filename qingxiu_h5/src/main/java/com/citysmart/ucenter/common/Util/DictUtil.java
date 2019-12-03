package com.citysmart.ucenter.common.Util;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.ucenter.module.system.service.ITSysDictService;
import com.citysmart.ucenter.mybatis.model.TSysDict;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 字典工具
 * lgc 2019-03-05
 */
public class DictUtil {

    public static ITSysDictService service = SpringUtil.getBean(ITSysDictService.class);


    /**
     * 根据字典标识（类型）查询字典
     *
     * @param type 字典标识（类型
     * @return
     */
    public static List<TSysDict> getTSysDictByType(String type) {
        EntityWrapper<TSysDict> ew = new EntityWrapper<TSysDict>();
        if (StringUtils.isNotBlank(type)) {
            ew.eq("type", type);
        }
        ew.orderBy("sort_index");
        return service.selectList(ew);
    }

    /**
     * 获取字典标签名
     *
     * @param type  字典标识
     * @param value 字典值
     * @return 字典标签名
     */
    public static String getTSysDictByTypeAndvalue(String type, String value) {
        EntityWrapper<TSysDict> ew = new EntityWrapper<TSysDict>();
        if (!StringUtils.isBlank(type)) {
            ew.eq("type", type);
            ew.eq("value", value);
        }
        TSysDict tSysDicts = service.selectOne(ew);
        if (tSysDicts != null) {
            return tSysDicts.getLabel();
        }
        return "";
    }

    /**
     * 获取字典标签名
     *
     * @param type  字典标识
     * @param value 字典值
     * @return 字典标签名
     */
    public static TSysDict getByTypeAndvalue(String type, String value) {
        EntityWrapper<TSysDict> ew = new EntityWrapper<TSysDict>();
        if (!StringUtils.isBlank(type)) {
            ew.eq("type", type);
            ew.eq("value", value);
        }
        TSysDict tSysDicts = service.selectOne(ew);
        return tSysDicts;
    }

    /**
     * 获取字典标签名
     * 2019 10 12 zyj
     * @param ptype  字典标识
     * @param pvalue 字典值
     * @param value 字典值
     * @return 字典标签名
     */
    public static String getChildValue(String ptype, String pvalue, String value) {
        EntityWrapper<TSysDict> ew = new EntityWrapper<>();
        if (!StringUtils.isBlank(ptype)) {
            ew.eq("type", ptype);
            ew.eq("value", pvalue);
        }
        TSysDict parent = service.selectOne(ew);
        ew = new EntityWrapper<>();
        ew.eq("type", parent.getValue());
        ew.eq("value", value);
        TSysDict child = service.selectOne(ew);
        if (child != null) {
            return parent.getLabel() + "(" + child.getLabel() + ")";
        }
        return parent.getLabel();
    }

    /**
     * 获取字典标签名
     * 2019 10 12 zyj
     * @param ptype  字典标识
     * @return 字典标签名
     */
    public static List<TSysDict> findChildList(String ptype) {
        EntityWrapper<TSysDict> ew = new EntityWrapper<>();
        if (!StringUtils.isBlank(ptype)) {
            ew.eq("type", ptype);
        }
        List<TSysDict> list = new ArrayList<>();
        List<TSysDict> parentList = service.selectList(ew);
        list.addAll(parentList);
        List<String> types = parentList.stream().map(TSysDict::getValue).collect(Collectors.toList());
        ew = new EntityWrapper<>();
        ew.in("type", types);
        List<TSysDict> childList = service.selectList(ew);
        list.addAll(childList);
        return list;
    }
}

