package com.citysmart.ucenter.module.appc.service.impl;

import com.citysmart.ucenter.module.appc.service.ITMessageService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.entity.vo.UserScoreVO;
import com.citysmart.ucenter.mybatis.entity.vo.dialogueVO;
import com.citysmart.ucenter.mybatis.mapper.app.TMessageMapper;
import com.citysmart.ucenter.mybatis.model.app.TMessage;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lub
 * @since 2020-01-16
 */
@Service
public class TMessageServiceImpl extends ServiceImpl<TMessageMapper, TMessage> implements ITMessageService {


    @Override
    public List<dialogueVO> getDialogue(String userid, String sender) {

        return this.baseMapper.getDialogue(userid, sender);
    }

}
