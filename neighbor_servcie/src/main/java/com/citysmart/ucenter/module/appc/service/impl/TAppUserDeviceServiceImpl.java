package com.citysmart.ucenter.module.appc.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.appc.service.ITAppUserDeviceService;
import com.citysmart.ucenter.mybatis.entity.vo.DeviceVO;
import com.citysmart.ucenter.mybatis.mapper.TAppUserDeviceMapper;
import com.citysmart.ucenter.mybatis.model.TAppUserDevice;
import org.springframework.stereotype.Service;

/**
 * 用户设备登录信息
 * */
@Service
public class TAppUserDeviceServiceImpl extends ServiceImpl<TAppUserDeviceMapper,TAppUserDevice> implements ITAppUserDeviceService {
    @Override
    public Page<DeviceVO> selectPageList(Page<DeviceVO> page, EntityWrapper<TAppUserDevice> ew) {
        StringBuilder sql = new StringBuilder();
        sql.append(" select a.id,a.version,a.pid,a.cid,a.osv,a.osm,a.gid,a.dt_create as dtcreate,b.username from t_app_user_device a left join t_app_user b on a.gid=b.gid ");
        sql.append(" where 1=1 and a.is_deleted=0 ");
        if(ew!=null){
            sql.append(ew.getSqlSelect());
        }
        return page.setRecords(this.baseMapper.selectPageList(page, sql.toString()));
    }
}
