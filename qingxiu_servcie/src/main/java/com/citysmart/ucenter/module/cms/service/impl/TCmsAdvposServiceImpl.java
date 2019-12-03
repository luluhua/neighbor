package com.citysmart.ucenter.module.cms.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.cms.service.ITCmsAdvposService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.mapper.TCmsAdvMapper;
import com.citysmart.ucenter.mybatis.mapper.TCmsAdvposMapper;
import com.citysmart.ucenter.mybatis.model.TCmsAdv;
import com.citysmart.ucenter.mybatis.model.TCmsAdvpos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 广告位表 服务实现类
 *
 * @author lub
 * @since 2019-03-04
 */
@Service
public class TCmsAdvposServiceImpl extends ServiceImpl<TCmsAdvposMapper, TCmsAdvpos> implements ITCmsAdvposService {

    @Autowired
    TCmsAdvposMapper cmsAdvposMapper;
    @Autowired
    public TCmsAdvMapper cmsAdvMapper;

    @Override
    public Boolean updateIsDeletedById(String id) {

        EntityWrapper<TCmsAdv> ew = new EntityWrapper<TCmsAdv>();
        boolean fa = false;
        ew.eq("advpos_id", id);
        TCmsAdv cmsAdv = new TCmsAdv();
        cmsAdv.setIsDeleted(Delete.已删除.getValue());
        int adv = cmsAdvMapper.update(cmsAdv, ew);

        EntityWrapper<TCmsAdvpos> posew = new EntityWrapper<TCmsAdvpos>();
        posew.eq("id", id);
        TCmsAdvpos cmsAdvpos = new TCmsAdvpos();
        cmsAdvpos.setIsDeleted(Delete.已删除.getValue());
        int fas = cmsAdvposMapper.update(cmsAdvpos, posew);
        if (fas == 1) {
            fa = true;
        }

        return fa;
    }
}
