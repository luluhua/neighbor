package com.citysmart.ucenter.module.mail;

import org.springframework.mail.javamail.JavaMailSender;

import java.util.Map;

/**
 * @author lub
 */
public interface IMailService {
    /**
     *
     * @param mailSender
     * @param sender
     * @param to
     * @param subject
     * @param content
     */
    void sendSimpleMailMessge(JavaMailSender mailSender, String sender, String to, String subject, String content);

    /**
     *
     * @param mailSender
     * @param sender
     * @param to
     * @param subject
     * @param content
     */
    void sendMimeMessge(JavaMailSender mailSender, String sender, String to, String subject, String content);

    /**
     *
     * @param mailSender
     * @param sender
     * @param to
     * @param subject
     * @param content
     * @param filePath
     */
    void sendMimeMessge(JavaMailSender mailSender, String sender, String to, String subject, String content, String filePath);

    /**
     *
     * @param mailSender
     * @param sender
     * @param to
     * @param subject
     * @param content
     * @param rscIdMap
     */
    void sendMimeMessge(JavaMailSender mailSender, String sender, String to, String subject, String content, Map<String, String> rscIdMap);

}
