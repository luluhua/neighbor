package com.citysmart.ucenter.common.Util;

import com.citysmart.ucenter.common.HttpHelper;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.text.DecimalFormat;
import java.util.*;

public class AudioUtii {
    // 文件最大500M
    private static long upload_maxsize = 800 * 1024 * 1024;
    // 文件允许格式
    private static String[] allowFiles =
            {".rar", ".doc", ".docx", ".zip", ".pdf", ".txt", ".swf", ".xlsx", ".gif", ".png", ".jpg", ".jpeg", ".bmp",
                    ".xls", ".mp4", ".flv", ".ppt", ".avi", ".mpg", ".wmv", ".3gp", ".mov", ".asf", ".asx", ".vob",
                    ".wmv9", ".rm", ".rmvb"};
    // 允许转码的视频格式（ffmpeg）
    private static String[] allowFLV = {".avi", ".mpg", ".wmv", ".3gp", ".mov", ".asf", ".asx", ".vob"};
    // 允许的视频转码格式(mencoder)
    private static String[] allowAVI = {".wmv9", ".rm", ".rmvb"};
    // 允许转码的视频格式（ffmpeg）
    private static String[] allowVoideType = {".mp4", ".flv", ".ppt", ".avi", ".mpg", ".wmv", ".3gp", ".mov", ".asf", ".asx", ".vob"};

    /**
     * 视频类型判断
     *
     * @param fileName
     * @return
     */
    public static  boolean checkVoideFileType(String fileName) {
        Iterator<String> type = Arrays.asList(allowVoideType).iterator();
        while (type.hasNext()) {
            String ext = type.next();
            if (fileName.toLowerCase().endsWith(ext)) {
                return true;
            }
        }
        return false;
    }
    /**
     * 文件类型判断
     *
     * @param fileName
     * @return
     */
    private static  boolean checkFileType(String fileName) {
        Iterator<String> type = Arrays.asList(allowFiles).iterator();
        while (type.hasNext()) {
            String ext = type.next();
            if (fileName.toLowerCase().endsWith(ext)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 视频类型判断(flv)
     *
     * @param fileEnd
     * @return
     */
    private boolean checkMediaType(String fileEnd) {
        Iterator<String> type = Arrays.asList(allowFLV).iterator();
        while (type.hasNext()) {
            String ext = type.next();
            if (fileEnd.equals(ext)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 视频类型判断(AVI)
     *
     * @param fileEnd
     * @return
     */
    private boolean checkAVIType(String fileEnd) {
        Iterator<String> type = Arrays.asList(allowAVI).iterator();
        while (type.hasNext()) {
            String ext = type.next();
            if (fileEnd.equals(ext)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取文件扩展名
     *
     * @return string
     */
    private String getFileExt(String fileName) {
        return fileName.substring(fileName.lastIndexOf("."));
    }

    /**
     * 依据原始文件名生成新文件名
     *
     * @return
     */
    private String getName(String fileName) {
        Iterator<String> type = Arrays.asList(allowFiles).iterator();
        while (type.hasNext()) {
            String ext = type.next();
            if (fileName.contains(ext)) {
                String newFileName = fileName.substring(0, fileName.lastIndexOf(ext));
                return newFileName;
            }
        }
        return "";
    }

    /**
     * 文件大小，返回kb.mb
     *
     * @return
     */
    private String getSize(File file) {
        String size = "";
        long fileLength = file.length();
        DecimalFormat df = new DecimalFormat("#.00");
        if (fileLength < 1024) {
            size = df.format((double) fileLength) + "BT";
        } else if (fileLength < 1048576) {
            size = df.format((double) fileLength / 1024) + "KB";
        } else if (fileLength < 1073741824) {
            size = df.format((double) fileLength / 1048576) + "MB";
        } else {
            size = df.format((double) fileLength / 1073741824) + "GB";
        }
        return size;
    }

    /***
     * @Author liuguicheng
     * @Description //TODO 上传视频 并转码
     * @Date 14:23 2019/9/20
     **/
    public String upVideo(MultipartFile multipartFile, String downloadUrl,String ext) throws Exception {
        String videoUrl="";
        String fileName = multipartFile.getOriginalFilename().toString();
        // 判断文件不为空
        if (multipartFile.getSize() != 0 && !multipartFile.isEmpty()) {
            // 判断文件大小
            if (multipartFile.getSize() <= upload_maxsize) {
                // 文件类型判断
                if (checkFileType(fileName) == false) {
                    throw new Exception("不支持当前格式文件");
                }
            } else {
                throw new Exception("文件大小超范围");
            }
        } else {
            throw new Exception("文件为空");
        }
        String logoPathDir = "/video/";
        String cdate = DateFormatUtils.format(new Date(), "yyyy-MM-dd");
        String logoRealPathDir = downloadUrl + logoPathDir + cdate;
        File logoSaveFile = new File(logoRealPathDir);
        if (!logoSaveFile.exists()) {
            logoSaveFile.mkdirs();
        }
        String name = fileName.substring(0, fileName.lastIndexOf("."));
        System.out.println("文件名称：" + name);
        // 新的文件名
//        String newFileName = this.getName(fileName);
        // 文件扩展名
        String fileEnd = this.getFileExt(fileName);
        // 绝对路径
        String fileNamedirs = logoRealPathDir + File.separator + name + fileEnd;

        File filedirs = new File(fileNamedirs);
        // 转入文件
        try {
            multipartFile.transferTo(filedirs);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //转换为mp4
//        if (this.checkMediaType(fileEnd)) {
//            try {
//                // 设置转换为flv格式后文件的保存路径
//                String codcFilePath = logoRealPathDir + File.separator + name + ".mp4";
//                // 获取配置的转换工具（ffmpeg.exe）的存放路径
//                String ffmpegPath = "";
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
        videoUrl=logoPathDir + cdate + File.separator + name + "."+ext;
        System.out.println("访问路径：" + videoUrl);
        System.out.println("存储路径：" + fileNamedirs);
        return videoUrl;
    }


    private static boolean processMp4(String befUlr,String afeUrl) {
        //转换器路径
        String ffmpegPath1 = HttpHelper.getHttpServletRequest().getServletContext().getRealPath("ffmpeg");
        List command = new ArrayList();
        command.add(ffmpegPath1 + "ffmpeg");
        command.add("-i");
        command.add(befUlr);
        command.add("-c:v");
        command.add("libx264");
        command.add("-mbd");
        command.add("0");
        command.add("-c:a");
        command.add("aac");
        command.add("-strict");
        command.add("-2");
        command.add("-pix_fmt");
        command.add("yuv420p");
        command.add("-movflags");
        command.add("faststart");
        command.add(afeUrl);
        try {
//            Process videoProcess = new ProcessBuilder(command).redirectErrorStream(true).start();
//            new PrintStream(videoProcess.getErrorStream()).start();
//            new PrintStream(videoProcess.getInputStream()).start();
//            videoProcess.waitFor();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
