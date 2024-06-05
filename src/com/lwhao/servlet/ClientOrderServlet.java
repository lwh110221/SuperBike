package com.lwhao.servlet;

import com.lwhao.bean.*;
import com.lwhao.dao.CartDao;
import com.lwhao.dao.impl.CartDaoImpl;
import com.lwhao.service.OrderService;
import com.lwhao.service.impl.OrderServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/5/2 15:45
 * @Project : SuperBike
 */
public class ClientOrderServlet extends BaseServlet{
    private OrderService orderService = new OrderServiceImpl();
    private CartDao cartDao = new CartDaoImpl();


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
        List<CartItem> selectedItems = (List<CartItem>) req.getSession().getAttribute("selectedItems");

        if (loginUser == null) {
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
            return;
        }

        if (selectedItems == null || selectedItems.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/pages/cart/cart.jsp");
            return;
        }

        Cart selectedCart = new Cart();
        for (CartItem item : selectedItems) {
            selectedCart.addItem(item);
        }

        Integer userId = loginUser.getId();
        String orderId = orderService.createOrder(selectedCart, userId);

        req.getSession().setAttribute("orderId", orderId);

        // 删除选中的商品逻辑
        for (CartItem item : selectedItems) {
            cart.deleteItem(item.getId());
            cartDao.deleteCartItem(item.getId(), userId);
        }

        req.getSession().removeAttribute("selectedItems");
        req.getSession().removeAttribute("selectedItemsIds");
        req.getSession().removeAttribute("totalPrice");

        resp.sendRedirect(req.getContextPath() + "/pages/cart/paid.jsp");
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

    /**
     * 提交选中的商品
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */

    protected void submitSelectedItems(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] selectedItemIds = req.getParameterValues("selectedItems");
        if (selectedItemIds == null || selectedItemIds.length == 0) {
            resp.sendRedirect(req.getContextPath() + "/pages/cart/cart.jsp");
            return;
        }

        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            resp.sendRedirect(req.getContextPath() + "/pages/cart/cart.jsp");
            return;
        }

        List<CartItem> selectedItems = new ArrayList<>();
        BigDecimal totalPrice = BigDecimal.ZERO;

        for (String idStr : selectedItemIds) {
            int id = Integer.parseInt(idStr);
            CartItem item = cart.getItem(id);
            if (item != null) {
                selectedItems.add(item);
                totalPrice = totalPrice.add(item.getTotalPrice());
            }
        }

        req.getSession().setAttribute("selectedItems", selectedItems);
        req.getSession().setAttribute("selectedItemsIds", selectedItemIds);
        req.getSession().setAttribute("totalPrice", totalPrice);

        resp.sendRedirect(req.getContextPath() + "/pages/cart/order.jsp");
    }




}
