package com.citysmart.ucenter.module.commodity.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.module.commodity.service.ITGoodsGradeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.entity.vo.GoodsGradeVo;
import com.citysmart.ucenter.mybatis.entity.vo.SysRoleQueryVo;
import com.citysmart.ucenter.mybatis.mapper.commodity.TGoodsGradeMapper;
import com.citysmart.ucenter.mybatis.model.SysRole;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsGrade;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 物品评分表 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
@Service
public class TGoodsGradeServiceImpl extends ServiceImpl<TGoodsGradeMapper, TGoodsGrade> implements ITGoodsGradeService {


    @Override
    public Page<GoodsGradeVo> getGradeListByGoodsId(Page page, String goodsId) {

        return page.setRecords(this.baseMapper.getGradeListByGoodsId(page, goodsId));
    }

}
