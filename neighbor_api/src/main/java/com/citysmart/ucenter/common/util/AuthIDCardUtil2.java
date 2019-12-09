package com.citysmart.ucenter.common.util;

import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

public class AuthIDCardUtil2 {
    private static Logger logger = LoggerFactory.getLogger(AuthIDCardUtil2.class);
    private static String postContentType = "application/x-www-form-urlencoded";

    public static String sKey = "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4";

    /**
     * 网络调用
     * @param netUrl 网络路径,
     * */
    public static String UploadData(String netUrl, byte[] data) throws Exception {
        OutputStream outputStream=null;
        InputStream inputStream=null;
        BufferedReader bufferedReader=null;
        StringBuffer sbf=null;
        URL url = new URL(netUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setConnectTimeout(60000);
        connection.setReadTimeout(60000);
        connection.setRequestProperty("Content-Type",postContentType);
        connection.setDoInput(true);
        connection.setDoOutput(true);
        outputStream=connection.getOutputStream();
        outputStream.write(data);
        if (connection.getResponseCode() == 200) {
            //用getInputStream()方法获得服务器返回的输入流
            inputStream = connection.getInputStream();
            bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
            sbf = new StringBuffer();
            String temp = null;
            while ((temp = bufferedReader.readLine()) != null) {
                sbf.append(temp);
            }
        }

        bufferedReader.close();
        outputStream.close();
        inputStream.close();
//        return toByteArray(sbf.toString());
        return sbf.toString();
    }

    public static AuthApiResult ITFCenter(String IDCard,String Name,String Mobile) throws Exception {
        return null;
    }

    public static AuthApiResult PullAuthInfo(String TID) throws Exception {
        CertificationCryptoUtil des = new CertificationCryptoUtil();
        String url = "http://serviceapi.gaj.nanning.gov.cn:16822/API/Basic/ITFPublic/ITFCenter";
        ID id=new ID();
        id.setCertifyID(TID);

        ParasInfo model = new ParasInfo();
        model.setUSERID("Third_shxqx");
        model.setUSERPWD("shxqx");

        model.setPARAMETER(id);
        model.setSBH("OtherAuthIDCardInfo");
        ParasInfo_ param=new ParasInfo_();
        param.setParasInfo(model);

        String rawString=JSONObject.toJSONString(param);
        logger.error("请求参数加密json："+rawString);
        logger.error("请求参数加密:"+replaceParam(rawString));
        String postEncStr=des.encode(replaceParam(rawString));
        logger.error("请求参数加密结果："+postEncStr);
        byte[] rawData = toByteArray(postEncStr);
        String resultData = UploadData(url, rawData);
        logger.error("请求ITFCenter结果："+resultData);
        String decStr=DeCryptFromServer(resultData,des);
        logger.error("请求ITFCenter结果解密为："+decStr);
        AuthApiResult result=new AuthApiResult();
        Map<String,Object> map=JSONObject.parseObject(decStr);
        result.setState(Integer.parseInt(map.get("State").toString()));
        result.setMessage(map.get("Message").toString());
        result.setValue(map.get("Value").toString());
        result.setContent(map.get("Content")==null?"":map.get("Content").toString());
        return result;
    }


    public static String DeCryptFromServer(String SText, CertificationCryptoUtil des) throws Exception {
        String encData=des.decode(SText);
        return encData;
    }

    private static class CertifyIDClass {
        private String CertifyID;

        public CertifyIDClass(String CertifyID){
            this.CertifyID=CertifyID;
        }

        public String getCertifyID() {
            return CertifyID;
        }

        public void setCertifyID(String certifyID) {
            CertifyID = certifyID;
        }
    }

    public static class ParamsModel {
        private ParasInfo parasInfo;
        public ParasInfo getParasInfo() {
            return parasInfo;
        }
        public void setParasInfo(ParasInfo parasInfo) {
            this.parasInfo = parasInfo;
        }
    }

    public static class ParasInfo_{
        private ParasInfo parasInfo;

        public ParasInfo getParasInfo() {
            return parasInfo;
        }

        public void setParasInfo(ParasInfo parasInfo) {
            this.parasInfo = parasInfo;
        }
    }

    public static class ParasInfo{
        private String USERID;
        private String USERPWD;
        private String SBH;
        private String PARAMETER;

        public String getUSERID() {
            return USERID;
        }

        public void setUSERID(String USERID) {
            this.USERID = USERID;
        }

        public String getUSERPWD() {
            return USERPWD;
        }

        public void setUSERPWD(String USERPWD) {
            this.USERPWD = USERPWD;
        }

        public String getSBH() {
            return SBH;
        }

        public void setSBH(String SBH) {
            this.SBH = SBH;
        }

        public String getPARAMETER() {
            return PARAMETER;
        }

        public void setPARAMETER(ID id) {
            this.PARAMETER = JSONObject.toJSONString(id).replace("\\","");
        }
    }

    public static class PKey_{
        private String sKey;
        private ParasInfo_ SText;

        public String getsKey() {
            return sKey;
        }

        public void setsKey(String sKey) {
            this.sKey = sKey;
        }

        public ParasInfo_ getSText() {
            return SText;
        }

        public void setSText(ParasInfo_ SText) {
            this.SText = SText;
        }
    }

    public static class SText_{
        private ParasInfo ParasInfo;
    }

    public static class ID{
        private String CertifyID;

        public String getCertifyID() {
            return CertifyID;
        }

        public void setCertifyID(String certifyID) {
            CertifyID = certifyID;
        }
    }

    public static class PKey{
        private String SText;
        private String SKey;

        public String getSText() {
            return SText;
        }

        public void setSText(String SText) {
            this.SText = SText;
        }

        public String getSKey() {
            return SKey;
        }

        public void setSKey(String SKey) {
            this.SKey = SKey;
        }
    }

    public static class AuthApiResult{

        private int State;
        private String Message;
        private String Value;
        private String Content;

        public int getState() {
            return State;
        }

        public void setState(int state) {
            State = state;
        }

        public String getMessage() {
            return Message;
        }

        public void setMessage(String message) {
            Message = message;
        }

        public String getValue() {
            return Value;
        }

        public void setValue(String value) {
            Value = value;
        }

        public String getContent() {
            return Content;
        }

        public void setContent(String content) {
            Content = content;
        }
    }

    public static class ITFCenterData {
        private ParasInfo parasInfo;

        public ParasInfo getParasInfo() {
            return parasInfo;
        }

        public void setParasInfo(ParasInfo parasInfo) {
            this.parasInfo = parasInfo;
        }
    }

    public static class PARAMETER{
        private String Account;
        private String PWD;
        private String IDCard;
        private String Mobile;
        private String Name;
        private String RedirectURL;

        public String getAccount() {
            return Account;
        }

        public void setAccount(String account) {
            Account = account;
        }

        public String getPWD() {
            return PWD;
        }

        public void setPWD(String PWD) {
            this.PWD = PWD;
        }

        public String getIDCard() {
            return IDCard;
        }

        public void setIDCard(String IDCard) {
            this.IDCard = IDCard;
        }

        public String getMobile() {
            return Mobile;
        }

        public void setMobile(String mobile) {
            Mobile = mobile;
        }

        public String getName() {
            return Name;
        }

        public void setName(String name) {
            Name = name;
        }

        public String getRedirectURL() {
            return RedirectURL;
        }

        public void setRedirectURL(String redirectURL) {
            RedirectURL = redirectURL;
        }
    }

    public static byte[] toByteArray(String hexString) {
        return hexString.getBytes();
    }

    public class PullAuthInfoData{}

    private static String replaceParam(String info){
        return info.replace("pARAMETER","PARAMETER").replace("certifyID","CertifyID")
                .replace("uSERID","USERID").replace("uSERPWD","USERPWD")
                   .replace("parasInfo","ParasInfo").replace("sKey","SKey")
                   .replace("sText","SText").replace("sBH","SBH");
    }

}
