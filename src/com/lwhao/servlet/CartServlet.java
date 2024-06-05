package com.lwhao.servlet;

import com.google.gson.Gson;
import com.lwhao.bean.Bike;
import com.lwhao.bean.Cart;
import com.lwhao.bean.CartItem;
import com.lwhao.dao.CartDao;
import com.lwhao.dao.impl.CartDaoImpl;
import com.lwhao.service.BikeService;
import com.lwhao.service.impl.BikeServiceImpl;
import com.lwhao.util.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author : Luowenhao221
 * @date : 2024/4/30 9:50
 * @Project : SuperBike
 */
public class CartServlet extends BaseServlet {
    private BikeService bikeService = new BikeServiceImpl();
    private CartDao cartDao = new CartDaoImpl();

    /**
     * 处理加入购物车操作的ajax请求
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void ajaxAddItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = WebUtils.parseInt(req.getParameter("id"),0);
        Bike bike = bikeService.queryBikeById(id);
        CartItem cartItem = new CartItem(bike.getId(),bike.getName(),1,bike.getPrice(),bike.getPrice());
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if(cart==null) {
            cart = new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        // 获取用户ID
        int userId = (int) req.getSession().getAttribute("userId");
        // 将商品信息保存到数据库中
        cartDao.addCartItem(cartItem, userId);
        cart.addItem(cartItem);
        req.getSession().setAttribute("lastName",cartItem.getName());

        //返回购物车总数量
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("totalCount",cart.getTotalCount());
        Gson gson = new Gson();
        String resultMapJsonString = gson.toJson(resultMap);
        resp.getWriter().write(resultMapJsonString);

    }
    /**
     * 加入购物车
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void addItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = WebUtils.parseInt(req.getParameter("id"),0);
        Bike bike = bikeService.queryBikeById(id);
        CartItem cartItem = new CartItem(bike.getId(),bike.getName(),1,bike.getPrice(),bike.getPrice());
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if(cart==null) {
            cart = new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        // 获取用户ID
        int userId = (int) req.getSession().getAttribute("userId");
        // 将商品信息保存到数据库中
        cartDao.addCartItem(cartItem, userId);
        cart.addItem(cartItem);
        req.getSession().setAttribute("lastName",cartItem.getName());
        resp.sendRedirect(req.getHeader("Referer"));
    }

    /**
     * 删除商品项
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = WebUtils.parseInt(req.getParameter("id"),0);
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if(cart!=null) {
            cart.deleteItem(id);

            // 获取用户ID
            int userId = (int) req.getSession().getAttribute("userId");
            // 从数据库中删除商品信息
            cartDao.deleteCartItem(id, userId);

            resp.sendRedirect(req.getHeader("Referer"));
        }
    }

    /**
     * 清空商品项
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void clearItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("cart");

        // 获取用户ID
        int userId = (int) req.getSession().getAttribute("userId");
        // 从数据库中删除该用户的所有购物车信息
        for (CartItem item : cartDao.getCartItems(userId)) {
            cartDao.deleteCartItem(item.getId(), userId);
        }

        resp.sendRedirect(req.getHeader("Referer"));
    }

    /**
     * 修改商品数量
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void updateCount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = WebUtils.parseInt(req.getParameter("id"),0);
        int count = WebUtils.parseInt(req.getParameter("count"),1);
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if(cart!=null) {
            cart.updateCount(id,count);

            // 获取用户ID
            int userId = (int) req.getSession().getAttribute("userId");
            // 更新数据库中的商品数量
            CartItem item = new CartItem();
            item.setId(id);
            item.setCount(count);
            cartDao.updateCartItem(item, userId);

            resp.sendRedirect(req.getHeader("Referer"));
        }
    }
    /**
     * 查看购物车
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
        protected void viewCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int userId = (int) req.getSession().getAttribute("userId");
            Cart cart = new Cart();
            List<CartItem> cartItems = cartDao.getCartItems(userId);

            for (CartItem item : cartItems) {
                Bike bike = bikeService.queryBikeById(item.getId());
                item.setName(bike.getName());
                item.setPrice(bike.getPrice());
                item.setTotalPrice(bike.getPrice().multiply(new BigDecimal(item.getCount())));
                cart.addItem(item);
            }

            req.getSession().setAttribute("cart", cart);
            req.getRequestDispatcher("/pages/cart/cart.jsp").forward(req, resp);
        }

    protected void removeSelectedItems(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] selectedItemIds = req.getParameterValues("selectedItems");
        if (selectedItemIds == null || selectedItemIds.length == 0) {
            selectedItemIds = (String[]) req.getSession().getAttribute("selectedItemsIds");
        }

        if (selectedItemIds == null || selectedItemIds.length == 0) {
            return;
        }

        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart != null) {
            for (String idStr : selectedItemIds) {
                int id = Integer.parseInt(idStr);
                cart.deleteItem(id);

                // 获取用户ID
                int userId = (int) req.getSession().getAttribute("userId");
                // 从数据库中删除商品信息
                cartDao.deleteCartItem(id, userId);
            }
        }

        req.getSession().removeAttribute("selectedItems");
        req.getSession().removeAttribute("selectedItemsIds");
        req.getSession().removeAttribute("totalPrice");
    }




}
