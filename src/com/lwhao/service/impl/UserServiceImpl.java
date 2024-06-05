package com.lwhao.service.impl;

import com.lwhao.bean.Page;
import com.lwhao.bean.User;
import com.lwhao.dao.UserDao;
import com.lwhao.dao.impl.UserDaoImpl;
import com.lwhao.service.UserService;


import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/4/21 23:07
 * @Project : SuperBike
 */


public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDaoImpl();

    /**
     * 注册用户
     * @param user
     */

    @Override
    public void registUser(User user) {
        userDao.saveUser(user);
    }

    /**
     * 登录
     * @param user
     * @return
     */
    @Override
    public User login(User user) {
        return userDao.querybyUsernameAndPassword(user.getId(), user.getUsername(),user.getPassword());
    }

    /**
     * 判断用户名是否存在
     * @param username
     * @return
     */
    @Override
    public boolean existsUsername(String username) {
        if (userDao.querybyUsername(username) == null) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 添加用户
     * @param user
     */
    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }
    /**
     * 删除用户
     * @param i
     */
    @Override
    public void deleteUserById(int i) {
        userDao.deleteUserById(i);
    }

    /**
     * 更新用户
     * @param user
     */
    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }
    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    @Override
    public User queryUserById(Integer id) {
        return userDao.queryUserById(id);
    }
    /**
     * 查询所有用户
     * @return
     */
    @Override
    public List<User> queryUsers() {
        return userDao.queryUsers();
    }
    /**
     * 分页
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Override
    public Page<User> page(int pageNo, int pageSize) {
        Page<User> page = new Page<User>();

        //设置每页记录数
        page.setPageSize(pageSize);

        //设置总记录数
        Integer pageTotalCount = userDao.queryForPageTotalCount();
        page.setPageTotalCount(pageTotalCount);

        //求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if(pageTotalCount % pageSize >0) {
            pageTotal+=1;
        }
        //设置当前页
        if(pageNo>pageTotal) {
            pageNo = pageTotal;
        }
        //设置当前页
        if(pageNo<1) {
            pageNo = 1;
        }
        page.setPageNo(pageNo);
        //设置总页码
        page.setPageTotal(pageTotal);


        int begin = (page.getPageNo() -1)*pageSize;
        List<User> items = userDao.queryForPageItems(begin,pageSize);
        page.setItems(items);

        return page;
    }


    @Override
    public List<User> queryUsersExcludingAdmin() {
        return userDao.queryUsersExcludingAdmin();
    }

    @Override
    public void updateAdminStatus(int userId, String adminStatus) {
        userDao.updateAdminStatus(userId, adminStatus);
    }
}