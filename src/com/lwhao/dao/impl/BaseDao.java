package com.lwhao.dao.impl;

import com.lwhao.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;


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
}
