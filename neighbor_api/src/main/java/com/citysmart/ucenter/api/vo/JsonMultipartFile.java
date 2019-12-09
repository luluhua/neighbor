package com.citysmart.ucenter.api.vo;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

/**
 * 重写 MultipartFile 类
 * 通过filename 及file64
 * 实现json 文件上传
 */
public class JsonMultipartFile implements MultipartFile {

    public String filename;

    public String file64; // base64

    private byte[] filedata = null;

    @Override
    public String getName() {
        return filename;
    }

    @Override
    public String getOriginalFilename() {
        return filename;
    }

    @Override
    public String getContentType() {
        if(StringUtils.isNotBlank(filename)){
            return  FilenameUtils.getExtension(filename);
        }
        return "";
    }

    @Override
    public boolean isEmpty() {
        return false;
    }

    @Override
    public long getSize() {
        try {
            return getBytes()!=null?getBytes().length:0;
        } catch (IOException e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public byte[] getBytes() throws IOException {
        if(null==filedata){
            filedata =Base64.decodeBase64(file64);
        }
        return filedata;
    }

    @Override
    public InputStream getInputStream() throws IOException {
        return new ByteArrayInputStream(getBytes());
    }

    @Override
    public void transferTo(File file) throws IOException, IllegalStateException {

    }
}
