package com.lwhao.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.util.JdbcUtils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;


/**
 * @author : Luowenhao221
 * @date : 2024/4/12 20:00
 * @Project : SuperBike
 */
public class JDBCUtils {
    private static DruidDataSource dataSource;
    private static ThreadLocal<Connection> conns = new ThreadLocal<Connection>();

    static {
        try {
            Properties properties = new Properties();
            //读取jdbc.properties属性配置文件
            InputStream inputStream = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            //从流中加载数据
            properties.load(inputStream);
            //创建数据库连接池
            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 获取数据库连接池中的连接
     * 如果返回null，说明获取连接失败
     * @return
     */
    public static Connection getConnection() {
        Connection conn = conns.get();
        if(conn == null) {
            try {
                conn = dataSource.getConnection();//从数据库池中获取连接
                conns.set(conn);//保存到ThreadLocal对象中，供后面的JDBC操作使用
                conn.setAutoCommit(false);//设置为手动管理事务
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return conn;
    }

    /**
     * 提交事务并关闭释放连接
     */
    public static void commitAndClose() {
        Connection connection = conns.get();
        if(connection!=null) {
            try {
                connection.commit();//提交事务
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                try {
                    connection.close();//关闭连接释放资源
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        conns.remove();//从ThreadLocal对象中移除连接
    }

    /**
     * 回滚事务并关闭释放连接
     */
    public static void rollbackAndClose() {
        Connection connection = conns.get();
        if(connection!=null) {
            try {
                connection.rollback();//回滚事务
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                try {
                    connection.close();//关闭连接释放资源
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        //一定要执行remove操作，否则就会出错，因为tomcat底层使用了线程池技术
        conns.remove();
    }


    /**
     * 关闭连接，放回数据库连接池
     * @param conn
     */
    public static void close(Connection conn) {
        if(conn != null) {
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

}
