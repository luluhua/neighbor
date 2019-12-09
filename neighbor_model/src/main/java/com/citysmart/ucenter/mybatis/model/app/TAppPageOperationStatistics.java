package com.citysmart.ucenter.mybatis.model.app;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * app用户行为统计
 * </p>
 *
 * @author zhouyanjian
 * @since 2019-08-29
 */
@Data
@TableName("t_app_page_operation_statistics")
public class TAppPageOperationStatistics extends Model<TAppPageOperationStatistics> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID",type=IdType.AUTO)
    private Integer id;
    /**
     * 时间分组：如20190830，表示为这一天的统计信息
     */
    @TableField("GROUP_")
    private Integer group;
    /**
     * 统计类型
     */
    @TableField("TYPE_")
    private String type;
    /**
     * 值
     */
    @TableField("VALUE_")
    private String value;
    /**
     * 名称
     */
    @TableField("NAME_")
    private String name;
    /**
     * 统计数
     */
    @TableField("COUNT_")
    private Integer count;
    /**
     * 合计数
     */
    @TableField("SUM_")
    private Integer sum;
    /**
     * 平均数
     */
    @TableField("AVG_")
    private BigDecimal avg;

    /**
     * 日期分组
     */
    @TableField("GROUP_DATE_")
    private Date groupDate;

    @TableField(exist=false)
    private String groupDateStr;

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
