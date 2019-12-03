package com.citysmart.ucenter.module.appc.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.toolkit.CollectionUtils;
import com.citysmart.ucenter.module.appc.service.ITAppPageOperationStatisticsService;
import com.citysmart.ucenter.mybatis.entity.vo.AppPageOperationStatisticsVo;
import com.citysmart.ucenter.mybatis.mapper.app.TAppPageOperationStatisticsMapper;
import com.citysmart.ucenter.mybatis.model.app.TAppPageOperationStatistics;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.citysmart.ucenter.module.appc.constants.OperationStatisticsConstants.*;

/**
 * <p>
 * 用户行为统计分析 服务实现类
 * </p>
 *
 * @author zhouyanjian
 * @since 2019-08-30
 */
@Service
public class TAppPageOperationStatisticsServiceImpl extends ServiceImpl<TAppPageOperationStatisticsMapper, TAppPageOperationStatistics> implements
                                                                                                                                        ITAppPageOperationStatisticsService {
    /**
     * 1、使用设备数统计：ip、系统版本、设备名相同视为一个设备
     * @param date 统计时间
     * @return
     */
    @Override
    public boolean sticsMobileCount(@NotNull Date date){
        Integer group = formatGroup(date);
        String type = type_stics_mobile_count;
        String name = "使用设备数统计";
        EntityWrapper<TAppPageOperationStatistics> wrapper = new EntityWrapper<>();
        wrapper.eq("GROUP_", group);
        wrapper.eq("TYPE_", type);
        int row = this.selectCount(wrapper);
        if(row > 0) {
            //已经统计过
            return true;
        }
        TAppPageOperationStatistics params = new TAppPageOperationStatistics();

        params.setGroupDateStr(formatParamDate(date));
        List<AppPageOperationStatisticsVo> list = baseMapper.sticsMobileCountV2(params);
        int count = 0;
        int sum = 0;
        BigDecimal avg = new BigDecimal(0);
        if(!CollectionUtils.isEmpty(list)){
            for(AppPageOperationStatisticsVo item : list){
                sum += item.getSum();
            }
        }
        count = list.size();
        if(count > 0 && sum > 0) {
            BigDecimal cd = new BigDecimal(count);
            BigDecimal sd = new BigDecimal(sum);
            avg = sd.divide(cd, 2, RoundingMode.HALF_DOWN);
        }
        params.setCount(count);
        params.setSum(sum);
        params.setAvg(avg);

        params.setGroup(group);
        params.setType(type);
        params.setName(name);
        params.setValue("mobile_count");
        params.setGroupDate(date);
        baseMapper.insert(params);
        return true;
    }

    /**
     * 2、栏目点击数统计：按key统计
     * @param date 统计时间
     * @return
     */
    @Override
    public boolean sticsKeyCount(@NotNull Date date){
        Integer group = formatGroup(date);
        String type = type_stics_key_count;
        String name = "栏目/功能点击数统计";
        EntityWrapper<TAppPageOperationStatistics> wrapper = new EntityWrapper<>();
        wrapper.eq("GROUP_", group);
        wrapper.eq("TYPE_", type);
        int row = this.selectCount(wrapper);
        if(row > 0) {
            //已经统计过
            return true;
        }
        TAppPageOperationStatistics params = new TAppPageOperationStatistics();
        params.setGroupDateStr(formatParamDate(date));
        List<AppPageOperationStatisticsVo> listVo = baseMapper.sticsKeyCount(params);
        if(CollectionUtils.isEmpty(listVo)){
            //无数据可统计
            return true;
        }
        List<TAppPageOperationStatistics> list = new ArrayList<>();
        TAppPageOperationStatistics item;
        for(AppPageOperationStatisticsVo vo : listVo){
            item = new TAppPageOperationStatistics();
            item.setValue(vo.getValue());
            item.setCount(vo.getCount());
            item.setName(name);
            item.setGroup(group);
            item.setType(type);
            item.setGroupDate(date);
            BigDecimal avg = new BigDecimal(0);
            if(null == vo.getSum()){
                item.setSum(0);
            }else{
                item.setSum(vo.getSum());
            }
            if(item.getCount() > 0 && item.getSum() > 0) {
                BigDecimal cd = new BigDecimal(item.getCount());
                BigDecimal sd = new BigDecimal(item.getSum());
                avg = sd.divide(cd, 2, RoundingMode.HALF_DOWN);
            }
            item.setAvg(avg);
            list.add(item);
        }
        this.insertBatch(list);
        return true;
    }

    /**
     * 3、模块点击数统计：按model统计
     * @param date 统计时间
     * @return
     */
    @Override
    public boolean sticsModelCount(@NotNull Date date){
        Integer group = formatGroup(date);
        String type = type_stics_model_count;
        String name = "模块点击数统计";
        EntityWrapper<TAppPageOperationStatistics> wrapper = new EntityWrapper<>();
        wrapper.eq("GROUP_", group);
        wrapper.eq("TYPE_", type);
        int row = this.selectCount(wrapper);
        if(row > 0) {
            //已经统计过
            return true;
        }
        TAppPageOperationStatistics params = new TAppPageOperationStatistics();
        params.setGroupDateStr(formatParamDate(date));
        List<AppPageOperationStatisticsVo> listVo = baseMapper.sticsModelCount(params);
        if(CollectionUtils.isEmpty(listVo)){
            //无数据可统计
            return true;
        }
        List<TAppPageOperationStatistics> list = new ArrayList<>();
        TAppPageOperationStatistics item;
        for(AppPageOperationStatisticsVo vo : listVo){
            item = new TAppPageOperationStatistics();
            item.setValue(vo.getValue());
            item.setCount(vo.getCount());
            item.setName(name);
            item.setGroup(group);
            item.setType(type);
            item.setGroupDate(date);
            BigDecimal avg = new BigDecimal(0);
            if(null == vo.getSum()){
                item.setSum(0);
            }else{
                item.setSum(vo.getSum());
            }
            if(item.getCount() > 0 && item.getSum() > 0) {
                BigDecimal cd = new BigDecimal(item.getCount());
                BigDecimal sd = new BigDecimal(item.getSum());
                avg = sd.divide(cd, 2, RoundingMode.HALF_DOWN);
            }
            item.setAvg(avg);
            list.add(item);
        }
        this.insertBatch(list);
        return true;
    }

    /**
     * 4、栏目使用平均时长：排除0时长的记录
     * @param date 统计时间
     * @return
     */
    @Override
    public boolean sticsKeyUseAvg(@NotNull Date date){
        Integer group = formatGroup(date);
        String type = type_stics_key_use_avg;
        String name = "栏目/功能使用平均时长";
        EntityWrapper<TAppPageOperationStatistics> wrapper = new EntityWrapper<>();
        wrapper.eq("GROUP_", group);
        wrapper.eq("TYPE_", type);
        int row = this.selectCount(wrapper);
        if(row > 0) {
            //已经统计过
            return true;
        }
        TAppPageOperationStatistics params = new TAppPageOperationStatistics();
        params.setGroupDateStr(formatParamDate(date));
        List<AppPageOperationStatisticsVo> listVo = baseMapper.sticsKeyUseAvg(params);
        if(CollectionUtils.isEmpty(listVo)){
            //无数据可统计
            return true;
        }
        List<TAppPageOperationStatistics> list = new ArrayList<>();
        TAppPageOperationStatistics item;
        for(AppPageOperationStatisticsVo vo : listVo){
            item = new TAppPageOperationStatistics();
            item.setValue(vo.getValue());
            item.setCount(vo.getCount());
            item.setName(name);
            item.setGroup(group);
            item.setType(type);
            item.setGroupDate(date);
            BigDecimal avg = new BigDecimal(0);
            if(null == vo.getSum()){
                item.setSum(0);
            }else{
                item.setSum(vo.getSum());
            }
            if(item.getCount() > 0 && item.getSum() > 0) {
                BigDecimal cd = new BigDecimal(item.getCount());
                BigDecimal sd = new BigDecimal(item.getSum());
                avg = sd.divide(cd, 2, RoundingMode.HALF_DOWN);
            }
            item.setAvg(avg);
            list.add(item);
        }
        this.insertBatch(list);
        return true;
    }

    /**
     * 5、时段使用频率统计：每小时统计记录时长
     * @param date 统计时间
     * @return
     */
    @Override
    public boolean sticsKeyHourAvg(@NotNull Date date){
        Integer group = formatGroup(date);
        String type = type_stics_key_hour_avg;
        String name = "每小时使用频率统计";
        EntityWrapper<TAppPageOperationStatistics> wrapper = new EntityWrapper<>();
        wrapper.eq("GROUP_", group);
        wrapper.eq("TYPE_", type);
        int row = this.selectCount(wrapper);
        if(row > 0) {
            //已经统计过
            return true;
        }
        TAppPageOperationStatistics params = new TAppPageOperationStatistics();
        params.setGroupDateStr(formatParamDate(date));
        List<AppPageOperationStatisticsVo> listVo = baseMapper.sticsKeyHourCount(params);
        if(CollectionUtils.isEmpty(listVo)){
            //无数据可统计
            return true;
        }
        int clickTotal = 0;
        List<TAppPageOperationStatistics> list = new ArrayList<>();
        TAppPageOperationStatistics item;
        for(AppPageOperationStatisticsVo vo : listVo){
            //排除统计是0的数据
            if(vo.getCount() == 0){
                continue;
            }
            item = new TAppPageOperationStatistics();
            item.setValue(vo.getValue());
            item.setCount(vo.getCount());
            item.setName(name);
            item.setGroup(group);
            item.setType(type);
            item.setGroupDate(date);
            BigDecimal avg = new BigDecimal(0);
            if(null == vo.getSum()){
                item.setSum(0);
            }else{
                item.setSum(vo.getSum());
            }
            if(item.getCount() > 0 && item.getSum() > 0) {
                BigDecimal cd = new BigDecimal(item.getCount());
                BigDecimal sd = new BigDecimal(item.getSum());
                avg = sd.divide(cd, 2, RoundingMode.HALF_DOWN);
            }
            item.setAvg(avg);
            list.add(item);
            clickTotal += item.getCount();
        }
        if(clickTotal > 0) {
            //有点击数才保存
            this.insertBatch(list);
        }
        return true;
    }

    /**
     * 6、app使用平均周期：使用lifecycle来统计
     * @param date 统计时间
     * @return
     */
    @Override
    public boolean sticsLifecycleHourAvg(@NotNull Date date){
        Integer group = formatGroup(date);
        String type = type_stics_lifecycle_hour_avg;
        String name = "app使用平均周期";
        EntityWrapper<TAppPageOperationStatistics> wrapper = new EntityWrapper<>();
        wrapper.eq("GROUP_", group);
        wrapper.eq("TYPE_", type);
        int row = baseMapper.selectCount(wrapper);
        if(row > 0) {
            //已经统计过
            return true;
        }
        TAppPageOperationStatistics params = new TAppPageOperationStatistics();
        params.setGroupDateStr(formatParamDate(date));
        List<AppPageOperationStatisticsVo> listVo = baseMapper.sticsLifecycleHourAvg(params);
        if(CollectionUtils.isEmpty(listVo)){
            //无数据可统计
            return true;
        }
        int count = 0;
        int sum = 0;
        BigDecimal avg = new BigDecimal(0);
        for(AppPageOperationStatisticsVo item : listVo){
            if(item.getCount() != null) {
                count += item.getCount();
            }
            if(item.getSum() != null) {
                sum += item.getSum();
            }
        }
        if(count == 0){
            return true;
        }
        if(count > 0 && sum > 0) {
            BigDecimal cd = new BigDecimal(count);
            BigDecimal sd = new BigDecimal(sum);
            avg = sd.divide(cd, 2, RoundingMode.HALF_DOWN);
        }
        params.setCount(count);
        params.setSum(sum);
        params.setAvg(avg);

        params.setGroup(group);
        params.setType(type);
        params.setName(name);
        params.setValue("lifecycle");
        params.setGroupDate(date);
        baseMapper.insert(params);
        return true;
    }

    private Integer formatGroup(@NotNull Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        return Integer.valueOf(sdf.format(date));
    }

    private String formatParamDate(@NotNull Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }
}
