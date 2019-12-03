package com.citysmart.ucenter.mybatis;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import com.citysmart.ucenter.mybatis.enums.Delete;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * @author lub
 * @param <T>
 */
@Getter
@Setter
public class _Model<T extends Model> extends Model<T> {

    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 创建日期
     */
    @TableField(value = "dt_create", fill = FieldFill.INSERT)
    private Date dtCreate;
    /**
     * 是否删除 1:已删除 0：未删除
     */
    @TableLogic
    @TableField(value = "is_deleted", fill = FieldFill.INSERT)
    private Integer isDeleted;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
