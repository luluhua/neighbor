package com.citysmart.ucenter.mybatis.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.mybatis.entity.vo.DeviceVO;
import com.citysmart.ucenter.mybatis.model.TAppUserDevice;

import java.util.List;

/**
 * <p>
 * 用戶登陸設備信息 Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2019-05-07
 */
public interface TAppUserDeviceMapper extends BaseMapper<TAppUserDevice> {
    List<DeviceVO> selectPageList(Page<DeviceVO> page, String s);
}
