package com.citysmart.ucenter.module.appc.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.json.JsonResult;
import com.citysmart.common.json.JsonSuccessResult;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.appc.service.ITAppPageOperationLogService;
import com.citysmart.ucenter.module.appc.service.ITAppPageOperationStatisticsService;
import com.citysmart.ucenter.mybatis.model.app.TAppPageOperationLog;
import com.citysmart.ucenter.mybatis.model.app.TAppPageOperationStatistics;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.citysmart.ucenter.module.appc.constants.OperationStatisticsConstants.*;


/**
 * <p>
 * app用户行为日志 前端控制器
 * </p>
 *
 * @author zhouyanjian
 * @since 2019-08-29
 */
@Controller
@RequestMapping("/appc/tAppPageOperationStatistics")
public class TAppPageOperationStatisticsController extends SuperController {

    @Autowired
    public ITAppPageOperationStatisticsService service;

    @Autowired
    public ITAppPageOperationLogService operationLogService;

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "15") Integer pageSize,
                       String search, Model model) {
        Page<TAppPageOperationStatistics> page = getPage(pageNumber, pageSize);
        model.addAttribute("pageSize", pageSize);
        // 查询分页
        EntityWrapper<TAppPageOperationStatistics> ew = new EntityWrapper<TAppPageOperationStatistics>();
        if (StringUtils.isNotBlank(search)) {
            model.addAttribute("search", search);
            ew.where(
                    "(`NAME_` LIKE CONCAT('%',{0},'%') OR `TYPE_` LIKE CONCAT('%',{1},'%') OR `VALUE_` LIKE CONCAT('%',{2},'%'))",
                    search, search, search);
        }
        ew.orderBy("GROUP_", false);
        ew.orderBy("TYPE_", true);
        Page<TAppPageOperationStatistics> pageData = service.selectPage(page, ew);
        model.addAttribute("pageData", pageData);
        return "/appc/tapppageoperationstatistics/list";
    }

    /**
     * 删除app用户行为日志
     */
    @RequiresPermissions("deleteTAppPageOperationStatistics")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除app用户行为统计")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }


    @RequestMapping("/execute")
    @ResponseBody
    public Rest execute() {
        Date dt = diffDay(new Date(), 1);
        EntityWrapper<TAppPageOperationLog> ew = new EntityWrapper<>();
        ew.eq("model", "lifecycle");
        ew.where("dt_create = (SELECT min(`dt_create`) FROM t_app_page_operation_log WHERE model = {0})","lifecycle");
        TAppPageOperationLog minLog = operationLogService.selectOne(ew);
        if(minLog == null){
            return Rest.failure("没有日志数据");
        }
        Date beginDate = minLog.getDtCreate();
        String beginMMdd = formatMMdd(beginDate);
        String endMMdd = formatMMdd(dt);
        boolean isEQ = true;
        while (isEQ){
            System.out.println("执行统计【"+beginMMdd+"】的行为日志");
            try {
                service.sticsKeyCount(beginDate);
                service.sticsKeyHourAvg(beginDate);
                service.sticsKeyUseAvg(beginDate);
                service.sticsLifecycleHourAvg(beginDate);
                service.sticsMobileCount(beginDate);
                service.sticsModelCount(beginDate);
            } catch (Exception e) {
                e.printStackTrace();
            }
            isEQ = !beginMMdd.equals(endMMdd);
            beginDate = addDay(beginDate, 1);
            beginMMdd = formatMMdd(beginDate);
        }

        return Rest.ok();
    }

    // -------------------------
    // 统计视图
    // -------------------------
    @RequestMapping("/chart/index")
    public String chartIndex(Integer timeType, Model model) {
        Date nowDate = new Date();
        Date endDate = diffDay(nowDate, 1);
//        Date endDate = nowDate;
//        Date beginDate = endDate;
        Integer boxHeight = 300;
        if (timeType == null) {
            timeType = 7;
        } else if (timeType == 15) {
            //15天
            boxHeight = boxHeight + 150;
        } else if (timeType == 30) {
            //30天
            boxHeight = boxHeight + 300;
        } else {
            //默认7天
            timeType = 7;
        }
        Date beginDate = diffDay(endDate, timeType - 1);
        model.addAttribute("timeType", timeType);
        model.addAttribute("boxHeight", boxHeight);

        model.addAttribute("beginDate", beginDate);
        model.addAttribute("endDate", endDate);
        /*
         * 1.最近m天设备数统计
         */
        jsonMobileCountByDays(beginDate, endDate, model);
        /*
         * 2、栏目点击数统计：按key统计
         */
        jsonKeyCountByDay(beginDate, endDate, model);
        /*
         * 3、模块点击数统计：按model统计
         */
        jsonModelCountByDay(beginDate, endDate, model);
        /*
         * 4、栏目使用平均时长：排除0时长的记录
         */
        jsonKeyUseAvgByDay(beginDate, endDate, model);
        /*
         * 5、时段使用频率统计：每小时统计记录时长
         */
        jsonKeyHourAvgByDay(beginDate, endDate, model);
        /*
         * 6、app使用平均周期：使用lifecycle来统计
         */
        jsonLifecycleHourAvgByDays(beginDate, endDate, model);

        return "/echarts/tapppageoperationstatistics/index";
    }

    /**
     * 1.最近7天设备数统计
     */
    public void jsonMobileCountByDays(Date beginDate, Date endDate, Model model) {
        EntityWrapper<TAppPageOperationStatistics> ew = new EntityWrapper<>();
        ew.eq("TYPE_", type_stics_mobile_count);
        ew.between("GROUP_", formatGroup(beginDate), formatGroup(endDate));
        ew.orderBy("GROUP_", false);
        List<TAppPageOperationStatistics> list = service.selectList(ew);
        Map<String, List> mobileCountData = new HashMap<String, List>();
        List<String> dateList = new ArrayList<>();
        List<Integer> countList = new ArrayList<>();
        List<Integer> sumList = new ArrayList<>();
        boolean isEQ = true;
        boolean isNotEmpty = false;
        while (isEQ){
            isNotEmpty = false;
            for(TAppPageOperationStatistics item : list){
                if(formatMMdd(beginDate).equals(formatMMdd(item.getGroupDate()))) {
                    dateList.add(formatMMdd(item.getGroupDate()));
                    countList.add(item.getCount());
                    sumList.add(item.getSum());
                    isNotEmpty = true;
                    break;
                }
            }
            if(isNotEmpty == false){
                //添加0的数据
                dateList.add(formatMMdd(beginDate));
                countList.add(0);
                sumList.add(0);
            }
            isEQ = !formatMMdd(beginDate).equals(formatMMdd(endDate));
            beginDate = addDay(beginDate, 1);
        }

        mobileCountData.put("dateList", dateList);
        mobileCountData.put("countList", countList);
        mobileCountData.put("sumList", sumList);
        String json = JSON.toJSONString(mobileCountData);
        model.addAttribute("mobileCountData", json);
    }

    /**
     * 2、栏目点击数统计：按key统计
     */
    public void jsonKeyCountByDay(Date beginDate, Date endDate, Model model) {
        EntityWrapper<TAppPageOperationStatistics> ew = new EntityWrapper<>();
        ew.eq("TYPE_", type_stics_key_count);
        ew.between("GROUP_", formatGroup(beginDate), formatGroup(endDate));
        ew.orderBy("GROUP_", false);
        List<TAppPageOperationStatistics> list = service.selectList(ew);
        Map<String, Object> dataMap = new HashMap<String, Object>();

        //提取类目
        LinkedHashMap<String, LinkedList<Integer>> legendDataMap = new LinkedHashMap<>();
        LinkedList<Integer> dataList;
        for(TAppPageOperationStatistics item : list){
            if(!legendDataMap.containsKey(item.getValue())){
                dataList = new LinkedList<>();
                legendDataMap.put(item.getValue(), dataList);
            }
        }
        //提取时间
        boolean isEQ = true;
        LinkedList<String> dateList = new LinkedList<>();
        while (isEQ){
            String dateStr = formatMMdd(beginDate);
            dateList.add(dateStr);
            for(TAppPageOperationStatistics item : list){
                if(!dateStr.equals(formatMMdd(item.getGroupDate()))) {
                    continue;
                }
                //按日期查找
                dataList = legendDataMap.get(item.getValue());
                dataList.add(item.getCount());
                legendDataMap.put(item.getValue(), dataList);
            }
            //若该日期下没有任何数据，填0数据
            //验证每个数据是否完整,
            int len = dateList.size();
            for(Map.Entry<String, LinkedList<Integer>> entry : legendDataMap.entrySet()){
                dataList = entry.getValue();
                if(len != dataList.size()){
                    dataList.add(0);
                }
            }
            isEQ = !dateStr.equals(formatMMdd(endDate));
            beginDate = addDay(beginDate, 1);
        }
        dataMap.put("dateList", dateList);
        dataMap.put("legendList", legendDataMap.keySet());
        LinkedList<Map<String,Object>> dataMapList = new LinkedList<>();
        for(Map.Entry<String, LinkedList<Integer>> entry : legendDataMap.entrySet()){
            Map<String,Object> dataItem = new HashMap<>();
            dataItem.put("name", entry.getKey());
            dataItem.put("type", "bar");
            dataItem.put("stack","点击数");
            Map<String,Object> is1 = new HashMap<>();
            Map<String,Object> is2 = new HashMap<>();
            Map<String,Object> is3 = new HashMap<>();
            is3.put("show", true);
            is3.put("position","insideRight");
            is2.put("label",is3);
            is1.put("normal",is2);
            dataItem.put("itemStyle", is1);
            dataItem.put("data",entry.getValue());
            dataMapList.add(dataItem);
        }
        dataMap.put("countList", dataMapList);
        String json = JSON.toJSONString(dataMap);
        model.addAttribute("keyCountData", json);
    }

    /**
     * 3、模块点击数统计：按model统计
     */
    public void jsonModelCountByDay(Date beginDate, Date endDate, Model model) {
        EntityWrapper<TAppPageOperationStatistics> ew = new EntityWrapper<>();
        ew.eq("TYPE_", type_stics_model_count);
        ew.between("GROUP_", formatGroup(beginDate), formatGroup(endDate));
        ew.orderBy("GROUP_", false);
        List<TAppPageOperationStatistics> list = service.selectList(ew);
        Map<String, Object> dataMap = new HashMap<String, Object>();

        //提取类目
        LinkedHashMap<String, LinkedList<Integer>> legendDataMap = new LinkedHashMap<>();
        LinkedList<Integer> dataList;
        for(TAppPageOperationStatistics item : list){
            if(!legendDataMap.containsKey(item.getValue())){
                dataList = new LinkedList<>();
                legendDataMap.put(item.getValue(), dataList);
            }
        }
        //提取时间
        boolean isEQ = true;
        LinkedList<String> dateList = new LinkedList<>();
        while (isEQ){
            String dateStr = formatMMdd(beginDate);
            dateList.add(dateStr);
            for(TAppPageOperationStatistics item : list){
                if(!dateStr.equals(formatMMdd(item.getGroupDate()))) {
                    continue;
                }
                //按日期查找
                dataList = legendDataMap.get(item.getValue());
                dataList.add(item.getCount());
                legendDataMap.put(item.getValue(), dataList);
            }
            //若该日期下没有任何数据，填0数据
            //验证每个数据是否完整,
            int len = dateList.size();
            for(Map.Entry<String, LinkedList<Integer>> entry : legendDataMap.entrySet()){
                dataList = entry.getValue();
                if(len != dataList.size()){
                    dataList.add(0);
                }
            }
            isEQ = !dateStr.equals(formatMMdd(endDate));
            beginDate = addDay(beginDate, 1);
        }
        dataMap.put("dateList", dateList);
        dataMap.put("legendList", legendDataMap.keySet());
        LinkedList<Map<String,Object>> dataMapList = new LinkedList<>();
        for(Map.Entry<String, LinkedList<Integer>> entry : legendDataMap.entrySet()){
            Map<String,Object> dataItem = new HashMap<>();
            dataItem.put("name", entry.getKey());
            dataItem.put("type", "bar");
            dataItem.put("stack","点击数");
            Map<String,Object> is1 = new HashMap<>();
            Map<String,Object> is2 = new HashMap<>();
            Map<String,Object> is3 = new HashMap<>();
            is3.put("show", true);
            is3.put("position","insideRight");
            is2.put("label",is3);
            is1.put("normal",is2);
            dataItem.put("itemStyle", is1);
            dataItem.put("data",entry.getValue());
            dataMapList.add(dataItem);
        }
        dataMap.put("countList", dataMapList);
        String json = JSON.toJSONString(dataMap);
        model.addAttribute("modelCountData", json);
    }

    /**
     * 4、栏目使用平均时长：排除0时长的记录
     */
    public void jsonKeyUseAvgByDay(Date beginDate, Date endDate, Model model) {
        EntityWrapper<TAppPageOperationStatistics> ew = new EntityWrapper<>();
        ew.eq("TYPE_", type_stics_key_use_avg);
        ew.between("GROUP_", formatGroup(beginDate), formatGroup(endDate));
        ew.orderBy("GROUP_", false);
        List<TAppPageOperationStatistics> list = service.selectList(ew);
        //数据
        Map<String, Object> dataMap = new HashMap<String, Object>();
        //提取类目
        LinkedHashMap<String, LinkedList<BigDecimal>> legendDataMap = new LinkedHashMap<>();
        LinkedList<BigDecimal> dataList;
        for(TAppPageOperationStatistics item : list){
            if(!legendDataMap.containsKey(item.getValue())){
                dataList = new LinkedList<>();
                legendDataMap.put(item.getValue(), dataList);
            }
        }
        //提取时间
        boolean isEQ = true;
        LinkedList<String> dateList = new LinkedList<>();
        while (isEQ){
            String dateStr = formatMMdd(beginDate);
            dateList.add(dateStr);
            for(TAppPageOperationStatistics item : list){
                if(!dateStr.equals(formatMMdd(item.getGroupDate()))) {
                    continue;
                }
                //按日期查找
                dataList = legendDataMap.get(item.getValue());
                dataList.add(item.getAvg());
                legendDataMap.put(item.getValue(), dataList);
            }
            //若该日期下没有任何数据，填0数据
            //验证每个数据是否完整,
            int len = dateList.size();
            for(Map.Entry<String, LinkedList<BigDecimal>> entry : legendDataMap.entrySet()){
                dataList = entry.getValue();
                if(len != dataList.size()){
                    dataList.add(new BigDecimal(0));
                }
            }
            isEQ = !dateStr.equals(formatMMdd(endDate));
            beginDate = addDay(beginDate, 1);
        }
        dataMap.put("dateList", dateList);
        dataMap.put("legendList", legendDataMap.keySet());
        LinkedList<Map<String,Object>> dataMapList = new LinkedList<>();
        for(Map.Entry<String, LinkedList<BigDecimal>> entry : legendDataMap.entrySet()){
            Map<String,Object> dataItem = new HashMap<>();
            dataItem.put("name", entry.getKey());
            dataItem.put("type", "line");
            dataItem.put("data",entry.getValue());
            dataMapList.add(dataItem);
        }
        dataMap.put("countList", dataMapList);
        String json = JSON.toJSONString(dataMap);
        model.addAttribute("keyUseAvgData", json);
    }

    /**
     * 5、时段使用频率统计：每小时统计记录时长
     */
    public void jsonKeyHourAvgByDay(Date beginDate, Date endDate, Model model) {
        EntityWrapper<TAppPageOperationStatistics> ew = new EntityWrapper<>();
        ew.eq("TYPE_", type_stics_key_hour_avg);
        ew.between("GROUP_", formatGroup(beginDate), formatGroup(endDate));
        ew.orderBy("GROUP_", false);
        ew.orderBy("VALUE_", true);
        List<TAppPageOperationStatistics> list = service.selectList(ew);
        //数据
        Map<String, Object> dataMap = new HashMap<String, Object>();
        //提取类目
        LinkedHashMap<String, LinkedList<Integer>> legendDataMap = new LinkedHashMap<>();
        LinkedList<Integer> dataList;
        for(TAppPageOperationStatistics item : list){
            if(!legendDataMap.containsKey(item.getValue())){
                    if(item.getCount()>0) {
                    dataList = new LinkedList<>();
                    legendDataMap.put(item.getValue()+"时", dataList);
                }
            }
        }
        //提取时间
        boolean isEQ = true;
        LinkedList<String> dateList = new LinkedList<>();
        while (isEQ){
            String dateStr = formatMMdd(beginDate);
            dateList.add(dateStr);
            for(TAppPageOperationStatistics item : list){
                if(!dateStr.equals(formatMMdd(item.getGroupDate()))) {
                    continue;
                }
                //按日期查找
                dataList = legendDataMap.get(item.getValue()+"时");
                if(null != dataList){
                    dataList.add(item.getCount());
                    legendDataMap.put(item.getValue()+"时", dataList);
                }
            }
            //若该日期下没有任何数据，填0数据
            //验证每个数据是否完整,
            int len = dateList.size();
            for(Map.Entry<String, LinkedList<Integer>> entry : legendDataMap.entrySet()){
                dataList = entry.getValue();
                if(len != dataList.size()){
                    dataList.add(0);
                }
            }
            isEQ = !dateStr.equals(formatMMdd(endDate));
            beginDate = addDay(beginDate, 1);
        }
        dataMap.put("dateList", dateList);
        dataMap.put("legendList", legendDataMap.keySet());
        LinkedList<Map<String,Object>> dataMapList = new LinkedList<>();
        for(Map.Entry<String, LinkedList<Integer>> entry : legendDataMap.entrySet()){
            Map<String,Object> dataItem = new HashMap<>();
            dataItem.put("name", entry.getKey());
            dataItem.put("type", "line");
            dataItem.put("smooth",true);
            Map<String,Object> is1 = new HashMap<>();
            Map<String,Object> is2 = new HashMap<>();
            Map<String,Object> is3 = new HashMap<>();
            is3.put("type","default");
            is2.put("areaStyle",is3);
            is1.put("normal",is2);
            dataItem.put("itemStyle", is1);
            dataItem.put("data",entry.getValue());
            dataMapList.add(dataItem);
        }
        dataMap.put("countList", dataMapList);
        String json = JSON.toJSONString(dataMap);
        model.addAttribute("keyHourAvgData", json);
    }

    /**
     * 6、app使用平均周期：使用lifecycle来统计
     */
    public void jsonLifecycleHourAvgByDays(Date beginDate, Date endDate, Model model) {
        EntityWrapper<TAppPageOperationStatistics> ew = new EntityWrapper<>();
        ew.eq("TYPE_", type_stics_lifecycle_hour_avg);
        ew.between("GROUP_", formatGroup(beginDate), formatGroup(endDate));
        ew.orderBy("GROUP_", false);
        List<TAppPageOperationStatistics> list = service.selectList(ew);
        Map<String, List> dataData = new HashMap<String, List>();
        List<String> dateList = new ArrayList<>();
        List<BigDecimal> countList = new ArrayList<>();
        boolean isEQ = true;
        boolean isNotEmpty = false;
        while (isEQ){
            isNotEmpty = false;
            for(TAppPageOperationStatistics item : list){
                if(formatMMdd(beginDate).equals(formatMMdd(item.getGroupDate()))) {
                    dateList.add(formatMMdd(item.getGroupDate()));
                    countList.add(item.getAvg());
                    isNotEmpty = true;
                    break;
                }
            }
            if(isNotEmpty == false){
                //添加0的数据
                dateList.add(formatMMdd(beginDate));
                countList.add(new BigDecimal(0));
            }
            isEQ = !formatMMdd(beginDate).equals(formatMMdd(endDate));
            beginDate = addDay(beginDate, 1);
        }

        dataData.put("dateList", dateList);
        dataData.put("countList", countList);
        String json = JSON.toJSONString(dataData);
        model.addAttribute("lifecycleHourAvgData", json);

    }

    /**
     * 内存监控-页面
     * @return
     */
    @RequestMapping("/monitorMemoryPage")
    public String monitorMemoryPage(){
        return "/echarts/tapppageoperationstatistics/monitorMemory";
    }

    /**
     * 内存监控-数据
     * @return
     */
    @RequestMapping("/monitorMemory")
    @ResponseBody
    public JsonResult monitorMemory(){

        long vmFree = 0;
        long vmUse = 0;
        long vmTotal = 0;
        long vmMax = 0;
        int byteToMb = 1024 * 1024;
        Runtime rt = Runtime.getRuntime();
        vmTotal = rt.totalMemory() / byteToMb;
        vmFree = rt.freeMemory() / byteToMb;
        vmMax = rt.maxMemory() / byteToMb;
        vmUse = vmTotal - vmFree;
        System.out.println("JVM总内存：" + vmTotal + " MB");
        System.out.println("JVM最大内存：" + vmMax + " MB");
        System.out.println("JVM已用内存：" + vmUse + " MB");
        System.out.println("JVM空闲内存：" + vmFree + " MB");

        Map<String, Long> dataMap = new HashMap<>();
        dataMap.put("totalMemory", vmTotal);
        dataMap.put("freeMemory", vmFree);
        dataMap.put("maxMemory", vmMax);
        dataMap.put("usedMemory", vmUse);
        return new JsonSuccessResult(dataMap);
    }

    private Integer formatGroup(@NotNull Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        return Integer.valueOf(sdf.format(date));
    }
    private String formatMMdd(@NotNull Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
        return sdf.format(date);
    }


    private Date diffDay(@NotNull Date date, @NotNull int days) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - days);
        return calendar.getTime();
    }

    private Date addDay(@NotNull Date date, @NotNull int days) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + days);
        return calendar.getTime();
    }

}
