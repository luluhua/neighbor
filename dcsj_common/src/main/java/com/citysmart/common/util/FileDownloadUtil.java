package com.citysmart.common.util;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

public class FileDownloadUtil {

    /**
     * 从网络Url中下载文件
     * @param urlStr
     * @param fileName
     * @param savePath
     * @throws IOException
     */
    public static void  downLoadFromUrl(String urlStr,String fileName,String savePath) throws IOException{
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
//        ((HttpURLConnection) conn).setRequestMethod("GET");
//        conn.setRequestProperty("Content-Type", "text/xml");
//        conn.setRequestProperty("charset", "UTF-8");
//        String  s="Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36";
//        conn.setRequestProperty("User-Agent",s);
        //设置超时间为3秒
        conn.setConnectTimeout(3*1000);
//        conn.connect();

        //得到输入流
        InputStream inputStream = conn.getInputStream();
        //获取自己数组
        byte[] getData = readInputStream(inputStream);

        //文件保存位置
        File saveDir = new File(savePath);
        if(!saveDir.exists()){
            saveDir.mkdir();
        }
        File file = new File(saveDir+File.separator+fileName);
        FileOutputStream fos = new FileOutputStream(file);
        fos.write(getData);
        if(fos!=null){
            fos.close();
        }
        if(inputStream!=null){
            inputStream.close();
        }


        System.out.println("info:"+url+" download success");

    }



    /**
     * 从输入流中获取字节数组
     * @param inputStream
     * @return
     * @throws IOException
     */
    public static  byte[] readInputStream(InputStream inputStream) throws IOException {
        byte[] buffer = new byte[1024];
        int len = 0;
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        while((len = inputStream.read(buffer)) != -1) {
            bos.write(buffer, 0, len);
        }
        bos.close();
        return bos.toByteArray();
    }
    public static void main(String[] args) {
        try{
            downLoadFromUrl("http://192.168.1.45:8686/flow-study/app/rest/models/0384e591-659e-11e9-a401-049226c33eca/bpmn20?version=20190423191625",
                            "1019.bpmn20.xml","D:/project/file/process/process/");
        }catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }
}
