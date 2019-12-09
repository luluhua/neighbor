package com.citysmart.ucenter.common.util;

import com.citysmart.ucenter.module.appc.vo.dewnloadVO;
import org.springframework.core.env.Environment;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * @author li
 * @date 2019/4/20
 */
public class zipDownload {

    public static HttpServletResponse downLoadFiles(List<File> files, HttpServletResponse response, String fileurl) throws Exception {

        try {
            String zipFilename = fileurl + "/tempFile.zip";
            File file = new File(zipFilename);
            file.createNewFile();
            if (!file.exists()) {
                file.createNewFile();
            }
            response.reset();
            // response.getWriter()
            // 创建文件输出流
            FileOutputStream fous = new FileOutputStream(file);
            ZipOutputStream zipOut = new ZipOutputStream(fous);
            zipFile(files, zipOut);
            zipOut.close();
            fous.close();
            return downloadZip(file, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    /**
     * 把接受的全部文件打成压缩包
     */
    public static void zipFile(List files, ZipOutputStream outputStream) {
        int size = files.size();
        for (int i = 0; i < size; i++) {
            File file = (File) files.get(i);
            zipFile(file, outputStream);
        }
    }

    /**
     * 根据输入的文件与输出流对文件进行打包
     */
    public static void zipFile(File inputFile, ZipOutputStream ouputStream) {
        try {
            if (inputFile.exists()) {
                if (inputFile.isFile()) {
                    FileInputStream ins = new FileInputStream(inputFile);
                    BufferedInputStream bins = new BufferedInputStream(ins, 512);
                    ZipEntry entry = new ZipEntry(inputFile.getName());
                    ouputStream.putNextEntry(entry);
                    // 向压缩文件中输出数据
                    int nNumber;
                    byte[] buffer = new byte[512];
                    while ((nNumber = bins.read(buffer)) != -1) {
                        ouputStream.write(buffer, 0, nNumber);
                    }
                    // 关闭创建的流对象
                    bins.close();
                    ins.close();
                } else {
                    try {
                        File[] files = inputFile.listFiles();
                        for (int i = 0; i < files.length; i++) {
                            zipFile(files[i], ouputStream);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static HttpServletResponse downloadZip(File file, HttpServletResponse response) {
        if (file.exists() == false) {
            System.out.println("待压缩的文件目录：" + file + "不存在.");
        } else {
            try {
                // 以流的形式下载文件。
                InputStream fis = new BufferedInputStream(new FileInputStream(file.getPath()));
                byte[] buffer = new byte[fis.available()];
                fis.read(buffer);
                fis.close();
                // 清空response
                response.reset();

                OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
                response.setContentType("application/octet-stream");

                // 如果输出的是中文名的文件，在此处就要用URLEncoder.encode方法进行处理
                response.setHeader("Content-Disposition",
                        "attachment;filename=" + new String(file.getName().getBytes("GB2312"), "ISO8859-1"));
                toClient.write(buffer);
                toClient.flush();
                toClient.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                try {
                    File f = new File(file.getPath());
                    f.delete();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return response;
    }


    /**
     * 下载
     * @param response
     */

    /**
     * 下载
     *
     * @param response
     */
    public static void imgDownload(List<dewnloadVO> filelist, HttpServletResponse response, String fileurl, Integer type, String explain) {
        //存放--服务器上zip文件的目录
        String directory = fileurl;

        File directoryFile = new File(directory);
        if (!directoryFile.isDirectory() && !directoryFile.exists()) {
            directoryFile.mkdirs();
        }
        String zipFileName = explain + ".zip";
        String strZipPath = directory + "\\" + zipFileName;
        ZipOutputStream zipStream = null;
        FileInputStream zipSource = null;
        BufferedInputStream bufferStream = null;
        File zipFile = new File(strZipPath);
        try {
            zipStream = new ZipOutputStream(new FileOutputStream(zipFile));

            if (type == 1) {
                for (int i = 0; i < filelist.size(); i++) {
                    String realFileName = java.net.URLDecoder.decode(filelist.get(i).getFilename(), "UTF-8");
                    String realFilePath = java.net.URLDecoder.decode(filelist.get(i).getFileUrl(), "UTF-8");
                    File file = new File(directory + realFilePath);

                    if (file.exists()) {
                        zipSource = new FileInputStream(file);//将需要压缩的文件格式化为输入流
                        ZipEntry zipEntry = new ZipEntry(realFileName);//在压缩目录中文件的名字
                        zipStream.putNextEntry(zipEntry);//定位该压缩条目位置，开始写入文件到压缩包中
                        bufferStream = new BufferedInputStream(zipSource, 1024 * 10);
                        int read = 0;
                        byte[] buf = new byte[1024 * 10];
                        while ((read = bufferStream.read(buf, 0, 1024 * 10)) != -1) {
                            zipStream.write(buf, 0, read);
                        }
                    }
                }
            } else {
                for (int i = 0; i < filelist.size(); i++) {
                    //解码获取真实路径与文件名
                    String suffix = filelist.get(i).getFileUrl().substring(filelist.get(i).getFileUrl().lastIndexOf(".") + 1);
                    String realFileName = java.net.URLDecoder.decode(filelist.get(i).getFilename() + "." + suffix, "UTF-8");
                    String realFilePath = java.net.URLDecoder.decode(filelist.get(i).getFileUrl(), "UTF-8");
                    File file = new File(directory + realFilePath);

                    if (file.exists()) {
                        zipSource = new FileInputStream(file);//将需要压缩的文件格式化为输入流
                        ZipEntry zipEntry = new ZipEntry(realFileName);//在压缩目录中文件的名字
                        zipStream.putNextEntry(zipEntry);//定位该压缩条目位置，开始写入文件到压缩包中
                        bufferStream = new BufferedInputStream(zipSource, 1024 * 10);
                        int read = 0;
                        byte[] buf = new byte[1024 * 10];
                        while ((read = bufferStream.read(buf, 0, 1024 * 10)) != -1) {
                            zipStream.write(buf, 0, read);
                        }
                    }
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //关闭流
            try {
                if (null != bufferStream) {
                    bufferStream.close();
                }
                if (null != zipStream) {
                    zipStream.flush();
                    zipStream.close();
                }
                if (null != zipSource) {
                    zipSource.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        //判断系统压缩文件是否存在：true-把该压缩文件通过流输出给客户端后删除该压缩文件  false-未处理
        if (zipFile.exists()) {
            downImg(response, zipFileName, strZipPath);
            zipFile.delete();
        }

    }

    public static void downImg(HttpServletResponse response, String filename, String path) {
        if (filename != null) {
            FileInputStream is = null;
            BufferedInputStream bs = null;
            OutputStream os = null;
            try {
                File file = new File(path);
                if (file.exists()) {
                    //设置Headers
                    response.setHeader("Content-Type", "application/octet-stream");
                    //设置下载的文件的名称-该方式已解决中文乱码问题
                    response.setHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes("gb2312"), "ISO8859-1"));
                    is = new FileInputStream(file);
                    bs = new BufferedInputStream(is);
                    os = response.getOutputStream();
                    byte[] buffer = new byte[1024];
                    int len = 0;
                    while ((len = bs.read(buffer)) != -1) {
                        os.write(buffer, 0, len);
                    }
                } else {
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (is != null) {
                        is.close();
                    }
                    if (bs != null) {
                        bs.close();
                    }
                    if (os != null) {
                        os.flush();
                        os.close();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
