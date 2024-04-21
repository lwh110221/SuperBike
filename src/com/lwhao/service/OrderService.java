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
     * 创建订单
     * @param cart
     * @param userId
     * @return
     */
    public String createOrder(Cart cart, Integer userId);
    /**
     * 查询所有订单
     * @return
     */

    public List<Order> queryAllOrders();

    /**
     * 发货
     * @param orderId
     */
    public void sendOrder(String orderId);
    /**
     * 查询我的订单
     * @param id
     * @return
     */

    public List<Order> queryMyOrders(Integer id);
    /**
     * 确认收货
     * @param orderId
     */
    public void receivedOrder(String orderId);
    /**
     * 查询订单项
     * @param orderId
     * @return
     */

    List<OrderItem> showOrderItem(String orderId);
}
