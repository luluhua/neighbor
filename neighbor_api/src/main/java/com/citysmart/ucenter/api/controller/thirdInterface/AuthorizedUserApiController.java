package com.citysmart.ucenter.api.controller.thirdInterface;

import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.component.jwt.JWTUtil;
import com.citysmart.ucenter.api.vo.thirdInterface.JsonQXTResult;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.common.util.RedisUtil;
import com.citysmart.ucenter.module.appc.service.ITAppUserService;
import com.citysmart.ucenter.mybatis.model.TAppUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@Api(tags = "08、其他相关接口")
@RestController
@RequestMapping("/")
public class AuthorizedUserApiController {

    @Autowired
    private ITAppUserService appUserService;
    @Log("青秀通-code验证")
    @ApiOperation("青秀通-code验证")
    @RequestMapping(value = "open/user", method = RequestMethod.GET)
    @ResponseBody
    public JsonQXTResult qxtLogin(String code) {
        JsonQXTResult jsonQXTResult=new JsonQXTResult();
        try{
            Map<String,Object> result=new HashMap<String,Object>();
            if(StringUtils.isBlank(code)){
                jsonQXTResult.setError("code为空");
                jsonQXTResult.setSuccess(false);
            }
            byte[] src = Base64.decodeBase64(code);
            DecodedJWT jwt = JWT.decode(new String(src));
            // 1. 是否过期
            boolean shouldRefresh = JWTUtil.shouldTokenRefresh(jwt.getExpiresAt(),Long.valueOf(RedisUtil.getValueByKey("jwt.expire.time")));
            if(!shouldRefresh){
                String gid= JWTUtil.getGid(code);
                if(StringUtils.isBlank(gid)){
                    throw new RuntimeException("code中没有获取到用户gid信息");
                }
                System.out.println("解析token获得的gid->"+gid);
                TAppUser user=appUserService.selectOne(new EntityWrapper<TAppUser>().eq("gid", gid));
                if(user==null){
                    throw new RuntimeException("没有获取到用户信息");
                }
                System.out.println("解析本地AppUser获得的gid->"+user.getGid());
                result.put("id", user.getGid());
                result.put("name",user.getNickname());
                result.put("sex",0);
                result.put("phone","");
                result.put("email",user.getGid()+"@ssqxapp.qingxiu.gov.cn");
                result.put("photo","");
                result.put("unit","");
                result.put("title","");
                jsonQXTResult.setError("ok");
                jsonQXTResult.setSuccess(true);
                jsonQXTResult.setResult(result);
            }else{
                RedisUtil.delKey(code);
                jsonQXTResult.setError("code已失效");
                jsonQXTResult.setSuccess(false);
            }
        }catch (Exception e){
            e.printStackTrace();
            jsonQXTResult.setError("code验证接口异常");
            jsonQXTResult.setSuccess(false);
        }
        return jsonQXTResult;
    }
}
