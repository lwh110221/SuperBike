package com.lwhao.dao;

import com.lwhao.bean.Order;
import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/4/13 12:10
 * @Project : SuperBike
 */
public interface OrderDao {
    public int saveOrder(Order order);

    public List<Order> queryAllOrders();
    //更新订单状态
    public void updateOrderStatus(int i, String orderId);
    //查看订单
    public List<Order> queryMyOrders(int userId);
}
