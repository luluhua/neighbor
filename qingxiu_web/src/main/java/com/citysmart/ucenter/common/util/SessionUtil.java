package com.citysmart.ucenter.common.util;

import com.citysmart.ucenter.common.HttpHelper;
import com.citysmart.ucenter.mybatis.model.TSysUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

public class SessionUtil {
    public static TSysUser getSessionUser(){
        try{
             TSysUser tSysUser=(TSysUser)HttpHelper.getHttpServletRequest().getSession().getAttribute("user");
             return tSysUser;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
