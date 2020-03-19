package com.citysmart.ucenter.component.mybatis.WebSocket;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.ucenter.module.appc.service.ITMessageService;
import com.citysmart.ucenter.module.appc.service.impl.TMessageServiceImpl;
import com.citysmart.ucenter.mybatis.model.app.TLjUserInfo;
import com.citysmart.ucenter.mybatis.model.app.TMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@ServerEndpoint(value = "/socketServer/{userid}", encoders = {ServerEncoder.class})
@Component
public class SocketServer {


    private Session session;
    private static Map<String, Session> sessionPool = new HashMap<>();
    private static Map<String, String> sessionIds = new HashMap<>();

    @Autowired
    public ITMessageService service;

    @OnOpen
    public void open(Session session, @PathParam(value = "userid") String userid) {
        this.session = session;
        sessionPool.put(userid, session);
        sessionIds.put(session.getId(), userid);
    }

    @OnMessage
    public void onMessage(String message) {
        System.out.println("当前发送人sessionid为" + session.getId() + "发送内容为" + message);
    }

    @OnClose
    public void onClose() {
        sessionPool.remove(sessionIds.get(session.getId()));
        sessionIds.remove(session.getId());
    }

    @OnError
    public void onError(Session session, Throwable error) {
        error.printStackTrace();
    }

    public static Integer sendMessage(String message, String userId, String friendId, String avatarUrl) {
        TMessage messageEntity = new TMessage();
        messageEntity.setContent(message);
        messageEntity.setSender(userId);
        messageEntity.setUserId(friendId);
        messageEntity.setAvatarUrl(avatarUrl);
        Session s = sessionPool.get(friendId);
        Integer status = 0;
        if (s != null) { //对方打开着
            try {
                s.getBasicRemote().sendObject(messageEntity);

            } catch (IOException e) {
                e.printStackTrace();
            } catch (EncodeException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } else {  //对方未打开
            status = 1;
        }
        return status;
    }

    public static int getOnlineNum() {
        return sessionPool.size();
    }

    public static String getOnlineUsers() {
        StringBuffer users = new StringBuffer();
        for (String key : sessionIds.keySet()) {
            users.append(sessionIds.get(key) + ",");
        }
        return users.toString();
    }

//    public boolean updateMessageStatus(String userid, String friendId, Integer Status) {
//
//
//        return messageService.updateupdateMessageStatus(userid, friendId, Status);
//    }

//	public static void sendAll(String msg) {
//		for (String key : sessionIds.keySet()) {
//			sendMessage(msg, sessionIds.get(key));
//	    }
//	}
}
