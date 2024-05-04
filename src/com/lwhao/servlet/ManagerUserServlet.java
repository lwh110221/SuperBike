package com.lwhao.servlet;

import com.lwhao.bean.Page;
import com.lwhao.bean.User;
import com.lwhao.service.UserService;
import com.lwhao.service.impl.UserServiceImpl;
import com.lwhao.util.WebUtil;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;


import java.io.IOException;
import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/5/2 15:51
 * @Project : SuperBike
 */
public class ManagerUserServlet extends BaseServlet {
    private UserService userService = new UserServiceImpl();

    /**
     * 查看所有用户
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtil.parseInt(req.getParameter("pageNo"),0);
        pageNo+=1;
        User user = (User) WebUtil.copyParamToBean(req.getParameterMap(),new User());
        userService.addUser(user);
        //req.getRequestDispatcher("/bikemanager/bikeServlet?action=list").forward(req,resp);
        resp.sendRedirect(req.getContextPath() + "/bikemanager/UserServlet?action=page&pageNo=" +pageNo);
    }

    /**
     * 删除用户
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        int i = Integer.parseInt(id);
        userService.deleteUserById(i);
        resp.sendRedirect(req.getContextPath() + "/bikemanager/UserServlet?action=page&pageNo=" +req.getParameter("pageNo"));
    }

    /**
     * 更新用户
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */

    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) WebUtil.copyParamToBean(req.getParameterMap(),new User());
        userService.updateUser(user);
        resp.sendRedirect(req.getContextPath() + "/bikemanager/UserServlet?action=page&pageNo=" +req.getParameter("pageNo"));
    }

    /**
     * 获取用户
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void getUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        int i = Integer.parseInt(id);
        User user = userService.queryUserById(i);
        req.setAttribute("user",user);
        req.getRequestDispatcher("/pages/bikemanager/user_edit.jsp").forward(req,resp);
    }

    /**
     * 查看所有用户
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */


    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1、通过BikeService查询数据
        List<User> user = userService.queryUsers();
        //2、将数据保存在request域中
        req.setAttribute("user",user);
        //3、请求转发到pages/bikemanager/bike_manager.jsp
        req.getRequestDispatcher("/pages/bikemanager/user_manager.jsp").forward(req,resp);
    }


    /**
     * 分页
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */

    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1、获取请求的参数pageNo和pageSize
        int pageNo = WebUtil.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtil.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);

        //2、调用BikeService.page(pageNo,pageSize)方法：返回page对象
        Page<User> page = userService.page(pageNo,pageSize);
        page.setUrl("bikemanager/UserServlet?action=page");
        //3、保存Page对象到request域中
        req.setAttribute("page",page);
        //4、请求转发到page/bikemanager/bike_manager.jsp页面
        req.getRequestDispatcher("/pages/bikemanager/user_manager.jsp").forward(req,resp);
    }
}