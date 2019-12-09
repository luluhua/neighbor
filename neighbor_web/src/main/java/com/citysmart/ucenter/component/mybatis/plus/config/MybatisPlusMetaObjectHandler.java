package com.citysmart.ucenter.component.mybatis.plus.config;

import com.baomidou.mybatisplus.mapper.MetaObjectHandler;
import com.citysmart.ucenter.mybatis.enums.Delete;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.ReflectionException;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class MybatisPlusMetaObjectHandler extends MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        try{
            Object dtCreate = getFieldValByName("dtCreate",metaObject);
            Object isDeleted = getFieldValByName("isDeleted",metaObject);
            if (null == dtCreate) {
                setFieldValByName("dtCreate",new Date(),metaObject);
            }
            if(null == isDeleted){
                setFieldValByName("isDeleted", Delete.未删除.getValue(), metaObject);
            }
        }catch (ReflectionException exception){
            exception.printStackTrace();
            return;
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {

    }
}
