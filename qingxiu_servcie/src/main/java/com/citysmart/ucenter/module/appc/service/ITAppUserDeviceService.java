package com.citysmart.ucenter.module.appc.service;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.entity.vo.DeviceVO;
import com.citysmart.ucenter.mybatis.model.TAppUserDevice;

/**
 * <p>
 * 用戶登陸設備信息 服务类
 * </p>
 *
 * @author ${author}
 * @since 2019-05-07
 */
public interface ITAppUserDeviceService extends IService<TAppUserDevice> {

    Page<DeviceVO> selectPageList(Page<DeviceVO> page, EntityWrapper<TAppUserDevice> ew);

}
