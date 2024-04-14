package com.lwhao.dao;

import com.lwhao.bean.CartItem;
import com.lwhao.bean.OrderItem;

import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/4/14 17:39
 * @Project : SuperBike
 */

/**
 * OrderItemDao接口
 */
public interface OrderItemDao {
        public int saveOrderItem(OrderItem orderItem);//保存订单项

        public List<OrderItem> showOrderItem(String orderId);//根据订单号查询订单项

        public List<OrderItem> showOrderItemByUserId(int userId);//根据用户id查询订单项

        public int deleteOrderItem(String orderId);//根据订单号删除订单项

        public int deleteOrderItemByUserId(int userId);//根据用户id删除订单项


        public int updateOrderItem(OrderItem orderItem);//更新订单项


        public int updateOrderItemByUserId(int userId);//更新订单

}
