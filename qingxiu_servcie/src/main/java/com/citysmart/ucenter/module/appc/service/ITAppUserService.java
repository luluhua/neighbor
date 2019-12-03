package com.citysmart.ucenter.module.appc.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.entity.vo.EPublicVo;
import com.citysmart.ucenter.mybatis.model.TAppUser;

import java.util.List;

/**
 * <p>
 * app 注册用户信息表 服务类
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
public interface ITAppUserService extends IService<TAppUser> {

    Integer updatePhone(String phone, String gid);

    String getcontactPhone(String guid);

    Integer updatePasswird(String password, String guid);

    Integer updateAvatar(String avatar, Integer id);

    Integer updateAuthStatusByCardID(Integer status, String idCard);

    List<TAppUser> selectUserByUseridsds(String appuser);

    /**
     * 每日用户增长数量统计
     * */
    List<EPublicVo> countUserCreateByDay(String time);

    /**
     * 安全认证、非安全认证用户数量统计
     * */
    List<EPublicVo> countUserAuthStatus();

    /**
     * 内部、普通用户数量统计
     * */
    List<EPublicVo> countUserAccountType();

    /**
     * 个人、企业用户统计
     * */
    List<EPublicVo> countUserByUserType();

    /**
     * 累计注册用户数
     * */
    Integer countTotalUserNum();

    /**
     * 今日新增用户数
     * */
    Integer counTodayUserNum();

    /**
     * 按日统计用户、用户增长(分页查询)
     * */
    Page<EPublicVo> countCreateNumListByDay(Page page);

    /**
     * 数据中心--平台用户--每月新增用户（折线）
     * */
    List<EPublicVo> countCreateNumListByMonth();
}
