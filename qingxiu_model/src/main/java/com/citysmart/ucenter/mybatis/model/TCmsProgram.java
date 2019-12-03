package com.citysmart.ucenter.mybatis.model;


import com.citysmart.ucenter.mybatis._Model;
import com.baomidou.mybatisplus.annotations.TableName;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;


/**
 * <p>
 * 内容栏目表
 * </p>
 *
 * @author lub
 * @since 2019-04-01
 */
@TableName("t_cms_program")
public class TCmsProgram extends _Model<TCmsProgram> {

    private static final long serialVersionUID = 1L;

    /**
     * 栏目名称
     */
    @NotBlank(message = "栏目名称不能为空")
    private String title;
    /**
     * 栏目编号
     */
    @NotBlank(message = "栏目编号不能为空")
    private String code;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }


}
