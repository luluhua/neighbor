package com.citysmart.ucenter.module.cms.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.cms.service.ITCmsAdvService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.mapper.TCmsAdvMapper;
import com.citysmart.ucenter.mybatis.model.TAppUser;
import com.citysmart.ucenter.mybatis.model.TCmsAdv;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 广告内容表 服务实现类
 *
 * @author lub
 * @since 2019-03-04
 */
@Service
public class TCmsAdvServiceImpl extends ServiceImpl<TCmsAdvMapper, TCmsAdv>
        implements ITCmsAdvService {

    @Autowired
    public TCmsAdvMapper cmsAdvMapper;

    @Override
    public boolean updateIsDeletedById(String id) {
        boolean fa = false;
        EntityWrapper<TCmsAdv> ew = new EntityWrapper<TCmsAdv>();
        ew.eq("id", id);
        TCmsAdv cmsAdv = new TCmsAdv();
        cmsAdv.setIsDeleted(Delete.已删除.getValue());
        int fas = cmsAdvMapper.update(cmsAdv, ew);
        if (fas == 1) {
            fa = true;
        }
        return fa;
    }

    @Override
    public boolean updateStatusById(String id, int status) {

        EntityWrapper<TCmsAdv> ew = new EntityWrapper<TCmsAdv>();
        ew.eq("id", id);
        TCmsAdv cmsAdv = new TCmsAdv();
        cmsAdv.setStatus(status);
        int fas = cmsAdvMapper.update(cmsAdv, ew);
        boolean fa = false;
        if (fas == 1) {
            fa = true;
        }
        return fa;

    }
}
