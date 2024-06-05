package com.lwhao.servlet;

import com.google.gson.Gson;
import com.lwhao.bean.Cart;
import com.lwhao.bean.CartItem;
import com.lwhao.bean.User;
import com.lwhao.dao.CartDao;
import com.lwhao.dao.impl.CartDaoImpl;
import com.lwhao.service.UserService;
import com.lwhao.service.impl.UserServiceImpl;
import com.lwhao.util.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author : Luowenhao221
 * @date : 2024/4/30 9:30
 * @Project : SuperBike
 */
public class UserServlet extends BaseServlet {
    private UserService userService = new UserServiceImpl();

    /**
     * 处理ajax请求
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void ajaxExistsusername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取请求参数
        String username = req.getParameter("username");
        // 调用userService.existsUsername（）
        boolean exitsUsername = userService.existsUsername(username);
        // 把返回的结果封装为map对象
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("exitsUsername", exitsUsername);

        Gson gson = new Gson();
        String json = gson.toJson(resultMap);
        resp.getWriter().write(json);
    }

    /**
     * 处理登陆的功能
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1、获取请求的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User loginUser = userService.login(new User(null, username, password, null, null, null, null, null));
        if (loginUser == null) {
            req.setAttribute("msg", "用户名或密码错误!");
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
        } else {
            // 保存用户登录的信息到session域中
            req.getSession().setAttribute("user", loginUser);
            // 保存用户ID到session域中
            req.getSession().setAttribute("userId", loginUser.getId());

            // 加载用户购物车数据
            CartDao cartDao = new CartDaoImpl();
            List<CartItem> cartItems = cartDao.getCartItems(loginUser.getId());
            Cart cart = new Cart();
            for (CartItem item : cartItems) {
                cart.addItem(item);
            }
            req.getSession().setAttribute("cart", cart);

            req.getRequestDispatcher("/pages/user/login_success.jsp").forward(req, resp);
        }
    }

    /**
     * 注销
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().invalidate();
        resp.sendRedirect(req.getContextPath());
    }

    /**
     * 处理注册的功能
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1、获取请求的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String repwd = req.getParameter("repwd");
        String email = req.getParameter("email");

        User user = (User) WebUtils.copyParamToBean(req.getParameterMap(), new User());

        // 2、检查用户名是否可用
        if (userService.existsUsername(username)) {
            // 不可用 跳回注册页面
            req.setAttribute("msg", "用户名已存在！");
            req.setAttribute("username", username);
            req.setAttribute("email", email);
            req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);
        } else {
            // 可用 调用service保存到数据库 跳到注册成功页面
            userService.registUser(user);
            req.getRequestDispatcher("/pages/user/regist_success.jsp").forward(req, resp);
        }
    }

    /**
     * 处理修改用户信息的功能
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) WebUtils.copyParamToBean(req.getParameterMap(), new User());
        userService.updateUser(user);
        User user1 = userService.queryUserById(user.getId());
        req.getSession().setAttribute("user", user1);
        resp.sendRedirect(req.getContextPath() + "/pages/user/userinfo.jsp");
    }
}
