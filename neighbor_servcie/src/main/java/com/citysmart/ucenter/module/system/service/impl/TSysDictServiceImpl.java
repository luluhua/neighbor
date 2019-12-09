package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.system.service.ITSysDictService;
import com.citysmart.ucenter.mybatis.mapper.TSysDictMapper;
import com.citysmart.ucenter.mybatis.model.TSysDict;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Service
public class TSysDictServiceImpl extends ServiceImpl<TSysDictMapper, TSysDict> implements ITSysDictService {
    @Override
    public TSysDict selectByTypeAndLabel(String type, String label) {
        TSysDict ew = new TSysDict();
        ew.setType(type);
        ew.setLabel(label);
        TSysDict dict = this.baseMapper.selectOne(ew);
        return dict;
    }

    @Override
    public TSysDict selectByTypeAndValue(String type, String value) {
        TSysDict ew = new TSysDict();
        ew.setType(type);
        ew.setValue(value);
        TSysDict dict = this.baseMapper.selectOne(ew);
        return dict;
    }

    @Override
    public TSysDict selectByTypeAndCode(String type, String code) {
        TSysDict ew = new TSysDict();
        ew.setType(type);
        ew.setCode(code);
        TSysDict dict = this.baseMapper.selectOne(ew);
        return dict;
    }
}
