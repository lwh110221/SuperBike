package com.lwhao.service;

import com.lwhao.bean.*;
import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/4/13 12:40
 * @Project : SuperBike
 */
public interface OrderService {
    /**
     * 查询所有订单
     */
    public List<Order> queryAllOrders();
    /**
     * 创建订单
     * @param cart
     * @param userId
     * @return
     */
    public String createOrder(Cart cart, Integer userId);
    /**
     *查询我的订单
        * @param id
        * @return
        */
    public List<Order> queryMyOrders(Integer id);
    /**
     *  发货
     * @param orderId
     */
    public void sendOrder(String orderId);
    /**
     *  收货
     * @param orderId
     */
    public void receiveOrder(String orderId);
    /**
     *  显示订单详情
     * @param orderId
     * @return
     */
    List<OrderItem> showOrderItem(String orderId);
}
