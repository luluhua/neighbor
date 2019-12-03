package com.citysmart.ucenter.component.freemarker.tag;

import com.citysmart.ucenter.common.util.FileUpladUtil;
import com.citysmart.ucenter.common.util.PWDStrongUtil;
import com.citysmart.ucenter.common.util.RedisUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;

import java.util.Arrays;
import java.util.Map;

public class CommonTags extends BaseTag {

    @Autowired
    public Environment env;

    public CommonTags() {
        super(CommonTags.class.getName());
    }

    public final static String H5_URL = RedisUtil.getValueByKey("h5.url");

    public String tagHtpImgURL(Map map) {

        return FileUpladUtil.ICON_PREFIX;
    }


    public Integer getFileSuffix(Map map) {
        String value = map.get("value").toString();
        String suffix = value.substring(value.lastIndexOf(".") + 1);
        int ty = 0;
        String[] array = {"BMP", "JPG", "JPEG", "PNG", "GIF", "bmp", "jpg", "jpeg", "png", "gif"};
        boolean flag = Arrays.asList(array).contains(suffix);
        if (flag == false) {
            ty = 1;
        }
        return ty;
    }


    public String getFileimgrul(Map map) {

        String se = env.getProperty("file.upload.url");
        return se;
    }


    public String tagH5URL(Map map) {

        return H5_URL;
    }

    /**
     * 获取解密信息
     *
     * @param map
     * @return
     */
    public String getDecrypt3DEs(Map map) {
        String value = map.get("value").toString();
        if (StringUtils.isNotBlank(value)) {
            String Decrypt3DEsToString = PWDStrongUtil.Decrypt3DEs(value);
            return Decrypt3DEsToString;
        }
        return value;
    }
}