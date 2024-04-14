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

}
