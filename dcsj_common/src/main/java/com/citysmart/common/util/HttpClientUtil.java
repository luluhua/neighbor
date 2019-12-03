package com.citysmart.common.util;

import com.alibaba.fastjson.JSONObject;
import com.citysmart.common.bean.HttpReposonVo;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.client.utils.DateUtils;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.CookieSpecProvider;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.impl.cookie.DefaultCookieSpec;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.*;

public class HttpClientUtil {
    private static Logger logger = LoggerFactory.getLogger(HttpClientUtil.class);
    /**
     * 发送POST请求
     *
     * @param url  请求url
     * @param map 请求数据
     * @return 结果
     */
    @SuppressWarnings("deprecation")
    public static String doPost(String url, Map<String, Object> map) throws UnsupportedEncodingException {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(20000)
                                                   .setConnectionRequestTimeout(10000).build();
        httpPost.setConfig(requestConfig);
        String context = StringUtils.EMPTY;
        if (map!=null) {
            JSONObject jsonParam = new JSONObject();
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                jsonParam.put(entry.getKey(), entry.getValue().toString());
            }
            StringEntity entity = new StringEntity(jsonParam.toString(), "utf-8");//解决中文乱码问题
            entity.setContentEncoding("UTF-8");
            entity.setContentType("application/json");
            httpPost.setEntity(entity);
        }
        // 设置回调接口接收的消息头
        httpPost.addHeader("Content-Type", "application/json");
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            context = EntityUtils.toString(entity, HTTP.UTF_8);
        } catch (Exception e) {
            logger.error("httpclient-POST請求异常："+e.getMessage());
        } finally {
            try {
                response.close();
                httpPost.abort();
                httpClient.close();
            } catch (Exception e) {
                logger.error("httpclient-POST請求关闭异常："+e.getMessage());
            }
        }
        return context;
    }


    /**
     * 带参数的get请求，如果状态码为200，则返回body，如果不为200，则返回null
     *
     * @param url
     * @return
     * @throws Exception
     */
    public static String doGet(String url, Map<String, Object> map) throws Exception {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        URIBuilder uriBuilder = new URIBuilder(url);
        if (map != null) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                uriBuilder.setParameter(entry.getKey(), entry.getValue().toString());
            }
        }
        HttpGet httpGet = new HttpGet(uriBuilder.build().toString());
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(20000)
                                                   .setConnectionRequestTimeout(10000).build();
        httpGet.setConfig(requestConfig);
        httpGet.addHeader("Content-Type", "application/json");
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpGet);
            // 判断状态码是否为200
            if (response.getStatusLine().getStatusCode() == 200) {
                // 返回响应体的内容
                return EntityUtils.toString(response.getEntity(), HTTP.UTF_8);
            }

        }catch (Exception e){
            logger.error("httpclient-GET請求异常："+e.getMessage());
        }finally {
            response.close();
        }
        return null;
    }

    public static HttpReposonVo doGetResponseCookies(String url, Map<String, Object> map) throws Exception {
        BasicCookieStore cookieStore = new BasicCookieStore();
        CloseableHttpClient httpclient = HttpClients.custom()
                                                    .setDefaultCookieStore(cookieStore)
                                                    .build();
        URIBuilder uriBuilder = new URIBuilder(url);
        if (map != null) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                uriBuilder.setParameter(entry.getKey(), entry.getValue().toString());
            }
        }
        HttpGet httpGet = new HttpGet(uriBuilder.build().toString());
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(20000)
                                                   .setConnectionRequestTimeout(10000).build();
        httpGet.setConfig(requestConfig);
        httpGet.addHeader("Content-Type", "application/json");
        CloseableHttpResponse response = null;
        try {
            response = httpclient.execute(httpGet);
            // 判断状态码是否为200
            if (response.getStatusLine().getStatusCode() == 200) {
                HttpReposonVo httpReposonVo=new HttpReposonVo();
                // 返回响应体的内容
                httpReposonVo.setCookies(cookieStore.getCookies());
                httpReposonVo.setResponseString(EntityUtils.toString(response.getEntity(), HTTP.UTF_8));
                return httpReposonVo ;
            }

        }catch (Exception e){
            logger.error("httpclient-GET請求异常："+e.getMessage());
        }finally {
            response.close();
        }
        return null;
    }
    public static HttpReposonVo doPostResponseCookies(String url, Map<String, Object> map) throws Exception {
        BasicCookieStore cookieStore = new BasicCookieStore();
        CloseableHttpClient httpclient = HttpClients.custom()
                                                    .setDefaultCookieStore(cookieStore)
                                                    .build();
        URIBuilder uriBuilder = new URIBuilder(url);
        if (map != null) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                uriBuilder.setParameter(entry.getKey(), entry.getValue().toString());
            }
        }
        HttpPost httpPost = new HttpPost(uriBuilder.build().toString());
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(20000)
                                                   .setConnectionRequestTimeout(10000).build();
        httpPost.setConfig(requestConfig);
        httpPost.addHeader("Content-Type", "application/json");
        CloseableHttpResponse response = null;
        try {
            response = httpclient.execute(httpPost);
            // 判断状态码是否为200
            if (response.getStatusLine().getStatusCode() == 200) {
                HttpReposonVo httpReposonVo=new HttpReposonVo();
                // 返回响应体的内容
                httpReposonVo.setCookies(cookieStore.getCookies());
                httpReposonVo.setResponseString(EntityUtils.toString(response.getEntity(), HTTP.UTF_8));
                return httpReposonVo ;
            }

        }catch (Exception e){
            logger.error("httpclient-GET請求异常："+e.getMessage());
        }finally {
            response.close();
        }
        return null;
    }

    /**
     * 发送带header参数的POST请求
     * @param url  请求url
     * @param map 请求数据
     * @param header_map header参数
     * @return 结果
     */
    @SuppressWarnings("deprecation")
    public static String doPostAddHeader(String url, Map<String, Object> map,Map<String, Object> header_map) throws UnsupportedEncodingException {
        HttpClient httpClient = null;
        HttpPost httpPost = new HttpPost(url);
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(20000)
                                                   .setConnectionRequestTimeout(10000).build();
        httpPost.setConfig(requestConfig);
        String context = StringUtils.EMPTY;
        if (map!=null) {
            JSONObject jsonParam = new JSONObject();
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                jsonParam.put(entry.getKey(), entry.getValue().toString());
            }
            StringEntity entity = new StringEntity(jsonParam.toString(), "utf-8");//解决中文乱码问题
            entity.setContentEncoding("UTF-8");
            entity.setContentType("application/json");
            httpPost.setEntity(entity);
        }
        // 设置回调接口接收的消息头
        httpPost.addHeader("Content-Type", "application/json");
        //添加header参数
        for (Map.Entry<String, Object> entry : header_map.entrySet()) {
            httpPost.addHeader(entry.getKey(), entry.getValue().toString());
        }

        HttpResponse response = null;
        try {
            response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            context = EntityUtils.toString(entity, HTTP.UTF_8);
        } catch (Exception e) {
            logger.error("httpclient-POST請求异常："+e.getMessage());
        } finally {
            try {
                httpPost.abort();
            } catch (Exception e) {
                logger.error("httpclient-POST請求关闭异常："+e.getMessage());
            }
        }
        return context;
    }


    /**
     * 带header参数的 带参数的get请求，如果状态码为200，则返回body，如果不为200，则返回null
     *
     * @param url
     * @param header_map header参数
     * @return
     * @throws Exception
     */
    public static String doGetAddHeader(String url, Map<String, Object> map,Map<String, Object> header_map) throws Exception {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        URIBuilder uriBuilder = new URIBuilder(url);
        if (map != null) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                uriBuilder.setParameter(entry.getKey(), entry.getValue().toString());
            }
        }
        HttpGet httpGet = new HttpGet(uriBuilder.build().toString());
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(20000)
                                                   .setConnectionRequestTimeout(10000).build();
        httpGet.setConfig(requestConfig);
        httpGet.addHeader("Content-Type", "application/json");
        //添加header参数
        for (Map.Entry<String, Object> entry : header_map.entrySet()) {
            httpGet.addHeader(entry.getKey(), entry.getValue().toString());
        }
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpGet);
            // 判断状态码是否为200
            if (response.getStatusLine().getStatusCode() == 200) {
                // 返回响应体的内容
                return EntityUtils.toString(response.getEntity(), HTTP.UTF_8);
            }
        }catch (Exception e){
            logger.error("httpclient-GET請求异常："+e.getMessage());
        }
        return null;
    }




    /**
     * 解析出url参数中的键值对
     *
     * @param url url参数
     * @return 键值对
     */
    public static Map<String, String> getRequestParam(String url) {

        Map<String, String> map = new HashMap<String, String>();
        String[] arrSplit = null;

        // 每个键值为一组
        arrSplit = url.split("[&]");
        for (String strSplit : arrSplit) {
            String[] arrSplitEqual = null;
            arrSplitEqual = strSplit.split("[=]");

            // 解析出键值
            if (arrSplitEqual.length > 1) {
                // 正确解析
                map.put(arrSplitEqual[0], arrSplitEqual[1]);
            } else {
                if (arrSplitEqual[0] != "") {
                    map.put(arrSplitEqual[0], "");
                }
            }
        }
        return map;
    }

    /**
     * 请求支持传入cookie数据
     * 请求方式为GET
     * */
    public static String doGetResponseWithCookies(String url, Map<String, Object> map,BasicCookieStore cookieStore) throws Exception {
        if(cookieStore==null){
            cookieStore = new BasicCookieStore();
        }
        CloseableHttpClient httpclient = HttpClients.custom()
                                                    .setDefaultCookieStore(cookieStore)
                                                    .build();
        URIBuilder uriBuilder = new URIBuilder(url);
        if (map != null) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                uriBuilder.setParameter(entry.getKey(), entry.getValue()+"");
            }
        }
        HttpGet httpGet = new HttpGet(uriBuilder.build().toString());
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(20000)
                                                   .setConnectionRequestTimeout(10000).build();
        httpGet.setConfig(requestConfig);
        httpGet.addHeader("Content-Type", "application/json");
        CloseableHttpResponse response = null;
        try {
            response = httpclient.execute(httpGet);
            return EntityUtils.toString(response.getEntity(), HTTP.UTF_8) ;
        }catch (Exception e){
            throw new RuntimeException();
        }finally {
            response.close();
        }
    }

    /**
     * 请求支持传入cookie数据
     * 请求方式为POST
     * */
    public static String doPostResponseWithCookies(String url, Map<String, Object> map,BasicCookieStore cookieStore) throws Exception {
        if(cookieStore==null){
            cookieStore = new BasicCookieStore();
        }
        CloseableHttpClient httpclient = HttpClients.custom()
                                                    .setDefaultCookieStore(cookieStore)
                                                    .build();
        HttpPost httpPost = new HttpPost(url);
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(20000)
                                                   .setConnectionRequestTimeout(10000).build();
        httpPost.setConfig(requestConfig);
        String context = StringUtils.EMPTY;
        if (map!=null) {
            StringEntity entity = new StringEntity(JSONObject.toJSONString(map), "utf-8");//解决中文乱码问题
            entity.setContentEncoding("UTF-8");
            entity.setContentType("application/json");
            httpPost.setEntity(entity);
        }
        // 设置回调接口接收的消息头
        httpPost.addHeader("Content-Type", "application/json");
        CloseableHttpResponse response = null;
        try {
            response = httpclient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            context = EntityUtils.toString(entity, HTTP.UTF_8);
        } catch (Exception e) {
            logger.error("httpclient-POST請求异常："+e.getMessage());
        } finally {
            try {
                response.close();
                httpPost.abort();
                httpclient.close();
            } catch (Exception e) {
                logger.error("httpclient-POST請求关闭异常："+e.getMessage());
            }
        }
        return context;
    }

    /**
     * 根据json串，拼接cookie并返回
     * */
    public static BasicCookieStore splitJoinCookieFormJson(String cookiesJsonData){
        if(cookiesJsonData==null||cookiesJsonData.trim().length()==0){
            return null;
        }
        try {
            BasicCookieStore basicCookieStore=null;
            List<Object> cookieJsonDataList= JSONObject.parseArray(cookiesJsonData);
            int count=0;
            if(cookieJsonDataList!=null&&cookieJsonDataList.size()>0){
                for(Object obj:cookieJsonDataList){
                    Map<String,Object> m=(Map<String,Object>)obj;
                    if(m.get("name")==null||m.get("value")==null){
                        continue;
                    }
                    count++;
                }
                if(count>0){
                    SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    basicCookieStore=new BasicCookieStore();
                    for(Object obj:cookieJsonDataList){
                        Map<String,Object> m=(Map<String,Object>)obj;
                        if(m.get("name")==null||m.get("value")==null){
                            continue;
                        }
                        BasicClientCookie bcc=new BasicClientCookie(m.get("name").toString(), m.get("value").toString());
                        bcc.setExpiryDate(m.get("expiryDate")==null?null:sf.parse(m.get("expiryDate").toString()));
                        bcc.setPath(m.get("path")==null?null:m.get("path").toString());
                        bcc.setDomain(m.get("domain")==null?null:m.get("domain").toString());
                        bcc.setComment(m.get("comment")==null?null:m.get("comment").toString());
                        bcc.setCreationDate(m.get("creationDate")==null?null:sf.parse(m.get("creationDate").toString()));
                        bcc.setSecure(m.get("secure")==null?false:Boolean.valueOf(m.get("secure").toString()));
                        basicCookieStore.addCookie(bcc);
                    }
                    return basicCookieStore;
                }else{
                    logger.error("splitJoinCookieFormJson 参数异常：传入的cookieJson中不存在name或value的属性");
                }
            }
        }catch (Exception e){
            logger.error("splitJoinCookieFormJson解析异常："+e.getMessage());
        }
        return null;
    }


    public static String doPost(String url,Map<String ,String> map,String contentType) throws UnsupportedEncodingException {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(20000)
                                                   .setConnectionRequestTimeout(10000).build();
        httpPost.setConfig(requestConfig);
        String context = StringUtils.EMPTY;
        if (map!=null) {
            ArrayList<BasicNameValuePair> list = new ArrayList<>();
            map.forEach((key, value) -> list.add(new BasicNameValuePair(key, value)));
            httpPost.setEntity(new UrlEncodedFormEntity(list, "UTF-8"));
        }
        // 设置回调接口接收的消息头
        httpPost.addHeader("Content-Type", contentType);
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            context = EntityUtils.toString(entity, HTTP.UTF_8);
        } catch (Exception e) {
            logger.error("httpclient-POST請求异常："+e.getMessage());
        } finally {
            try {
                response.close();
                httpPost.abort();
                httpClient.close();
            } catch (Exception e) {
                logger.error("httpclient-POST請求关闭异常："+e.getMessage());
            }
        }
        return context;
    }

    public static String doPostForm(String url, Map<String, String> map,String contentType) throws UnsupportedEncodingException {
        return doPostForm(url, map, null, contentType);
    }

    public static String doPostForm(String url, Map<String, String> map,Map<String ,String> headerMap,String contentType) throws UnsupportedEncodingException {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(20000)
                                                   .setConnectionRequestTimeout(10000).build();
        httpPost.setConfig(requestConfig);
        if(headerMap!=null){
            for (Map.Entry<String, String> entry : headerMap.entrySet()) {
                httpPost.addHeader(entry.getKey(),entry.getValue());
            }
        }
        String context = StringUtils.EMPTY;
        if (map!=null) {
            ArrayList<BasicNameValuePair> list = new ArrayList<>();
            map.forEach((key, value) -> list.add(new BasicNameValuePair(key, value)));
            httpPost.setEntity(new UrlEncodedFormEntity(list, "UTF-8"));
        }
        // 设置回调接口接收的消息头
        httpPost.addHeader("Content-Type", contentType);
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            context = EntityUtils.toString(entity, HTTP.UTF_8);
        } catch (Exception e) {
            logger.error("httpclient-POST請求异常："+e.getMessage());
        } finally {
            try {
                response.close();
                httpPost.abort();
                httpClient.close();
            } catch (Exception e) {
                logger.error("httpclient-POST請求关闭异常："+e.getMessage());
            }
        }
        return context;
    }

    public static String doPost(String url, Map<String, Object> map,String authToken,String contentType) throws UnsupportedEncodingException {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(20000)
                                                   .setConnectionRequestTimeout(10000).build();
        httpPost.setConfig(requestConfig);
        httpPost.addHeader("Authorization","bearer "+authToken);
        String context = StringUtils.EMPTY;
        if (map!=null) {
            JSONObject jsonParam = new JSONObject();
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                jsonParam.put(entry.getKey(), entry.getValue().toString());
            }
            StringEntity entity = new StringEntity(jsonParam.toString(), "utf-8");//解决中文乱码问题
            entity.setContentEncoding("UTF-8");
            entity.setContentType(contentType);
            httpPost.setEntity(entity);
        }
        // 设置回调接口接收的消息头
        httpPost.addHeader("Content-Type", contentType);
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            context = EntityUtils.toString(entity, HTTP.UTF_8);
        } catch (Exception e) {
            logger.error("httpclient-POST請求异常："+e.getMessage());
        } finally {
            try {
                response.close();
                httpPost.abort();
                httpClient.close();
            } catch (Exception e) {
                logger.error("httpclient-POST請求关闭异常："+e.getMessage());
            }
        }
        return context;
    }
    public static String doPost(String url, Map<String, Object> map,Map<String ,Object> headerMap,String contentType) throws UnsupportedEncodingException {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(20000)
                                                   .setConnectionRequestTimeout(10000).build();
        httpPost.setConfig(requestConfig);
        if(headerMap!=null){
            for (Map.Entry<String, Object> entry : headerMap.entrySet()) {
                    httpPost.addHeader(entry.getKey(),entry.getValue().toString());
            }
        }
        String context = StringUtils.EMPTY;
        if (map!=null) {
            JSONObject jsonParam = new JSONObject();
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                jsonParam.put(entry.getKey(), entry.getValue().toString());
            }
            StringEntity entity = new StringEntity(jsonParam.toString(), "utf-8");//解决中文乱码问题
            entity.setContentEncoding("UTF-8");
            entity.setContentType(contentType);
            httpPost.setEntity(entity);
        }
        // 设置回调接口接收的消息头
        httpPost.addHeader("Content-Type", contentType);
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            context = EntityUtils.toString(entity, HTTP.UTF_8);
        } catch (Exception e) {
            logger.error("httpclient-POST請求异常："+e.getMessage());
        } finally {
            try {
                response.close();
                httpPost.abort();
                httpClient.close();
            } catch (Exception e) {
                logger.error("httpclient-POST請求关闭异常："+e.getMessage());
            }
        }
        return context;
    }



    static class MyCookieSpec extends DefaultCookieSpec {
        @Override
        public List<Cookie> parse(Header header, CookieOrigin cookieOrigin) throws MalformedCookieException {
            String value = header.getValue();
            String prefix = "Expires=";
            if (value.contains(prefix)) {
                String expires = value.substring(value.indexOf(prefix) + prefix.length());
                if(expires.indexOf(",")>0){
                    //正常格式
                    header = new BasicHeader("Expires=", expires);
                    return super.parse(header, cookieOrigin);
                }
                if(expires.indexOf(";")>0){
                    expires = expires.substring(0, expires.indexOf(";"));
                }
                //时间搓格式 需要转换
                String date = DateUtils
                        .formatDate(new Date(Long.parseLong(expires) * 1000L), "EEE, dd-MMM-yy HH:mm:ss z");
                value = value.replaceAll(prefix + "\\d{10};", prefix + date + ";");
            }
            header = new BasicHeader(header.getName(), value);
            return super.parse(header, cookieOrigin);
        }
    }

    public static  HttpReposonVo postResponseCookieAndHeader(String url, Map<String, Object> map)
            throws URISyntaxException {
        HttpReposonVo httpReposonVo=new HttpReposonVo();

        CloseableHttpClient httpClient = HttpClients.createDefault();
        //注册自定义CookieSpec
        Registry<CookieSpecProvider> cookieSpecProviderRegistry = RegistryBuilder.<CookieSpecProvider>create()
                .register("myCookieSpec", context -> new MyCookieSpec()).build();
        HttpClientContext context = HttpClientContext.create();
        context.setCookieSpecRegistry(cookieSpecProviderRegistry);
        URIBuilder uriBuilder = new URIBuilder(url);
        if (map != null) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                uriBuilder.setParameter(entry.getKey(), entry.getValue().toString());
            }
        }
        HttpPost post = new HttpPost(uriBuilder.build().toString());
        post.setConfig(RequestConfig.custom().setCookieSpec("myCookieSpec").build());

        try {

            CloseableHttpResponse response = httpClient.execute(post, context);
            try{
                // 返回响应体的内容
                response.getAllHeaders();
                httpReposonVo.setCookies(context.getCookieStore().getCookies());
                httpReposonVo.setHeaders(response.getAllHeaders());
                httpReposonVo.setResponseString(EntityUtils.toString(response.getEntity(), HTTP.UTF_8));



            }
            finally {
                response.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                httpClient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return httpReposonVo;
    }
    public static void getResopnseCookie(String url, Map<String, Object> map) throws URISyntaxException {
        CloseableHttpClient httpClient = HttpClients.createDefault();

        URIBuilder uriBuilder = new URIBuilder(url);
        if (map != null) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                uriBuilder.setParameter(entry.getKey(), entry.getValue().toString());
            }
        }
        HttpGet get=new HttpGet(uriBuilder.build().toString());
        HttpClientContext context = HttpClientContext.create();
        try {
            CloseableHttpResponse response = httpClient.execute(get, context);
            try{
                System.out.println(">>>>>>headers:");
                Arrays.stream(response.getAllHeaders()).forEach(System.out::println);
                System.out.println(">>>>>>cookies:");
                context.getCookieStore().getCookies().forEach(System.out::println);
            }
            finally {
                response.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                httpClient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    public  static void main(String[] args){
        String url="https://yun.longsunhd.com/api.php?ctl=qxuser&act=dologin";
        Map<String, Object> map=new HashMap<>();
        map.put("tenantid","qxy");
        map.put("username","test_name");
        map.put("member_id","123");
        map.put("token","132d431f1a8d58fc5ffc9cd3e43a769d");
        try {
            HttpReposonVo httpReposonVo= postResponseCookieAndHeader(url,map);
            //System.out.println(">>>>>>>>>>response string :"+httpReposonVo.getResponseString());
            //System.out.println(">>>>>>>>>>response cookies size :"+httpReposonVo.getCookies().size());
            System.out.println(">>>>>>cookies : ");
            httpReposonVo.getCookies().forEach(System.out::println);
            System.out.println(">>>>>>headers : ");
            Arrays.stream(httpReposonVo.getHeaders()).forEach(System.out::println);
        } catch (Exception e) {
            e.printStackTrace();
        }

//        try {
//            getResopnseCookie("https://www.baidu.com",null);
//        } catch (URISyntaxException e) {
//            e.printStackTrace();
//        }

    }
}
