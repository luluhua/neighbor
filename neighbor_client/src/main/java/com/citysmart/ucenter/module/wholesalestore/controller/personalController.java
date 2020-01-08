package com.citysmart.ucenter.module.wholesalestore.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.citysmart.common.bean.Rest;
import com.citysmart.common.controller.SuperController;
import com.citysmart.common.util.CommonUtil;
import com.citysmart.common.util.TimeUtil;
import com.citysmart.ucenter.common.Util.*;
import com.citysmart.ucenter.common.anno.Log;
import com.citysmart.ucenter.module.appc.service.ITLjUserInfoService;
import com.citysmart.ucenter.module.appc.service.ITLjUserService;
import com.citysmart.ucenter.module.commodity.service.ITGoodsGradeService;
import com.citysmart.ucenter.module.mail.IMailService;
import com.citysmart.ucenter.mybatis.model.app.TClientAttachment;
import com.citysmart.ucenter.mybatis.model.app.TLjUser;
import com.citysmart.ucenter.mybatis.model.app.TLjUserInfo;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * @author li
 * @date 2019/12/26
 */
@Controller
@RequestMapping("/resource")
public class personalController extends SuperController {

    @Autowired
    private ITGoodsGradeService gradeService;

    @Autowired
    private ITLjUserInfoService userInfoService;


    @Autowired
    public IMailService mailService;
    /**
     * 邮件发送器
     */
    @Autowired
    public JavaMailSender mailSender;

    public final static String ICON_PREFIX = RedisUtil.getValueByKey("http.img.url");


    @RequestMapping("/info")
    public String show(Model model) {
        TLjUser ljUser = ShiroUtil.getSessionUser();
        if (ljUser != null) {
            EntityWrapper<TLjUserInfo> userEw = new EntityWrapper<TLjUserInfo>();
            userEw.eq("user_id", ljUser.getId());
            TLjUserInfo info = userInfoService.selectOne(userEw);
            if (StringUtils.isNotBlank(info.getAvatarUrl())) {
                info.setAvatarUrl(ICON_PREFIX + info.getAvatarUrl());
                info.setEmail(VerifyUtil.getFormatMail(info.getEmail()));
            }
            model.addAttribute("info", info);
            model.addAttribute("score", gradeService.getUserScore(ljUser.getId()).getScore());
            return "/wholesalestore/personal/memberData";
        }
        return "/wholesalestore/login";
    }


    /**
     * 新增/修改昵称
     */
    @RequestMapping("/setNickname")
    @ResponseBody
    @Log("新增/修改昵称")
    public Rest setNickname(String nickname) {
        TLjUser ljUser = ShiroUtil.getSessionUser();
        if (ljUser != null) {
            EntityWrapper<TLjUserInfo> userEw = new EntityWrapper<TLjUserInfo>();
            userEw.eq("user_id", ljUser.getId());
            TLjUserInfo info = userInfoService.selectOne(userEw);
            if (info != null) {
                info.setNickname(nickname);
                userInfoService.updateById(info);
            } else {
                TLjUserInfo infos = new TLjUserInfo();
                infos.setUserId(ljUser.getId());
                infos.setNickname(nickname);
                userInfoService.insert(infos);
            }
            return Rest.ok("修改成功！");
        }
        return Rest.ok("登录已过期，请从新登录");

    }

    /**
     * 新增/修改性别
     *
     * @param gender
     * @return
     */
    @RequestMapping("/setGender")
    @ResponseBody
    @Log("新增/修改性别")
    public Rest setGender(Integer gender) {
        TLjUser ljUser = ShiroUtil.getSessionUser();
        if (ljUser != null) {
            EntityWrapper<TLjUserInfo> userEw = new EntityWrapper<TLjUserInfo>();
            userEw.eq("user_id", ljUser.getId());
            TLjUserInfo info = userInfoService.selectOne(userEw);
            if (info != null) {
                info.setGender(gender);
                userInfoService.updateById(info);
            } else {
                TLjUserInfo infos = new TLjUserInfo();
                infos.setGender(gender);
                userInfoService.insert(infos);
            }
            return Rest.ok("修改成功！");
        }
        return Rest.ok("登录已过期，请从新登录");
    }


