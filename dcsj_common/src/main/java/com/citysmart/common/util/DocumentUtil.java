package com.citysmart.common.util;

import org.dom4j.*;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DocumentUtil {

    /**
     * 修改xml
     * @param xml 原xml地址
     * @param newXml 修改后xml地址
     * @param rootNodeName 修改root 节点 name
     * @param stringMap 修改内容
     * @throws Exception
     */
    public static void updateXml(String xml,String newXml,Map<String,Map<String,String>> rootNodeName,Map<String,String> childMap) throws Exception {
        if(rootNodeName==null){
            return;
        }
        //1.创建并读取一个Document对象
        Document doc=new SAXReader().read(new File(xml));
        //2.得到标签对象
        Element contatcElem2=null;
        for (Map.Entry<String,Map<String,String>> entry : rootNodeName.entrySet()) {
            //2.得到标签对象
            contatcElem2=doc.getRootElement().element(entry.getKey());
            //3.通过增加同名的属性的方法,修改属性值
            for (Map.Entry<String,String> entry2 : entry.getValue().entrySet()) {
                contatcElem2.addAttribute(entry2.getKey(),entry2.getValue());
            }
            if(childMap!=null){
                List<Element> elementList=contatcElem2.elements();
                for(Element e:elementList){
                    for (Map.Entry<String,String> entry3 : childMap.entrySet()) {
                        if(entry3.getKey().equals(e.getName())&&"BPMNPlane".equals(e.getName())){
                            //修改子节点内容
                            e.addAttribute("bpmnElement",entry3.getValue());
                            e.addAttribute("id","BPMNPlane_"+entry3.getValue());
                        }else if(entry3.getKey().equals(e.getName())&&"documentation".equals(e.getName())){
                            e.setText(entry3.getValue());
                        }
                    }
                }
            }
        }
        //指定文件输出的位置
        FileOutputStream out =new FileOutputStream(newXml);
        OutputFormat format=OutputFormat.createPrettyPrint();   //漂亮格式：有空格换行
        /**
         * 指定生成的xml文档的编码影响了：
         *         1.xml文档保存时的编码
         *         2.xml文档声明的encoding编码（Xml解析时的编码）
         * 结论：使用该方法生成Xml文档可以避免中文乱码问题
         */
        format.setEncoding("UTF-8");
        //1.创建写出对象
        XMLWriter writer=new XMLWriter(out,format);

        //2.写出Document对象
        writer.write(doc);
        //3.关闭流
        writer.close();
    }

    /**
     * dom4j递归解析所有子节点
     * @return
     */
    public static  Map<String, Object> getElementsToString(String print) {
        //解析返回的xml字符串，生成document对象
        Document document = null;
        Map<String,Object> mapEle = null;
        try{
            document = DocumentHelper.parseText(print);
            //根节点
            Element root = document.getRootElement();
            //子节点
            List<Element> childElements = root.elements();

            mapEle = new HashMap<String, Object>();
            //遍历子节点
            mapEle = getAllElements(childElements,mapEle);
        }catch(DocumentException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return mapEle;
    }

    /**
     * dom4j递归解析所有子节点
     *
     * @param childElements
     * @param mapEle
     * @return
     */
    public static Map<String, Object> getAllElements(List<Element> childElements,Map<String,Object> mapEle) {
        for (Element ele:childElements){
            mapEle.put(ele.getName(), ele.getText());
            if(ele.elements().size()>0){
                mapEle = getAllElements(ele.elements(), mapEle);
            }
        }
        return mapEle;
    }

    public static void main(String[] args) {
        try{
            Map<String,String> stringMap1 =new HashMap<String,String>();
            stringMap1.put("name","123");
            stringMap1.put("id","a123");

            Map<String,String> stringMap2 =new HashMap<String,String>();
            stringMap2.put("id","BPMNDiagram_a123");

            Map<String, Map<String,String>> stringMap =new HashMap<String, Map<String,String>>();
            stringMap.put("process",stringMap1);
            stringMap.put("BPMNDiagram",stringMap2);

            Map<String,String> childMap =new HashMap<String,String>();
            childMap.put("documentation","测试");
            childMap.put("BPMNPlane","a123");

            DocumentUtil.updateXml("D:/Documents/989999.bpmn20.xml",
                                   "D:/Documents/123.bpmn20.xml",
                                   stringMap,childMap);

//            Map<String, Object> map=  getElementsToString("D:/Documents/989999.bpmn20.xml");
//            for (Map.Entry<String,Object> entry : map.entrySet()) {
//                System.out.println("key:"+entry.getKey()+"--"+"val:"+entry.getValue());
//            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
