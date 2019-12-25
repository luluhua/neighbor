package com.citysmart.ucenter.mybatis.mapper.commodity;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.mybatis.entity.vo.GoodsGradeVo;
import com.citysmart.ucenter.mybatis.entity.vo.SysRoleQueryVo;
import com.citysmart.ucenter.mybatis.model.SysRole;
import com.citysmart.ucenter.mybatis.model.commodity.TGoodsGrade;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 物品评分表 Mapper 接口
 * </p>
 *
 * @author lub
 * @since 2019-12-04
 */
public interface TGoodsGradeMapper extends BaseMapper<TGoodsGrade> {


    List<GoodsGradeVo> getGradeListByGoodsId(@Param("page") Page page, @Param("goodsId") String goodsId);

}
