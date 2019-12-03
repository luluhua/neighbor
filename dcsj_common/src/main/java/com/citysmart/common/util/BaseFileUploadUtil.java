package com.citysmart.common.util;

import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.log4j.Logger;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class BaseFileUploadUtil {
    public static final Logger logger = Logger.getLogger(BaseFileUploadUtil.class);

    public static final String  EXT_JPG="jpg";
    public static final String  EXT_PNG="png";
    public static final String  EXT_GIF="gif";
    public static final String  EXT_PDF="pdf";
    public static final String  EXT_DOC="doc";
    public static final String  EXT_XLS="xls";


    public static final String THUMB_SCALE_100X100="100X100";
    public static final String THUMB_SCALE_200X200="200X200";
    public static final String THUMB_SCALE_300X300="300X300";

    public static final String THUMB_QUALITY_100="100";
    public static final String THUMB_QUALITY_50="50";
    public static final String THUMB_QUALITY_80="80";
    /**
     * @param file
     * @param imageHttpUrl
     * @param fileUrl
     * @param groupId
     * @param serviceId
     * @return
     */
    public static Map<String, String> uploadFile(MultipartFile file, String imageHttpUrl, String fileUrl,
                                                 Integer groupId, Integer serviceId) {
        Map<String, String> result = null;
        if (groupId == null) {
            groupId = 3;//如果没有传递 ，默认分组为其他
        }
        try {
            if (file.isEmpty()) {
                logger.warn("文件未上传");
            } else {
                logger.debug("文件长度: " + file.getSize());
                logger.debug("文件类型: " + file.getContentType());
                logger.debug("文件名称: " + file.getName());
                logger.debug("文件原名: " + file.getOriginalFilename());
                String ext = FilenameUtils.getExtension(file.getOriginalFilename());
                String reName = RandomStringUtils.randomAlphanumeric(32).toLowerCase() + "." + ext;
                String cdate = DateFormatUtils.format(new Date(), "yyyy-MM-dd");
                String realPath = fileUrl + "/" + File.separator + cdate + "/" + groupId + "/" + serviceId;
                FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath, reName));
                String fileurl;
                if (StringUtils.isNotBlank(imageHttpUrl)) {
//                    fileurl = imageHttpUrl + "/upload/" + cdate + "/" + groupId + "/" + serviceId + "/" + reName;
                    fileurl = "/" + cdate + "/" + groupId + "/" + serviceId + "/" + reName;
                } else {
                    fileurl = "/" + cdate + "/" + groupId + "/" + serviceId + "/" + reName;
                }
                result = new HashMap<>();
                result.put("ext", ext);
                result.put("reName", reName);
                result.put("groupId", groupId.toString());
                result.put("fileurl", fileurl);
                result.put("serviceId", serviceId.toString());
            }
            return result;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
    }

    /**
     * @param fileType
     * @return
     */
    public static int fileTypeConver(String fileType) {
        switch (fileType) {
            case "image/jpeg":
                return 0;
            case "doc":
                return 1;
            case "excle":
                return 2;
            case "void":
                return 3;
            default:
                return 4;
        }
    }

    /**
     * 缩率图生成
     * @param spec 大小 示例：160x160
     * @param quality 质量 示例：90
     * @param fileUrl 原图地址
     * @param thumbExt 缩率后缀
     * @return
     */
    public static  Map<String, String> Thumb(String spec,String quality,String fileUrl,String thumbExt) throws IOException {
        Map<String, String> result  = new HashMap<>();
        if(StringUtils.isBlank(fileUrl)){
            result.put("status", "error");
            result.put("msg", "原图不能为空");
            return result;
        }
        String ext=fileUrl.substring(fileUrl.lastIndexOf("."),fileUrl.length());
        String name=fileUrl.substring(fileUrl.lastIndexOf("/")+1,fileUrl.lastIndexOf("."));
        String fileDir=fileUrl.substring(0,fileUrl.lastIndexOf("//"));
        if(StringUtils.isBlank(spec)||spec.toUpperCase().indexOf("X")<0){
            result.put("status", "success");
            String url=fileUrl;
            result.put("ext", ext);
            result.put("name", name);
            result.put("fileurl", url);
            return result;
        }
        File file=new File(fileUrl);
        if(!file.exists()){
            result.put("status", "error");
            result.put("msg", "文件不存在");
            return result;
        }
        if(StringUtils.isBlank(thumbExt)){
            thumbExt=EXT_JPG;
        }
        //缩率大小

        String specStr=spec!=null?spec.toUpperCase():THUMB_SCALE_100X100;
        String[] specS= specStr.split("X");
        int w=Integer.parseInt(specS[0]);
        int h=Integer.parseInt(specS[1]);
        //缩率质量
        String qualityStr=quality!=null?quality.toUpperCase():THUMB_QUALITY_100;
        float qualityF=Float.parseFloat(qualityStr)/100;
        String cdate = DateFormatUtils.format(new Date(), "yyyy-MM-dd");
        //缩率图存放位置（相对路径）
        String thumb="//"+cdate+"//thumb_"+specStr.toUpperCase()+"_"+qualityStr+"_"+name+"."+thumbExt;
        //缩率图存放具体地址
        String thumbFileUrl=fileDir+thumb;
        //生成缩率图
        Thumbnails.of(fileUrl)
                  .size(w, h)
                  .outputQuality(qualityF)
                  .toFile(thumbFileUrl);
        result.put("url",thumb);
        result.put("status", "success");
        return result;
    }

    /***
     * @Author liuguicheng
     * @Description 生成新ios plist文件
     * @Date 9:34 2019/6/14
     * @Param [fileFix, fileUrl, fileVersion, ipaFileName]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     **/
    public static  Map<String, Object> copyPlistFile(String fileFix,String fileUrl, String fileVersion, String ipaFileName) {
        Map<String, Object> map = new HashMap<String, Object>(2);
        try {
            ClassPathResource classPathResource = new ClassPathResource("templates/iosfile/template.plist");
            File file = classPathResource.getFile();
            InputStream is = new FileInputStream(file);
            BufferedReader reader = new BufferedReader(new InputStreamReader(is));

            String filename = file.getName();
            File tmpfile = new File(file.getParentFile().getAbsolutePath()
                                            + "/" + filename + ".tmp");

            BufferedWriter writer = new BufferedWriter(new FileWriter(tmpfile));

            boolean flag1 = false;
            boolean flag2 = false;
            String str = null;
            while (true) {
                str = reader.readLine();

                if (str == null) {
                    break;
                }


                if (str.contains("FileVersion")) {
                    str = str.replace("FileVersion", fileVersion);
                    writer.write(str + "\n");
                    flag1 = true;
                } else if (str.contains("FileName") || str.contains("headUrl")) {
                    str = str.replace("FileName", ipaFileName).replace("headUrl", fileFix+ "/apk/IOS");
                    writer.write(str + "\n");
                    flag2 = true;
                } else {
                    writer.write(str + "\n");
                }
            }

            is.close();

            writer.flush();
            writer.close();
            String realPath = "";
            if (flag1 && flag2) {
                String reName = "ssqx_" + DateFormatUtils.format(new Date(), "yyyyMMddhhmmss") + ".plist";
                FileUtils.copyInputStreamToFile(new FileInputStream(tmpfile), new File(fileUrl, reName));
                realPath = fileUrl + "/" + reName;
                tmpfile.delete();
                map.put("realPath", realPath);
                map.put("reName", reName);
            } else {
                realPath = "";
                tmpfile.delete();
                map.put("realPath", realPath);
                map.put("reName", "");
            }
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) throws Exception {
        try {
            String file="D://project//file//qingxiu_ucenter//image//";
            Thumb("100x100","90",file+"2019-06-05/quvzvwkq6enicxm603wn4sconodrlzrd.png","png");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
