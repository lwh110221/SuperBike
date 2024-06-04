package com.lwhao.dao;

import com.lwhao.bean.User;

import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/4/12 18:55
 * @Project : SuperBike
 */

//用户类的数据库操作接口
public interface UserDao {
    /**
     * 保存用户
     * @param user
     * @return
     */
    public int saveUser(User user);
    /**
     * 增加用户
     * @param user
     */

    public int addUser(User user);
    /**
     * 根据id删除用户
     * @param i
     */

    public int deleteUserById(int i);
    /**
     * 更新用户
     * @param user
     */

    public int updateUser(User user);
    /**
     * 根据id查询用户
     * @param id
     */

    public User queryUserById(Integer id);
    /**
     * 查询全部用户
     */
    public List<User> queryUsers();
    /**
     * 根据用户名查询用户
     * @param username
     * @return 返回null表示无此用户
     */
    public User querybyUsername(String username);
    /**
     * 根据用户名和密码查询用户
     *
     * @param id
     * @param username
     * @param password
     * @return 返回null表示用户名或密码错误
     */
    public User querybyUsernameAndPassword(Integer id, String username, String password);

    /**
     * 查询分页的总记录数
     * @return
     */
    public Integer queryForPageTotalCount();

    /**
     * 查询分页的数据
     * @param begin
     * @param pageSize
     * @return
     */

    public List<User> queryForPageItems(int begin, int pageSize);
}
