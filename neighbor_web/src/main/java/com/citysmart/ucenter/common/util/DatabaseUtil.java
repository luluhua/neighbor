package com.citysmart.ucenter.common.util;
import com.citysmart.ucenter.module.appc.vo.TableFieldVo;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Configuration
public class DatabaseUtil {
    private final static Logger LOGGER = LoggerFactory.getLogger(DatabaseUtil.class);
    private static  String DRIVER;
    private static  String URL;
    private static  String USERNAME;
    private static  String PASSWORD;


    private static final String SQL = "SELECT * FROM ";// 数据库操作

    @Value("${spring.datasource.driver-class-name}")
    public  void setDRIVER(String driver) {
        DatabaseUtil.DRIVER = driver;
    }
    @Value("${spring.datasource.url}")
    public  void setURL(String url) {
        DatabaseUtil.URL = url;
    }
    @Value("${spring.datasource.username}")
    public  void setUSERNAME(String username) {
        DatabaseUtil.USERNAME = username;
    }
    @Value("${spring.datasource.password}")
    public  void setPASSWORD(String password) {
        DatabaseUtil.PASSWORD = password;
    }

    public  static void init() {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            LOGGER.error("can not load jdbc driver", e);
        }
    }

    /**
     * 获取数据库连接
     *
     * @return
     */
    public static Connection getConnection() {
        init();
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException e) {
            LOGGER.error("get connection failure", e);
        }
        return conn;
    }

    /**
     * 关闭数据库连接
     * @param conn
     */
    public static void closeConnection(Connection conn) {
        if(conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                LOGGER.error("close connection failure", e);
            }
        }
    }

    /**
     * 获取数据库下的所有表名
     */
    public static List<String> getTableNames() {
        List<String> tableNames = new ArrayList<>();
        Connection conn = getConnection();
        ResultSet rs = null;
        try {
            //获取数据库的元数据
            DatabaseMetaData db = conn.getMetaData();
            //从元数据中获取到所有的表名
            rs = db.getTables(null, null, null, new String[] { "TABLE" });
            while(rs.next()) {
                tableNames.add(rs.getString(3));
            }
        } catch (SQLException e) {
            LOGGER.error("getTableNames failure", e);
        } finally {
            try {
                rs.close();
                closeConnection(conn);
            } catch (SQLException e) {
                LOGGER.error("close ResultSet failure", e);
            }
        }
        return tableNames;
    }

    /**
     * 获取表中所有字段名称
     * @param tableName 表名
     * @return
     */
    public static List<TableFieldVo> getColumnNames(String tableName) {
        if(StringUtils.isBlank(tableName)){return null;}
        List<TableFieldVo> columnNames = new ArrayList<>();
        //与数据库的连接
        Connection conn = getConnection();
        PreparedStatement pStemt = null;
        String tableSql = SQL + tableName;
        try {
            pStemt = conn.prepareStatement(tableSql);
            //结果集元数据
            ResultSetMetaData rsmd = pStemt.getMetaData();
            //表列数
            int size = rsmd.getColumnCount();
            TableFieldVo tableFieldVo=null;
            for (int i = 0; i < size; i++) {
                tableFieldVo=new TableFieldVo();
                tableFieldVo.setFieldType(rsmd.getColumnTypeName(i+1));
                tableFieldVo.setKey(rsmd.getColumnName(i + 1));
                columnNames.add(tableFieldVo);
            }
        } catch (SQLException e) {
            LOGGER.error("getColumnNames failure", e);
        } finally {
            if (pStemt != null) {
                try {
                    pStemt.close();
                    closeConnection(conn);
                } catch (SQLException e) {
                    LOGGER.error("getColumnNames close pstem and connection failure", e);
                }
            }
        }
        return columnNames;
    }



    /**
     * 获取表中字段的所有注释
     * @param tableName
     * @return
     */
    public static List<String> getColumnComments(String tableName) {
        if(StringUtils.isBlank(tableName)){return null;}
        List<String> columnTypes = new ArrayList<>();
        //与数据库的连接
        Connection conn = getConnection();
        PreparedStatement pStemt = null;
        String tableSql = SQL + tableName;
        List<String> columnComments = new ArrayList<>();//列名注释集合
        ResultSet rs = null;
        try {
            pStemt = conn.prepareStatement(tableSql);
            rs = pStemt.executeQuery("show full columns from " + tableName);
            while (rs.next()) {
                columnComments.add(rs.getString("Comment"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                    closeConnection(conn);
                } catch (SQLException e) {
                    LOGGER.error("getColumnComments close ResultSet and connection failure", e);
                }
            }
        }
        return columnComments;
    }
    public static void main(String[] args) {
            System.out.println("ColumnNames:" + getColumnNames("t_app_user_idcard"));
            System.out.println("ColumnComments:" + getColumnComments("t_app_user_idcard"));
    }
}