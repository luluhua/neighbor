package com.citysmart.ucenter.module.appc.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.module.appc.service.ITAppApiLogService;
import com.citysmart.ucenter.mybatis.entity.vo.EAppLogVo;
import com.citysmart.ucenter.mybatis.mapper.TAppApiLogMapper;
import com.citysmart.ucenter.mybatis.model.TAppApiLog;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * app接口调用日志 服务实现类
 * </p>
 *
 * @author lub
 * @since 2019-04-04
 */
@Service
public class TAppApiLogServiceImpl extends ServiceImpl<TAppApiLogMapper, TAppApiLog> implements ITAppApiLogService {

    @Override
    public Map<String, Object> queryTopOperApi(Integer type, String param) {
        StringBuffer sql=new StringBuffer("select \n");
        sql.append("title,count(1) as num \n");
        sql.append("from v_api_log_count \n");
        sql.append("where 1=1 and title!='记录统计' \n");
        appendWhere(type,param,sql);
        sql.append("group by title \n");
        sql.append("ORDER BY count(1) desc \n");
        sql.append("limit 20 ");
        List<EAppLogVo> list=this.baseMapper.selectTopOperApi(sql.toString());
        if(list!=null&&list.size()>0){
            String titles="";
            String nums="";
            for(EAppLogVo v:list){
                titles+=v.getTitle()+",";
                nums+=v.getNum()+",";
            }
            if(titles.length()>0){
                titles=titles.substring(0,titles.length()-1);
            }
            if(nums.length()>0){
                nums=nums.substring(0,nums.length()-1);
            }
            Map<String,Object> map=new HashMap<>();
            map.put("titles",titles);
            map.put("nums",nums);
            return map;
        }
        return null;
    }

    @Override
    public Map<String, Object> queryTimeIntervalOperApi(Integer type, String param) {
        StringBuffer sql=new StringBuffer("");
        sql.append("select sd,count(1) as num from \n");
        sql.append("(select \n");
        sql.append("(case when DATE_FORMAT(sj,'%H:%i:%S')>='08:00:00' and DATE_FORMAT(sj,'%H:%i:%S')<='11:59:59' then 1 else \n");
        sql.append("(case when DATE_FORMAT(sj,'%H:%i:%S')>='12:00:00' and DATE_FORMAT(sj,'%H:%i:%S')<='17:59:59' then 2 else \n");
        sql.append("(case when DATE_FORMAT(sj,'%H:%i:%S')>='18:00:00' and DATE_FORMAT(sj,'%H:%i:%S')<='23:59:59' then 3 else 4 end) \n");
        sql.append(" end) end) as sd \n");
        sql.append("from v_api_log_count \n");
        sql.append("where 1=1 and title!='记录统计' \n");
        appendWhere(type,param,sql);
        sql.append(") as a \n");
        sql.append("group by sd \n");
        sql.append("order by sd ");
        List<EAppLogVo> list=this.baseMapper.selectTimeIntervalOperApi(sql.toString());
        if(list!=null&&list.size()>0){
            BigDecimal sum=new BigDecimal("0");
            String nums="";
            for(EAppLogVo v:list){
                nums+=v.getNum()+",";
            }
            if(nums.length()>0){
                nums=nums.substring(0,nums.length()-1);
            }
            Map<String,Object> map=new HashMap<>();
            map.put("sd_value",nums);
            return map;
        }
        return null;
    }

    @Override
    public Map<String, Object> queryTypeOperApi(Integer type, String param) {
        StringBuffer sql=new StringBuffer("");
        sql.append("select a.app_type as typeId,b.label as typename,num from t_sys_dict b,( \n");
        sql.append("select app_type,count(1) as num \n");
        sql.append("from v_api_log_count \n");
        sql.append("where app_type!=0 and title='广告接口' \n");
        appendWhere(type,param,sql);
        sql.append("group by app_type \n");
        sql.append(") a where a.app_type=b.value and b.type='app_type' and b.value!=0 \n");
        sql.append("order by a.app_type \n");
        List<EAppLogVo> list=this.baseMapper.selectTypeOperApi(sql.toString());
        if(list!=null&&list.size()>0){
            BigDecimal sum=new BigDecimal("0");
            String nums="";
            String names="";
            for(EAppLogVo v:list){
                nums+=v.getNum()+",";
                names+=v.getTypename()+",";
            }
            if(nums.length()>0){
                nums=nums.substring(0,nums.length()-1);
            }
            if(names.length()>0){
                names=names.substring(0,names.length()-1);
            }
            Map<String,Object> map=new HashMap<>();
            map.put("type_value",nums);
            map.put("type_name",names);
            return map;
        }
        return null;
    }

    private StringBuffer appendWhere(Integer type, String param,StringBuffer sql){
        if(type!=null){
            if(type.intValue()==1){
                //本年
                sql.append("and DATE_FORMAT(sj,'%Y')=DATE_FORMAT(now(),'%Y') \n");
            }else if(type.intValue()==2){
                //本月
                sql.append("and DATE_FORMAT(sj,'%Y-%m')=DATE_FORMAT(now(),'%Y-%m') \n");
            }else if(type.intValue()==3){
                //本周
                sql.append("and YEARWEEK(date_format(sj,'%Y-%m-%d'))=YEARWEEK(date_format(now(),'%Y-%m-%d')) \n");
            }else if(type.intValue()==4){
                //本日
                sql.append("and DATE_FORMAT(sj,'%Y-%m-%d')=DATE_FORMAT(NOW(),'%Y-%m-%d') \n");
            }else if(type.intValue()==5&&param!=null){
                //自定义
                if (StringUtils.isNotBlank(param)){
                    String[] dateranges = StringUtils.split(param, "-");
                    sql.append("and sj>='"+dateranges[0].trim().replaceAll("/", "-") + " 00:00:00"+"' \n");
                    sql.append("and sj<='"+dateranges[1].trim().replaceAll("/", "-") + " 23:59:59"+"' \n");
                }else{
                    sql.append("and DATE_FORMAT(sj,'%Y-%m-%d')=DATE_FORMAT(NOW(),'%Y-%m-%d') \n");
                }
            }else{
                sql.append("and DATE_FORMAT(sj,'%Y')=DATE_FORMAT(now(),'%Y') \n");
            }
        }else{
            sql.append("and DATE_FORMAT(sj,'%Y')=DATE_FORMAT(now(),'%Y') \n");
        }
        return sql;
    }
}
