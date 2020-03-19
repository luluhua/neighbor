package com.citysmart.ucenter.module.appc.service;

import com.baomidou.mybatisplus.service.IService;
import com.citysmart.ucenter.mybatis.entity.vo.dialogueVO;
import com.citysmart.ucenter.mybatis.model.app.TMessage;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author lub
 * @since 2020-01-16
 */
public interface ITMessageService extends IService<TMessage> {

    List<dialogueVO> getDialogue(String userid, String sender);

    List<TMessage> selectListBySenderAndUserId(String userid, String friendId);

}
