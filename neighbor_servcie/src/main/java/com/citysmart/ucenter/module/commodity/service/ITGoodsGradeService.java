package com.citysmart.ucenter.module.commodity.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.entity.vo.GoodsGradeVo;
import com.citysmart.ucenter.mybatis.entity.vo.SysRoleQueryVo;
import com.citysmart.ucenter.mybatis.model.SysRole;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsGrade;

/**
 * <p>
 * 物品评分表 服务类
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
public interface ITGoodsGradeService extends IService<TGoodsGrade> {

    Page<GoodsGradeVo> getGradeListByGoodsId(Page page, String goodsId);

}
