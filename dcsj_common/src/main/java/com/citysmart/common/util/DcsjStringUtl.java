package com.citysmart.common.util;

import org.apache.commons.lang3.StringUtils;

public class DcsjStringUtl {
    /**
     * 身份证
     */
    public static final  int PARM_TYPE_SFZ=1;
    /**
     * 姓名
     */
    public static final int PARM_TYPE_NAME=2;
    /**
     * 电话
     */
    public static final int PARM_TYPE_PHONE=3;
    public static String toVoverString(String _parm,Integer type){
        if(StringUtils.isBlank(_parm)||type==null){return "";}
        StringBuilder sb = new StringBuilder(_parm);
        switch (type){
            case PARM_TYPE_SFZ:
                if(_parm.length()<18){return  _parm;}
                sb.replace(6, 14, "********");
                break;
            case PARM_TYPE_NAME:
                sb.replace(0, 1, "*");
                break;
            case PARM_TYPE_PHONE:
                if(_parm.length()<11){return  _parm;}
                sb.replace(3, 7, "*****");
                break;
            default:
                break;
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(toVoverString("",PARM_TYPE_SFZ));
        System.out.println(toVoverString("",PARM_TYPE_NAME));
        System.out.println(toVoverString("",PARM_TYPE_PHONE));
    }
}
