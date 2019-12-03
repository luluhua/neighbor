package com.citysmart.ucenter.common.util;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.ucenter.module.system.service.ITSysDictService;
import com.citysmart.ucenter.mybatis.model.TSysDict;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

/**
 * 字典工具
 * lgc 2019-03-05
 */
public class DictUtil {

    public static ITSysDictService service= SpringUtil.getBean(ITSysDictService.class);


    /**
     * 根据字典标识（类型）查询字典
     * @param type 字典标识（类型
     * @return
     */
    public static List<TSysDict> getTSysDictByType(String type){
        EntityWrapper<TSysDict> ew = new EntityWrapper<TSysDict>();
        if (StringUtils.isNotBlank(type)) {
           ew.eq("type",type);
        }
        ew.orderBy("sort_index");
       return  service.selectList(ew);
    }

    /**
     * 获取字典标签名
     * @param type 字典标识
     * @param value 字典值
     * @return 字典标签名
     */
    public static String getTSysDictByTypeAndvalue(String type,String value){
        EntityWrapper<TSysDict> ew = new EntityWrapper<TSysDict>();
        if (!StringUtils.isBlank(type)) {
            ew.eq("type",type);
            ew.eq("value",value);
        }
       TSysDict tSysDicts=  service.selectOne(ew);
        if(tSysDicts!=null){
            System.out.println(tSysDicts.getLabel());
            return  tSysDicts.getLabel();
        }
        return "";
    }
}
