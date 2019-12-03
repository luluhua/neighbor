package com.citysmart.ucenter.mybatis.mapper.app;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.mybatis.entity.vo.TAppUserSharelogVo;
import com.citysmart.ucenter.mybatis.model.app.TAppUserSharelog;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2019-09-02
 */
public interface TAppUserSharelogMapper extends BaseMapper<TAppUserSharelog> {

    List<TAppUserSharelogVo> selectTAppUserSharelogVo(Page page, String s);
}
