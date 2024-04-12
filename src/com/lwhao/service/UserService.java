package com.lwhao.service;

import com.lwhao.bean.User;

import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/4/12 20:28
 * @Project : SuperBike
 */

// 用户服务类
public interface UserService {
    /**
     * 注册用户
     * @param user
     */
    public void registUser(User user);
    /**
     * 登录
     * @param user
     * @return
     */
    public User login(User user);
    /**
     * 检查用户名是否可用
     * @param username
     * @return 返回true表示用户名已存在，返回false表示用户名可用
     */
    public boolean existsUsername(String username);

    /**
     * 添加用户
     * @param user
     */

    public void addUser(User user);
    /**
     * 根据id删除用户
     * @param i
     */

    public void deleteUserById(int i);
    /**
     * 更新用户
     * @param user
     */

    public void updateUser(User user);
    /**
     * 根据id查询用户
     * @param id
     * @return
     */

    public User queryUserById(Integer id);
    /**
     * 查询全部用户
     * @return
     */

    public List<User> queryUsers();

}
