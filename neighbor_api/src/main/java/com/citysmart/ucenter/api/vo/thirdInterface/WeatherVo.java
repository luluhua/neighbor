package com.citysmart.ucenter.api.vo.thirdInterface;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.citysmart.ucenter.api.vo.BaseVo;
import com.citysmart.ucenter.common.util.RedisUtil;
import com.citysmart.ucenter.mybatis.model.TThirdInterfaceLog;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tuyang.beanutils.annotation.BeanCopySource;
import com.tuyang.beanutils.annotation.CopyProperty;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;

@Getter
@Setter
@BeanCopySource(source = TThirdInterfaceLog.class)
public class WeatherVo extends BaseVo {
    private String week;
    private String wea;
    private String wea_img;
    private String tem;//温度（最低）
    private String win;
    private String win_speed;
    @CopyProperty(property = "resContent")
    @JsonIgnore
    private String contet;

    public void setContet(String contet) {
        if(StringUtils.isNotBlank(contet)){
            JSONObject jsonObject= JSON.parseObject(contet);
                if(jsonObject!=null) {
                    JSONArray jsonArray= JSONArray.parseArray(jsonObject.get("data").toString());
                    if(jsonArray!=null){
                        jsonObject=jsonArray.getJSONObject(1);
                        if(jsonObject!=null){
                            //星期
                            setWeek(jsonObject.get("week").toString());
                            //天气情况
                            setWea(jsonObject.get("wea").toString());
                            //天气图标
                            setWea_img(ICON_PREFIX + "/weather/" +jsonObject.get("wea_img").toString()+ ".png");
                            //温度（最高）
                            if(jsonObject.get("tem2").toString().equals(jsonObject.get("tem1").toString())){
                                setTem(jsonObject.get("tem2").toString());
                            }else{
                                setTem(jsonObject.get("tem2").toString().replace("℃","")+"-"+jsonObject.get("tem1").toString());
                            }
                            //风向
                            JSONArray jsonArray2= JSONArray.parseArray(jsonObject.get("win").toString());
                            if(jsonArray2!=null){
                                setWin(jsonArray2.getString(0));
                                //风向等级
                                setWin_speed(jsonObject.get("win_speed").toString());
                            }
                        }
                    }
                }
        }

    }


}
