package com.citysmart.ucenter.module.wholesalestore.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.CommonUtil;
import com.citysmart.ucenter.common.Util.PWDStrongUtil;
import com.citysmart.ucenter.common.Util.RedisUtil;
import com.citysmart.ucenter.common.Util.ShiroUtil;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.component.mybatis.WebSocket.SocketServer;
import com.citysmart.ucenter.component.mybatis.WebSocket.WebSocketOneToOne;
import com.citysmart.ucenter.component.mybatis.WebSocket.WebSocketServer;
import com.citysmart.ucenter.module.appc.service.ITLjUserInfoService;
import com.citysmart.ucenter.module.appc.service.ITMessageService;
import com.citysmart.ucenter.mybatis.enums.Delete;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUserInfo;
import com.citysmart.ucenter.mybatis.model.app.TMessage;
import com.citysmart.ucenter.mybatis.entity.vo.dialogueVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author lub
 * @since 2020-01-16
 */
@Controller
@RequestMapping("/message")
public class messageController extends SuperController {

    @Autowired
    public ITMessageService service;

    @Autowired
    public ITLjUserInfoService userInfoService;

    @Autowired
    public SocketServer socketServer;

    /**
     * 0 第一次联系   1非第一次
     */
    public final static String MESSAGE_USET = "0";

    public final static String ICON_PREFIX = RedisUtil.getValueByKey("http.img.url");

    public final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     * 分页查询
     */
    @RequestMapping("/list/{pageNumber}")
    public String list(@PathVariable Integer pageNumber, @RequestParam(defaultValue = "10") Integer pageSize, String search, Model model) {
        TLjUser ljUser = ShiroUtil.getSessionUser();
        if (ljUser != null) {
            Page<TMessage> page = getPage(pageNumber, pageSize);
            model.addAttribute("pageSize", pageSize);
            // 查询分页
            EntityWrapper<TMessage> ew = new EntityWrapper<TMessage>();
            ew.eq("user_id", ljUser.getId());
            ew.eq("is_deleted", Delete.未删除);
            ew.orderBy("dt_create", false);
            ew.groupBy("sender");
            Page<TMessage> pageData = service.selectPage(page, ew);
            model.addAttribute("pageData", pageData);
            return "/wholesalestore/personal/message";
        }
        return "/wholesalestore/login";
    }

    /**
     * 新增
     */
//    @RequiresPermissions("addTMessage")
    @RequestMapping("/add")
    public String add(Model model) {
        return "/wholesalestore/personal/dialogue";
    }

    /**
     * 执行回复
     */
    @RequestMapping("/doAdd")
    @ResponseBody
    @Log("回复聊天")
    public Rest doAdd(@Valid TMessage entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        TLjUser ljUser = ShiroUtil.getSessionUser();
        if (ljUser != null) {
            List<TMessage> list = service.selectListBySenderAndUserId(ljUser.getId(), entity.getUserId());
            if (list.size() > 0) {
                entity.setUset(1);
            }
            entity.setSender(ljUser.getId());
            entity.setType(1);
            EntityWrapper<TLjUserInfo> ew = new EntityWrapper<TLjUserInfo>();
            ew.eq("user_id", ljUser.getId());
            TLjUserInfo userInfo = userInfoService.selectOne(ew);
            if (userInfo != null) {
                entity.setUserName(userInfo.getNickname() != null ? userInfo.getNickname() : PWDStrongUtil.Decrypt3DEs(ljUser.getUsername()));
            }
            service.insert(entity);
            return Rest.okData(entity);
        }
        return Rest.failure("登录失效");

    }


    @RequestMapping("sendmsg")
    @ResponseBody
    public String sendmsg(String sender, String content) {
        TLjUser ljUser = ShiroUtil.getSessionUser();
        if (ljUser != null) {
            EntityWrapper<TLjUserInfo> ew = new EntityWrapper<TLjUserInfo>();
            ew.eq("user_id", ljUser.getId());
            TLjUserInfo userInfo = userInfoService.selectOne(ew);
            Integer status = SocketServer.sendMessage(content, ljUser.getId(), sender, (userInfo != null && userInfo.getAvatarUrl() != null && userInfo.getAvatarUrl() != "") ? ICON_PREFIX + userInfo.getAvatarUrl() : "");
            if (status == 0) {
                EntityWrapper<TMessage> ews = new EntityWrapper<TMessage>();
                TMessage message = new TMessage();
                message.setStatus(1);
                ews.eq("sender", ljUser.getId());
                ews.eq("user_id", sender);
                service.update(message, ews);
            } else {
                EntityWrapper<TMessage> ews = new EntityWrapper<TMessage>();
                TMessage message = new TMessage();
                message.setStatus(0);
                ews.eq("sender", ljUser.getId());
                ews.eq("user_id", sender);
                service.update(message, ews);
            }
        }


        return "success";
    }


    /**
     * 删除
     */
    @RequiresPermissions("deleteTMessage")
    @RequestMapping("/delete")
    @ResponseBody
    @Log("删除")
    public Rest delete(Integer id) {
        service.deleteById(id);
        return Rest.ok();
    }

    /**
     * 编辑
     */
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable String id, Model model) {
        TLjUser ljUser = ShiroUtil.getSessionUser();
        if (ljUser != null) {
            List<dialogueVO> messageList = service.getDialogue(ljUser.getId(), id);
            model.addAttribute("entity", messageList);
            EntityWrapper<TMessage> ew = new EntityWrapper<TMessage>();
            TMessage message = new TMessage();
            message.setStatus(1);
            ew.eq("sender", id);
            ew.eq("user_id", ljUser.getId());
            service.update(message, ew);
            model.addAttribute("uuid", CommonUtil.UUID());
            model.addAttribute("userid", ljUser.getId());
            model.addAttribute("sender", id);
            return "/wholesalestore/personal/dialogue";
        }
        return "/wholesalestore/login";
    }


    @RequestMapping("/messageList")
    @ResponseBody
    public Rest messageList(String userid, String friendid) {
        List<dialogueVO> messageList = service.getDialogue(userid, friendid);

        return Rest.okData(messageList);
    }


    /**
     * 登录界面直接聊天
     **/
    @RequestMapping("user_1")
    public String user_1(String usr, HttpSession session) {
        session.setAttribute("usr", usr);
        return "user_1";
    }

    /**
     * 发送消息 消息内容,发送人,接收人,会话标识
     **/
//    @RequestMapping("message")
//    public void message(String msg, String from, String to, String socketId) {
//        webSocketOneToOne.send(msg, from, to, socketId);
//
//    }


    /**
     * 执行编辑
     */
    @RequiresPermissions("editTMessage")
    @RequestMapping("/doEdit")
    @ResponseBody
    @Log("编辑")
    public Rest doEdit(@Valid TMessage entity, BindingResult result) {
        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                return Rest.failure(error.getDefaultMessage());
            }
        }
        service.updateById(entity);
        return Rest.ok();
    }


}
