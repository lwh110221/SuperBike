package com.lwhao.servlet;

import com.lwhao.bean.Order;
import com.lwhao.bean.OrderItem;
import com.lwhao.bean.Cart;
import com.lwhao.bean.User;
import com.lwhao.service.OrderService;
import com.lwhao.service.impl.OrderServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/5/2 15:45
 * @Project : SuperBike
 */
public class ClientOrderServlet extends BaseServlet{
    private OrderService orderService = new OrderServiceImpl();

    /**
     * 生成订单
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void createOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        User loginUser = (User) req.getSession().getAttribute("user");
        if(loginUser==null) {
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
            return;
        }
        Integer userId = loginUser.getId();
        String orderId = orderService.createOrder(cart,userId);

        //req.setAttribute("orderId",orderId);
        req.getSession().setAttribute("orderId",orderId);
        //req.getRequestDispatcher("/pages/cart/paid.jsp").forward(req,resp);
        resp.sendRedirect(req.getContextPath()+"/pages/cart/paid.jsp");
    }

    /**
     * 判断是否登录
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */

    protected void isLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        User loginUser = (User) req.getSession().getAttribute("user");
        if(loginUser==null) {
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
            return;
        }
        resp.sendRedirect(req.getContextPath()+"/pages/cart/order.jsp");
    }

    protected void myOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        // 用户未登录，需要先登录
        if (user == null) {
            // 如果用户没有登录，重定向到登录页面
            response.sendRedirect(request.getContextPath() + "/pages/user/login.jsp");
        } else {
            // 查询用户的订单信息
            List<Order> orders = orderService.queryMyOrders(user.getId());
            // 设置订单到域对象中
            request.setAttribute("myOrders", orders);
            // 转发到订单页面
            request.getRequestDispatcher("/pages/order/order.jsp").forward(request, response);
        }
    }

    /**
     * 确认收货
     */
    protected void receivedOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取发货的订单号
        String orderId = request.getParameter("orderId");
        // 发货
        orderService.receivedOrder(orderId);

        // 重定向到订单页面
        response.sendRedirect(request.getHeader("referer"));
    }

    /**
     * 显示订单项
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void showOrderItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        //获取前台传输的订单编号和域中的登录对象
        User user = (User) request.getSession().getAttribute("user");
        // 用户未登录，需要先登录
        if (user == null) {
            // 如果用户没有登录，重定向到登录页面
            response.sendRedirect(request.getContextPath() + "/pages/user/login.jsp");
        } else {
            // 查询用户的订单信息
            List<OrderItem> orderItems = orderService.showOrderItem(orderId);
            // 设置订单到域对象中
            request.setAttribute("orderItems", orderItems);
            // 转发到订单页面
            request.getRequestDispatcher("/pages/order/orderItem.jsp").forward(request, response);
        }
    }
}
