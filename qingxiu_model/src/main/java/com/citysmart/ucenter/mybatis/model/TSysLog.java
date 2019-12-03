package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.citysmart.ucenter.mybatis._Model;

/**
 * <p>
 * 
 * </p>
 *
 * @author lub
 * @since 2019-03-04
 */
@TableName("t_sys_log")
public class TSysLog extends _Model<TSysLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 操作用户编号
     */
	@TableField("user_id")
	private Integer userId;
    /**
     * 操作用户
     */
	@TableField("user_name")
	private String userName;
    /**
     * 组件（模块/服务）
     */
	private String module;
    /**
     * 级别（DEBUG调试、INFO信息、WARN警告、ERROR严重、FATAL崩溃、service信息）
     */
	private String level;
    /**
     * 日志标题
     */
	private String title;
    /**
     * 日志详细
     */
	private String content;
    /**
     * 请求地址
     */
	private String url;
    /**
     * 请求参数
     */
	private String params;
    /**
     * 请求ip
     */
	@TableField("from_ip")
	private String fromIp;




	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getFromIp() {
		return fromIp;
	}

	public void setFromIp(String fromIp) {
		this.fromIp = fromIp;
	}


}
