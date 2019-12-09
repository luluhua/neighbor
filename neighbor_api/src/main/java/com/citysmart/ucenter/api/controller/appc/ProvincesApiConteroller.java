package com.citysmart.ucenter.api.controller.appc;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.json.JsonResult;
import com.citysmart.common.json.JsonSuccessResult;
import com.citysmart.ucenter.api.vo.TSysCityLinkageVo;
import com.citysmart.ucenter.api.vo.TSysCityVo;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.system.service.ISysCityService;
import com.citysmart.ucenter.mybatis.model.SysCity;
import com.tuyang.beanutils.BeanCopyUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author li
 * @date 2019/3/18
 */
@Api(tags = "08、其他相关接口")
@RestController
@RequestMapping("/app/provinces")
public class ProvincesApiConteroller extends SuperController {


    @Autowired
    public ISysCityService service;

    @Log("行政区域联动接口")
    @ApiImplicitParams(
            @ApiImplicitParam(name = "pid", value = "父级id", dataType = "Integer", paramType = "query", required = true, defaultValue = "0"))
    @ApiOperation("行政区域联动")
    @RequestMapping(value = "/provincelist", method = {RequestMethod.POST, RequestMethod.GET})
    public JsonResult provincelist(Integer pid) {
        EntityWrapper<SysCity> ew = new EntityWrapper<SysCity>();
        ew.eq("pid", pid);
        ew.eq("enabled",1);
        ew.notIn("name","市辖区");
        List<SysCity> provincelist = service.selectList(ew);
        return new JsonSuccessResult("成功",BeanCopyUtils.copyList(provincelist, TSysCityLinkageVo.class));
    }





}
