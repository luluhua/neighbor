package com.citysmart.ucenter.module.appc.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.appc.service.ITAppUserService;
import com.citysmart.ucenter.mybatis.entity.vo.EPublicVo;
import com.citysmart.ucenter.mybatis.mapper.TAppUserMapper;
import com.citysmart.ucenter.mybatis.model.TAppUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * app 注册用户信息表 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@Service
public class TAppUserServiceImpl extends ServiceImpl<TAppUserMapper, TAppUser> implements ITAppUserService {

    @Autowired
    TAppUserMapper appUserMapper;

    @Override
    public Integer updatePhone(String phone, String guid) {
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE t_app_user a SET a.mobile ='").append(phone).append("' WHERE a.guid =").append(guid);
        return appUserMapper.booleanBysql(sql.toString());
    }

    @Override
    public String getcontactPhone(String guid) {
        StringBuilder sql = new StringBuilder();
        sql.append("select contact_phone from t_company_info where userId=(");
        sql.append("select id  from t_app_user where gid = ").append(guid).append(")");
        String g = appUserMapper.getcontactPhone(sql.toString());
        return g;
    }

    @Override
    public Integer updatePasswird(String password, String guid) {
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE t_app_user a SET a.password ='").append(password).append("' WHERE a.guid =").append(guid);
        return appUserMapper.booleanBysql(sql.toString());
    }

    @Override
    public Integer updateAvatar(String avatar, Integer id) {
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("UPDATE t_app_user a SET a.avatar ='").append(avatar).append("'  WHERE a.id =").append(id);
            return appUserMapper.booleanBysql(sql.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 根据身份证id更新认证状态
     */
    @Override
    public Integer updateAuthStatusByCardID(Integer status, String idCard) {
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("UPDATE t_app_user a SET a.auth_status =").append(status).append("  WHERE a.id_card ='").append(idCard).append("'");
            return appUserMapper.booleanBysql(sql.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }


    @Override
    public List<TAppUser> selectUserByUseridsds(String userid) {

        return appUserMapper.selectUserByUseridsds(userid);

    }

    /**
     * 每日用户增长数量统计
     */
    @Override
    public List<EPublicVo> countUserCreateByDay(String time) {
        StringBuffer sql = new StringBuffer("");
        sql.append("select DATE_FORMAT(dt_create,'%Y-%m-%d') as sj,count(1) as num from t_app_user \n");
        sql.append("where is_deleted=0 \n");
        sql.append("and DATE_FORMAT(dt_create,'%Y-%m')='" + time + "' \n");
        sql.append("group by DATE_FORMAT(dt_create,'%Y-%m-%d') \n");
        sql.append("order by DATE_FORMAT(dt_create,'%Y-%m-%d') \n");
        return this.baseMapper.countUserCreateByDay(sql.toString());
    }

    /**
     * 安全认证、非安全认证用户数量统计
     */
    @Override
    public List<EPublicVo> countUserAuthStatus() {
        StringBuffer sql = new StringBuffer("");
        sql.append("select a.label as title,count(1) as num from t_sys_dict a \n");
        sql.append("left join t_app_user b on a.value=b.auth_status \n");
        sql.append("where a.type='auth_status' \n");
        sql.append("and b.is_deleted=0 \n");
        sql.append("and a.is_deleted=0 \n");
        sql.append("group by b.auth_status \n");
        sql.append("order by a.value");
        return this.baseMapper.countUserAuthStatus(sql.toString());
    }

    /**
     * 内部、普通用户数量统计
     */
    @Override
    public List<EPublicVo> countUserAccountType() {
        StringBuffer sql = new StringBuffer("");
        sql.append("select a.label as title,(case when b.num is null then 0 else b.num end) as num \n");
        sql.append("from t_sys_dict a \n");
        sql.append("left join ( \n");
        sql.append("select account_type,count(1) as num from t_app_user \n");
        sql.append("where is_deleted=0 \n");
        sql.append("group by account_type ) b \n");
        sql.append("on a.value=b.account_type \n");
        sql.append("where a.type='app_account_type' \n");
        sql.append("and a.is_deleted=0 \n");
        sql.append("order by a.value \n");
        return this.baseMapper.countUserAccountType(sql.toString());
    }

    /**
     * 个人、企业用户统计
     */
    @Override
    public List<EPublicVo> countUserByUserType() {
        StringBuffer sql = new StringBuffer("");
        sql.append("select a.label as title,(case when b.num is null then 0 else b.num end) as num \n");
        sql.append("from t_sys_dict a \n");
        sql.append("left join ( \n");
        sql.append("select user_type,count(1) as num from t_app_user \n");
        sql.append("where is_deleted=0 \n");
        sql.append("group by user_type ) b \n");
        sql.append("on a.value=b.user_type \n");
        sql.append("where a.type='user_type' \n");
        sql.append("and a.is_deleted=0 \n");
        sql.append("order by a.value \n");
        return this.baseMapper.countUserByUserType(sql.toString());
    }

    @Override
    public Integer countTotalUserNum() {
        StringBuffer sql = new StringBuffer("");
        sql.append("select count(1) as num from t_app_user \n");
        sql.append("where is_deleted=0 and `status`=0 ");
        return this.baseMapper.countTotalUserNum(sql.toString());
    }

    @Override
    public Integer counTodayUserNum() {
        StringBuffer sql = new StringBuffer("");
        sql.append("select count(1) as num from t_app_user \n");
        sql.append("where is_deleted=0 and `status`=0 \n");
        sql.append("and DATE_FORMAT(dt_create,'%Y-%m-%d')=DATE_FORMAT(now(),'%Y-%m-%d') \n");
        return this.baseMapper.counTodayUserNum(sql.toString());
    }

    @Override
    public Page<EPublicVo> countCreateNumListByDay(Page page) {
        StringBuffer sql = new StringBuffer("");
        sql.append("select DATE_FORMAT(a.dt_create,'%Y-%m-%d') as sj, \n");
        sql.append("(select count(1) from t_app_user b \n");
        sql.append("where DATE_FORMAT(b.dt_create,'%Y-%m-%d')<=DATE_FORMAT(a.dt_create,'%Y-%m-%d') \n");
        sql.append("and b.is_deleted=0 and b.status=0) as num, \n");
        sql.append("count(1) as othernum \n");
        sql.append("from t_app_user a \n");
        sql.append("where a.is_deleted=0 and a.status=0 \n");
        sql.append("group by DATE_FORMAT(a.dt_create,'%Y-%m-%d') desc \n");
        return page.setRecords(this.baseMapper.countCreateNumListByDay(page, sql.toString()));
    }

    /**
     * 数据中心--平台用户--每月新增用户（折线）
     */
    @Override
    public List<EPublicVo> countCreateNumListByMonth() {
        StringBuffer sql = new StringBuffer("");
        sql.append("select DATE_FORMAT(a.dt_create,'%c') as sj, \n");
        sql.append("count(1) as othernum \n");
        sql.append("from t_app_user a \n");
        sql.append("where a.is_deleted=0 and a.status=0 \n");
        sql.append("group by DATE_FORMAT(a.dt_create,'-%c') desc \n");
        return this.baseMapper.countAllStatistics(sql.toString());
    }


}
