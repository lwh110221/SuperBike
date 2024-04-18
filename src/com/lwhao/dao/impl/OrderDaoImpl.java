package com.lwhao.dao.impl;

import com.lwhao.bean.Order;
import com.lwhao.dao.OrderDao;

import java.util.List;
/**
 * @author : Luowenhao221
 * @date : 2024/4/18 10:44
 * @Project : SuperBike
 */
public class OrderDaoImpl extends BaseDao implements OrderDao {
    /**
     * 保存订单
     * @param order 订单
     * @return 返回影响的行数
     */
    @Override
    public int saveOrder(Order order) {
        String sql = "insert into t_order(`order_id`,`create_time`,`price`,`status`,`user_id`) values(?,?,?,?,?)";
        return update(sql,order.getOrderId(),order.getCreateTime(),order.getPrice(),order.getStatus(),order.getUserId());
    }

    /**
     * 查询所有订单
     * @return 返回订单列表
     */
    @Override
    public List<Order> queryAllOrders() {
        String sql = "select `order_id` AS `orderId`,`create_time`AS `createTime`,`price` AS `price`,`status` AS `status`,`user_id`  AS `userId` FROM t_order";
        List<Order> orders =  queryForList(Order.class,sql);
        return orders;
    }

    /**
     * 更新订单状态
     * @param status 状态
     * @param orderId 订单id
     */
    @Override
    public void updateOrderStatus(int status, String orderId) {
        String sql = "update t_order set status = ? where order_id = ?";
        update(sql, status, orderId);
    }

    /**
     * 查询我的订单
     * @param userId 用户id
     * @return 返回订单列表
     */

    @Override
    public List<Order> queryMyOrders(int userId) {
        String sql = "select `order_id` AS `orderId`,`create_time`AS `createTime`,`price` AS `price`,`status` AS `status`,`user_id`  AS `userId` FROM t_order where user_id=?";
        List<Order> orders =  queryForList(Order.class,sql,userId);
        return orders;// 返回订单列表
    }
}
