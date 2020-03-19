package com.citysmart.ucenter.module.appc.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.ucenter.module.appc.service.ITMessageService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.citysmart.ucenter.mybatis.entity.vo.UserScoreVO;
import com.citysmart.ucenter.mybatis.entity.vo.dialogueVO;
import com.citysmart.ucenter.mybatis.mapper.app.TMessageMapper;
import com.citysmart.ucenter.mybatis.model.app.TMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Autowired
    private ITMessageService messageService;

    @Override
    public List<dialogueVO> getDialogue(String userid, String sender) {

        return this.baseMapper.getDialogue(userid, sender);
    }

    @Override
    public List<TMessage> selectListBySenderAndUserId(String userid, String friendId) {
        Map<String, Object> map = new HashMap<>();
        map.put("userid", userid);
        map.put("friendid", friendId);
        return this.baseMapper.selectListBySenderAndUserId(map);
    }


}
