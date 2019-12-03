package com.citysmart.ucenter.module.system.service;


import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.model.SysCity;

import java.util.List;

/**
 * <p>
 * 中国区域表 服务类
 * </p>
 *
 * @author lub
 * @since 2019-03-26
 */
public interface ISysCityService extends IService<SysCity> {
    List<SysCity> parentList(Integer id);

    /**
     * 获取某个节点下所有的子节点(包含当前节点)
     *
     * @param rootId
     * @return
     */
    List<SysCity> allChildList(Integer rootId);

    Integer getcityidByCunitId(Integer id);

}
