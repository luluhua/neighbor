package com.citysmart.ucenter.component.mybatis.plus;

import com.baomidou.mybatisplus.exceptions.MybatisPlusException;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.toolkit.StringUtils;

import java.util.*;

/**
 * @author lub
 */
public class Generator {
    /**
     * <p>
     * 读取控制台内容
     * </p>
     */
    public static String scanner(String tip) {
        Scanner scanner = new Scanner(System.in);
        StringBuilder help = new StringBuilder();
        help.append("请输入" + tip + "：");
        System.out.println(help.toString());
        if (scanner.hasNext()) {
            String ipt = scanner.next();
            if (StringUtils.isNotEmpty(ipt)) {
                return ipt;
            }
        }
        throw new MybatisPlusException("请输入正确的" + tip + "！");
    }

    /**
     * RUN THIS
     */
    public static void main(String[] args) {
        // 代码生成器
        AutoGenerator mpg = new AutoGenerator();

        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        String projectPath = System.getProperty("user.dir");
        gc.setOutputDir(projectPath + "/generator");
        gc.setAuthor("lub");
        gc.setOpen(false);
        gc.setFileOverride(true);
        // 开启 activeRecord 模式
        gc.setActiveRecord(true);
        // XML 二级缓存
        gc.setEnableCache(false);
        // XML ResultMap
        gc.setBaseResultMap(true);
        // XML columList
        gc.setBaseColumnList(false);

        // 自定义文件命名，注意 %s 会自动填充表实体属性！
        // gc.setMapperName("%sDao");
        // gc.setXmlName("%sDao");
        // gc.setServiceName("MP%sService");
        // gc.setServiceImplName("%sServiceDiy");
        // gc.setControllerName("%sAction");
        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setDbType(DbType.MYSQL);
        dsc.setTypeConvert(new MySqlTypeConvert() {
            // 自定义数据库表字段类型转换【可选】
            @Override
            public DbColumnType processTypeConvert(String fieldType) {
                return super.processTypeConvert(fieldType);
            }
        });
        dsc.setUrl(
                "jdbc:mysql://192.168.1.27:3306/qingxiu_ucenter?useUnicode=true&useSSL=false&characterEncoding=utf8");
        dsc.setDriverName("com.mysql.jdbc.Driver");
        dsc.setUsername("admin");
        dsc.setPassword("admin123456");
        mpg.setDataSource(dsc);

        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setModuleName(scanner("模块名"));
        pc.setParent("com.citysmart.ucenter.module");
        // 这里是控制器包名，默认 web
        pc.setController("controller");
        mpg.setPackageInfo(pc);

        // 自定义模板配置，可以 copy 源码 mybatis-plus/src/main/resources/templates 下面内容修改，
        // 放置自己项目的 src/main/resources/templates 目录下, 默认名称一下可以不配置，也可以自定义模板名称
        TemplateConfig tc = new TemplateConfig();
        tc.setController("/templates/mybatisplus/controller.java.vm");
        tc.setEntity(null);
        tc.setMapper(null);
        tc.setXml(null);
//         如上任何一个模块如果设置 空 OR Null 将不生成该模块。
        mpg.setTemplate(tc);

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setSuperEntityColumns(new String[]{"id", "dtCreate", "isDeleted"});
        strategy.setSuperControllerClass("com.citysmart.ucenter.common.controller.SuperController");
        String[] table = scanner("表名").split(",");
        strategy.setInclude(table);
        mpg.setStrategy(strategy);

        String moduleName = scanner("所属菜单名称");

        // 自定义输出路径
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
                Map<String, Object> map = new HashMap<String, Object>(1);
                map.put("moduleName", moduleName);
                this.setMap(map);
            }
        };
        List<FileOutConfig> focList = new ArrayList<>();
        focList.add(new FileOutConfig("/templates/mapper.xml.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return projectPath + "/generator/mapper/" + pc.getModuleName()
                        + "/" + tableInfo.getEntityName() + "Mapper" + ".xml";
            }
        });
        focList.add(new FileOutConfig("/templates/mapper.java.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return projectPath + "/generator/mybatis/mapper/" + pc.getModuleName()
                        + "/" + tableInfo.getEntityName() + "Mapper" + ".java";
            }
        });
        focList.add(new FileOutConfig("/templates/entity.java.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return projectPath + "/generator/mybatis/model/" + pc.getModuleName()
                        + "/" + tableInfo.getEntityName() + ".java";
            }
        });
        // 自定义 list.ftl 生成
        focList.add(new FileOutConfig("/templates/mybatisplus/list.html.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return projectPath + "/generator/templates/" + pc.getModuleName() + "/" +
                        tableInfo.getEntityName().toLowerCase() + "/" + "list.ftl";
            }
        });
//         自定义 edit.ftl 生成
        focList.add(new FileOutConfig("/templates/mybatisplus/edit.html.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return projectPath + "/generator/templates/" + pc.getModuleName() + "/" +
                        tableInfo.getEntityName().toLowerCase() + "/" + "edit.ftl";
            }
        });
//        自定义 detail.ftl 生成
        focList.add(new FileOutConfig("/templates/mybatisplus/detail.html.vm") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return projectPath + "/generator/templates/" + pc.getModuleName() + "/" +
                        tableInfo.getEntityName().toLowerCase() + "/" + "detail.ftl";
            }
        });
        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);

        mpg.execute();
    }
}
