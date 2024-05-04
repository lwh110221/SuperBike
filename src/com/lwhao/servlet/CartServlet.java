package com.lwhao.servlet;

import com.google.gson.Gson;
import com.lwhao.bean.Bike;
import com.lwhao.bean.Cart;
import com.lwhao.bean.CartItem;
import com.lwhao.service.BikeService;
import com.lwhao.service.impl.BikeServiceImpl;
import com.lwhao.util.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author : Luowenhao221
 * @date : 2024/4/30 9:50
 * @Project : SuperBike
 */
public class CartServlet extends BaseServlet {
    private BikeService bikeService = new BikeServiceImpl();

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
        cart.addItem(cartItem);
        req.getSession().setAttribute("lastName",cartItem.getName());

        //返回购物车总数量和最后一个商品的名称
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("totalCount",cart.getTotalCount());
        resultMap.put("lastName",cartItem.getName());
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
            resp.sendRedirect(req.getHeader("Referer"));
        }

    }

}
