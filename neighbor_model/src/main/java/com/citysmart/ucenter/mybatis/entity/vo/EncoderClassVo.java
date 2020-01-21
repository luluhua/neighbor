package com.citysmart.ucenter.mybatis.entity.vo;

import com.fasterxml.jackson.databind.ObjectMapper;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;
import java.io.IOException;
import java.util.Map;

/**
 * @author li
 * @date 2020/1/20
 */
public class EncoderClassVo implements Encoder.Text<Map<String, Object>> {


    @Override
    public void init(EndpointConfig config) {
        // TODO Auto-generated method stub

    }

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    //我向web端传递的是Map类型的
    @Override
    public String encode(Map<String, Object> map) throws EncodeException {
        ObjectMapper mapMapper = new ObjectMapper();
        try {
            String json = "";
            json = mapMapper.writeValueAsString(map);
            return json;
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "false";
        }
    }
    //如果你传递的是一个类，则使用如下写法
//    @Override
//    public String encode(dialogueVO vo) throws EncodeException {
//        try {
//            return java2Json.JavaToJson(vo, false);
//        } catch (MapperException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//            return null;
//        }
//    }


}
