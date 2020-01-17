package com.citysmart.ucenter.mybatis.mapper.app;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.citysmart.ucenter.mybatis.entity.vo.UserScoreVO;
import com.citysmart.ucenter.mybatis.entity.vo.dialogueVO;
import com.citysmart.ucenter.mybatis.model.app.TMessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author lub
 * @since 2020-01-16
 */
public interface TMessageMapper extends BaseMapper<TMessage> {

    List<dialogueVO> getDialogue(@Param("userid") String userid, @Param("sender") String sender);

}
