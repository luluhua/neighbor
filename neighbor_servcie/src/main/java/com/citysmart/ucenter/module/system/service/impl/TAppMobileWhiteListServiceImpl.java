package com.citysmart.ucenter.module.system.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.system.service.ITAppMobileWhiteListService;
import com.citysmart.ucenter.mybatis.mapper.TAppMobileWhiteListMapper;
import com.citysmart.ucenter.mybatis.model.TAppMobileWhiteList;
import org.springframework.stereotype.Service;

@Service
public class TAppMobileWhiteListServiceImpl extends ServiceImpl<TAppMobileWhiteListMapper, TAppMobileWhiteList>
        implements ITAppMobileWhiteListService {
}
