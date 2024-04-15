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
    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    @Override
    public User querybyUsername(String username) {
        String sql = "select `id`,`username`,`password`,`email`,`address`,`receiver`,`phone` from t_user where username = ?";
        return queryForOne(User.class,sql,username);
    }

    /**
     * 根据用户名和密码查询用户
     * @param username
     * @param password
     * @return
     */

    @Override
    public User querybyUsernameAndPassword(String username, String password) {
        String sql = "select * from t_user where username = ? and password = ?";
        return queryForOne(User.class,sql,username,password);
    }

    /**
     * 插入保存用户信息
     * @param user
     * @return
     */
    @Override
    public int saveUser(User user) {
        String sql = "insert into t_user(`username`,`password`,`email`,`address`,`receiver`,`phone`) values(?,?,?,?,?,?)";
        return update(sql,user.getUsername(),user.getPassword(),user.getEmail(),user.getAddress(),user.getReceiver(),user.getPhone());
    }

    /**
     * 添加用户
     * @param user
     * @return
     */

    @Override
    public int addUser(User user) {
        String sql = "insert into t_user(`username`,`password`,`email`,`address`,`receiver`,`phone`) values(?,?,?,?,?,?)";
        return update(sql,user.getUsername(),user.getPassword(),user.getEmail(),user.getAddress(),user.getReceiver(),user.getPhone());
    }

    /**
     * 根据id删除用户
     * @param i
     * @return
     */

    @Override
    public int deleteUserById(int i) {
        String sql = "delete from t_user where id = ?";
        return update(sql,i);
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */

    @Override
    public int updateUser(User user) {
        String sql = "update t_user set `username`=?,`password`=?,`email`=?,`address`=?,`receiver`=?,`phone`=? where id=?";
        return update(sql,user.getUsername(),user.getPassword(),user.getEmail(),user.getAddress(),user.getReceiver(),user.getPhone(),user.getId());
    }

    /**
     * 根据id查询用户
     * @param id
     * @return
     */

    @Override
    public User queryUserById(Integer id) {
        String sql = "select * from t_user where id=?";
        return queryForOne(User.class,sql,id);
    }

    /**
     * 查询所有用户
     * @return
     */

    @Override
    public List<User> queryUsers() {
        String sql = "select * from t_user";
        return queryForList(User.class,sql);
    }

}
