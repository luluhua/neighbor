package com.citysmart.common.util;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Arrays;
import java.util.Date;

public class FileUtil {


    public static File getFile(String fileUrl){
      return new File(fileUrl);
    }

    /**
     * 递归删除文件（夹）
     * @param file
     * @return
     */
    public static boolean remove(File file) {
        if (!file.exists()) {
            return false;
        }
        if (file.isFile()) {
            return file.delete();
        }
        Arrays.asList(file.listFiles()).forEach(FileUtil::remove);
        return file.delete();
    }
    public static boolean writeWordFile(String downloadFileUrl,String fileName,String fileContent) throws Exception {
        boolean w = false;
        String path = downloadFileUrl;
        String cdate = DateFormatUtils.format(new Date(), "yyyy-MM-dd");
            if (!"".equals(path)) {
                // 检查目录是否存在
                File fileDir = new File(path+"/"+cdate);
                if (!fileDir.exists()) {
                     fileDir.mkdirs();
                }
                String head="<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">";
                fileContent= head+fileContent;
                byte b[] = fileContent.getBytes();
                ByteArrayInputStream bais = new ByteArrayInputStream(b);
                POIFSFileSystem poifs = new POIFSFileSystem();
                DirectoryEntry directory = poifs.getRoot();
                DocumentEntry documentEntry = directory.createDocument("WordDocument", bais);
                FileOutputStream ostream = new FileOutputStream(path+"/"+cdate+ "/"+fileName);
                poifs.writeFilesystem(ostream);
                bais.close();
                ostream.close();
                w=true;
            }
        return w;
    }

    public static void main(String[] args) throws Exception {
        String content = "<html><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">" +
                "<head>你好</head>" +
                "<body>" +
                "<table>" +
                "<tr>" +
                "<td>信息1</td>" +
                "<td>信息2</td>" +
                "<td>t3</td>" +
                "<tr>" +
                "</table>" +
                "</body>" +
                "</html>";

        writeWordFile("D://www//d","test.doc",content);
//        File f = new File("D:\\project\\log\\ssqx\\ssqx_authentcenter\\log\\debug");
//        System.out.println("removed:" + remove(f));

    }

}
