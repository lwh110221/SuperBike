package com.lwhao.dao.impl;

import com.lwhao.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/4/14 18:26
 * @Project : SuperBike
 */

/**
 * 所有Dao的父类，封装了基本的增删改查操作
 */
public abstract class BaseDao {
    //使用DbUtils操作数据库
    private QueryRunner queryRunner = new QueryRunner();//QueryRunner对象可以用来执行SQL语句
    /**
     *update()方法用来执行Insert\Update\Delete语句
     * @return 如果返回-1则失败，成功返回影响的行数
     **/
    public int update(String sql,Object ... args) {
        Connection connection = JDBCUtils.getConnection();
        try {
            return queryRunner.update(connection,sql,args);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);//抛出运行时异常
        }
    }

    /**
     *查询返回多个Javabean的SQL语句
     * @param type 返回的对象类型
     * @param sql 执行的sql语句
     * @param args sql对应的参数值
     * @param <T> 返回的类型的泛型
     * @return
     */
    public <T> T queryForOne(Class<T> type,String sql,Object ... args) {
        Connection connection = JDBCUtils.getConnection();
        try {
            return queryRunner.query(connection,sql,new BeanHandler<T>(type),args);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    /**
     *查询返回多个Javabean的SQL语句
     * @param type 返回的对象类型
     * @param sql 执行的sql语句
     * @param args sql对应的参数值
     * @param <T> 返回的类型的泛型
     * @return
     */
    public <T> List<T> queryForList(Class<T> type, String sql, Object ... args) {
        Connection connection = JDBCUtils.getConnection();
        try {
            return queryRunner.query(connection, sql, new BeanListHandler<T>(type), args);//BeanListHandler()用于返回多行多列的数据
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * 执行返回一行一列的sql语句
     * @param sql 执行的sql语句
     * @param args sql对应的参数值
     * @return
     */
    public Object queryForSingleValue(String sql,Object ... args) {
        Connection connection = JDBCUtils.getConnection();
        try {
            return queryRunner.query(connection, sql, new ScalarHandler(), args);//ScalarHandler()用于返回一行一列的数据
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
