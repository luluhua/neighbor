package com.citysmart.ucenter.component.freemarker.tag;

import com.citysmart.ucenter.common.util.DictUtil;
import com.citysmart.ucenter.mybatis.model.TSysDict;
import org.apache.commons.lang3.StringUtils;

import java.util.Map;
import java.util.List;

public class DictTags extends BaseTag {


    public DictTags() {
        super(DictTags.class.getName());
    }

    /**
     * 字典标签
     * 使用案例：  <@dictTag method="dictValueByType" type="autd_status" value="${(dict.value)!}"> ${(dictValueByType)!}</@dictTag>
     *
     * @param params： type 字典标识  value 字典值
     * @return 返回 字典标签文字
     */
    public String dictValueByType(Map params) {
        String type = this.getParam(params, "type");
        String value = this.getParam(params, "value");
        if (StringUtils.isBlank(type) || StringUtils.isBlank(value)) {
            return "";
        }
        return DictUtil.getTSysDictByTypeAndvalue(type, value);
    }


    /**
     * 字典标签
     * 使用案例：
     * <@dictTag method="getDictListByType" type="file_type" >
     * <#list dictValueByType as m>
     * <option value="${(m.value)!}"> ${(m.code)!}-${(m.label)!}</option>
     * </#list>
     * </@dictTag>
     * @param params： type 字典标识  value 字典值
     * @return 返回 字典标签文字
     */
    public List<TSysDict> getDictListByType(Map params) {
        String type = this.getParam(params, "type");
        if (StringUtils.isBlank(type)) {
            return null;
        }
        return DictUtil.getTSysDictByType(type);
    }
}