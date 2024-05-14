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
        /**
         * 保存订单项
         * @param orderItem 订单项
         * @return 返回影响的行数
         */
        public int saveOrderItem(OrderItem orderItem);

        /**
         * 展示订单项
         * @param orderId
         * @return
         */
        public List<OrderItem> showOrderItem(String orderId);

}
