package com.citysmart.ucenter.mybatis.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.ucenter.mybatis.entity.vo.EPublicVo;
import com.citysmart.ucenter.mybatis.model.TAppUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * app 注册用户信息表 Mapper 接口
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
public interface TAppUserMapper extends BaseMapper<TAppUser> {

    Integer booleanBysql(String sql);

    String getcontactPhone(String sql);

    String getUserName(Integer apuId);

    List<TAppUser> selectUserByUseridsds(@Param("userids") String userid);

    /**
     * 每日用户增长数量统计
     * */
    List<EPublicVo> countUserCreateByDay(@Param("sql") String sql);

    /**
     * 安全认证、非安全认证用户数量统计
     * */
    List<EPublicVo> countUserAuthStatus(@Param("sql") String sql);

    /**
     * 内部、普通用户数量统计
     * */
    List<EPublicVo> countUserAccountType(@Param("sql") String sql);

    /**
     * 个人、企业用户统计
     * */
    List<EPublicVo> countUserByUserType(@Param("sql") String sql);

    /**
     * 累计注册用户数
     * */
    Integer countTotalUserNum(@Param("sql") String sql);

    /**
     * 今日新增用户数
     * */
    Integer counTodayUserNum(@Param("sql") String sql);

    /**
     * 按日统计用户、用户增长(分页查询)
     * */
    List<EPublicVo> countCreateNumListByDay(Page page, @Param("sql") String sql);

    /**
     * 用户统计统一接口
     * */
    List<EPublicVo> countAllStatistics(@Param("sql") String sql);
}