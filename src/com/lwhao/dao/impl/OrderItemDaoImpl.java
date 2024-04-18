package com.lwhao.dao.impl;

import com.lwhao.bean.OrderItem;
import com.lwhao.dao.OrderItemDao;

import java.util.List;
/**
 * @author : Luowenhao221
 * @date : 2024/4/18 10:47
 * @Project : SuperBike
 */
public class OrderItemDaoImpl extends BaseDao implements OrderItemDao {
    /**
     * 保存订单项
     * @param orderItem 订单项
     * @return 返回影响的行数
     */
    @Override
    public int saveOrderItem(OrderItem orderItem) {
        String sql = "insert into t_order_item(`name`,`count`,`price`,`total_price`,`order_id`) values(?,?,?,?,?)";
        return update(sql,orderItem.getName(),orderItem.getCount(), orderItem.getPrice(),orderItem.getTotalPrice(), orderItem.getOrderId());
    }

    /**
     * 展示订单项
     * @param orderId 订单id
     * @return 返回订单项列表
     */
    @Override
    public List<OrderItem> showOrderItem(String orderId) {
        String sql = "select `id`,`name`,`count`,`price`,`total_price`AS `totalPrice`,`order_id`AS `orderId` from t_order_item where order_id=?";
        return queryForList(OrderItem.class,sql,orderId);

    }
}