    /**
     * 头像上传
     *
     * @param file 文件流
     * @return
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping("/file/setAvatar")
    public Map<String, Object> fileUpload(@RequestParam MultipartFile[] file, Model model) {
        TLjUser ljUser = ShiroUtil.getSessionUser();
        Map<String, Object> result = new HashMap<String, Object>(5);
        if (ljUser != null) {
            String iconPrefix = RedisUtil.getValueByKey("http.img.url");
            String fileUrl = env.getProperty("file.upload.url");
            List<Integer> fileIds = new ArrayList<Integer>();
            String filename = null;
            try {
                String fileurl = "";
                for (MultipartFile myfile : file) {
                    if (myfile.isEmpty()) {
                        logger.warn("文件未上传");
                    } else {
                        logger.debug("文件长度: " + myfile.getSize());
                        logger.debug("文件类型: " + myfile.getContentType());
                        logger.debug("文件名称: " + myfile.getName());
                        logger.debug("文件原名: " + myfile.getOriginalFilename());
                        filename = myfile.getOriginalFilename().substring(0, myfile.getOriginalFilename().indexOf("."));
                        String ext = FilenameUtils.getExtension(myfile.getOriginalFilename());
                        String reName = RandomStringUtils.randomAlphanumeric(32).toLowerCase() + "." + ext;
                        String cdate = DateFormatUtils.format(new Date(), "yyyy-MM-dd");
                        String realPath = fileUrl + "/" + File.separator + cdate;
                        FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, reName));
                        fileurl = "/" + cdate + "/" + reName;
                        EntityWrapper<TLjUserInfo> ew = new EntityWrapper<TLjUserInfo>();
                        ew.eq("user_id", ljUser.getId());
                        TLjUserInfo userInfo = userInfoService.selectOne(ew);
                        if (userInfo != null) {
                            userInfo.setAvatarUrl(fileurl);
                            userInfoService.updateById(userInfo);
                        } else {
                            TLjUserInfo info = new TLjUserInfo();
                            info.setUserId(ljUser.getId());
                            info.setAvatarUrl(fileurl);
                            userInfoService.insert(info);
                        }
                    }
                }
                result.put("status", "success");
                result.put("code", 0);
                result.put("url", iconPrefix + fileurl);
                result.put("filename", filename);
                return result;
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                result.put("status", "error");
                return result;
            }
        }
        result.put("status", "success");
        result.put("code", 101);
        return result;
    }

    /**
     * 新增/修改邮箱 -发送邮件
     *
     * @param mail
     * @return
     */
    @RequestMapping("/sendMail")
    @ResponseBody
    @Log("新增/修改邮箱 -发送邮件")
    public Rest sendMail(String mail, String jEmail) {
        if (VerifyUtil.VerifyMail(mail)) {
            String sender = env.getProperty("spring.mail.username");
            String emailCode = CommonUtil.randomNumber().toString();
            String verificationCodeTime = RedisUtil.getValueByKey("verification.Code.Time");
            TLjUser ljUser = ShiroUtil.getSessionUser();
            if (ljUser != null) {
                EntityWrapper<TLjUserInfo> userEw = new EntityWrapper<TLjUserInfo>();
                userEw.eq("user_id", ljUser.getId());
                TLjUserInfo info = userInfoService.selectOne(userEw);
                if (StringUtils.isNotBlank(jEmail) && !jEmail.equals(info.getEmail())) {
                    return Rest.failure("原邮箱输入有误");
                }
                StringBuilder builder = new StringBuilder();
                String userRedispackagekey = RedisUtil.QINGXIU_PACKAGE_KEY + ".smsCode." + 2 + ":" + mail;
                //获取剩余时间
                long time_expire = 60;
                long restTime = JedisUtil.getInstance().new Keys().ttl(userRedispackagekey);
                long existenceTime = Long.valueOf(TimeUtil.MillisecondToSecond(Integer.parseInt(verificationCodeTime)).toString()) - restTime;
                if (existenceTime == 0 || existenceTime >= time_expire) {
                    RedisUtil.delPackageKey("smsCode", mail);
                    builder.append("尊重的用户：")
                            .append("感谢您使用简单生活网,您办理的业务验证码是：").append("<b style='color: #0f0f0f;font-size: 16px'>").append(emailCode).append("</b>")
                            .append(",验证码有效时间5分钟。");
                    mailService.sendMimeMessge(mailSender, sender, mail, "简单生活网修改邮箱号码验证码", builder.toString());
                    JedisUtil.getInstance().new Strings().setEx(userRedispackagekey, 2, emailCode);
                    Map<String, Object> map = new HashMap<>(16);
                    return Rest.ok("验证码已发送到请注意查收。");
                }
                return Rest.failure("邮件发送过于频繁！");

                //把验证码加入缓存

            }
            return Rest.failure("登录已过期，请从新登录！");

        }
        return Rest.failure("请填写正确的邮箱！");
    }
}
