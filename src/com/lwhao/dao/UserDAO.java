package com.lwhao.dao;

import com.lwhao.bean.User;

import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/4/12 18:55
 * @Project : SuperBike
 */

//用户类的数据库操作接口
public interface UserDAO {
    public int saveUser(User user);

    public int addUser(User user);

    public int deleteUserById(int i);

    public int updateUser(User user);

    public User queryUserById(Integer id);
    public List<User> queryUsers();

}
