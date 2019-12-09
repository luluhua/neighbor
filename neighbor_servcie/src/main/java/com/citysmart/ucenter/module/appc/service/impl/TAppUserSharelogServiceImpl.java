package com.citysmart.ucenter.module.appc.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.appc.service.ITAppUserSharelogService;
import com.citysmart.ucenter.mybatis.entity.vo.TAppUserSharelogSelectVo;
import com.citysmart.ucenter.mybatis.entity.vo.TAppUserSharelogVo;
import com.citysmart.ucenter.mybatis.mapper.app.TAppUserSharelogMapper;
import com.citysmart.ucenter.mybatis.model.app.TAppUserSharelog;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2019-09-02
 */
@Service
public class TAppUserSharelogServiceImpl extends ServiceImpl<TAppUserSharelogMapper, TAppUserSharelog> implements
                                                                                                       ITAppUserSharelogService {

    @Override
    public Page<TAppUserSharelogVo> selectTAppUserSharelogVoPage(Page page,TAppUserSharelogSelectVo tAppUserSharelogSelectVo) {
        StringBuilder sql = new StringBuilder();
        sql.append("select u.mobile as mobile,sl.id as id,sl.gid as gid,sl.dt_create as dtCreate,sl.share_num as shareNum," +
                           "sl.share_code as shareCode,sl.browse_num as browseNum," +
                           "sl.dowload_num as dowloadNum,sl.activation_num as activationNum ,sl.is_deleted as isDeleted" +
                           " from t_app_user_sharelog sl LEFT JOIN t_app_user u on sl.gid=u.gid where sl.is_deleted=0");
        if(StringUtils.isNotBlank(tAppUserSharelogSelectVo.getSearch())){
        sql.append(" and sl.share_code LIKE '%"+tAppUserSharelogSelectVo.getSearch()+"%'");
        }
        if(StringUtils.isNotBlank(tAppUserSharelogSelectVo.getMobile())){
            sql.append(" and u.mobile LIKE '%"+tAppUserSharelogSelectVo.getMobile()+"%'");
        }
//        if (StringUtils.isNotBlank(tAppUserSharelogSelectVo.getStartTime())&&StringUtils.isNotBlank(tAppUserSharelogSelectVo.getEndTime())){
//            StringBuffer sqlWhere = new StringBuffer(" and ( ");
//            sqlWhere.append(" sl.dt_create >= '")
//                    .append(tAppUserSharelogSelectVo.getStartTime())
//                    .append("' and sl.dt_create <= '")
//                    .append(tAppUserSharelogSelectVo.getEndTime())
//                    .append("') \n");
//            sql.append(sqlWhere);
//        }
        if(tAppUserSharelogSelectVo!=null&&tAppUserSharelogSelectVo.getStartTime()!=null
                &&StringUtils.isNotBlank(tAppUserSharelogSelectVo.getStartTime())){
            sql.append(" and DATE_FORMAT(sl.dt_create,'%Y-%m-%d') >='"+tAppUserSharelogSelectVo.getStartTime()+"'  ");
        }
        if(tAppUserSharelogSelectVo!=null&&tAppUserSharelogSelectVo.getEndTime()!=null
                &&StringUtils.isNotBlank(tAppUserSharelogSelectVo.getEndTime())){
            sql.append(" and DATE_FORMAT(sl.dt_create,'%Y-%m-%d') <='"+tAppUserSharelogSelectVo.getEndTime()+"'  ");
        }
        return page.setRecords(this.baseMapper.selectTAppUserSharelogVo(page, sql.toString()));
    }
}
