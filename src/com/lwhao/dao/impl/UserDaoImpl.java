package com.lwhao.dao.impl;

import com.lwhao.bean.User;
import com.lwhao.dao.UserDao;

import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/4/14 18:41
 * @Project : SuperBike
 */


/**
 * 实现UserDao接口
 */
public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public int saveUser(User user) {
        String sql = "insert into t_user(`username`,`password`) values(?,?)";
        return update(sql, user.getUsername(), user.getPassword(), user.getEmail());
    }

    @Override
    public int addUser(User user) {
        String sql = "insert into t_user(`username`,`password`) values(?,?)";
        return update(sql, user.getUsername(), user.getPassword(), user.getEmail());
    }

    @Override
    public int deleteUserById(int i) {
        String sql = "delete from t_user where id=?";
        return update(sql, i);
    }

    @Override
    public int updateUser(User user) {
        String sql = "update t_user set `username`=?,`password`=? where id=?";
        return update(sql, user.getUsername(), user.getPassword(), user.getId());
    }
}
