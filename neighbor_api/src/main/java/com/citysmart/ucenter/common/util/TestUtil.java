package com.citysmart.ucenter.common.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.CountDownLatch;

/**
 * @Description //TODO $
 * @email 282303392@qq.com
 * @author:liuguicheng
 * @date: 2019/7/2 14:32
 */
public class TestUtil {
    private static Integer c=1;
    public static void main(String[] args){
//        //参数字符串，如果拼接在请求链接之后，需要对中文进行 URLEncode   字符集 UTF-8
//        String param = "key=dd160607f53e4b50aad27abeccf9a2f0&location=南宁";
//        StringBuilder sb = new StringBuilder();
//        InputStream is = null;
//        BufferedReader br = null;
//        PrintWriter out = null;
//        try {
//            //接口地址
//            String url = "https://free-api.heweather.net/s6/weather";
//            URL uri = new URL(url);
//            HttpURLConnection connection = (HttpURLConnection) uri.openConnection();
//            connection.setRequestMethod("POST");
//            connection.setReadTimeout(5000);
//            connection.setConnectTimeout(10000);
//            connection.setRequestProperty("accept", "*/*");
//            //发送参数
//            connection.setDoOutput(true);
//            out = new PrintWriter(connection.getOutputStream());
//            out.print(param);
//            out.flush();
//            //接收结果
//            is = connection.getInputStream();
//            br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
//            String line;
//            //缓冲逐行读取
//            while ( ( line = br.readLine() ) != null ) {
//                sb.append(line);
//            }
//            System.out.println(sb.toString());
//        } catch ( Exception ignored ) {
//        } finally {
//            //关闭流
//            try {
//                if(is!=null){
//                    is.close();
//                }
//                if(br!=null){
//                    br.close();
//                }
//                if (out!=null){
//                    out.close();
//                }
//            } catch ( Exception ignored ) {}
//        }



        int count=100;
        final CountDownLatch cdl=new CountDownLatch(count);
        for (int i = 0; i < count; i++) {
            new Thread(new Runnable() {
                int a=0;
                @Override
                public void run() {
                    cdl.countDown();
                    try {
                        cdl.await();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    a=TestUtil.c;
                    System.out.println(">>a:"+a);
                }
            }).start();
        }

    }
}
