package com.lwhao.service.impl;

import com.lwhao.bean.*;
import com.lwhao.dao.OrderDao;
import com.lwhao.dao.impl.OrderDaoImpl;
import com.lwhao.service.OrderService;
import com.lwhao.dao.impl.BikeDaoImpl;
import com.lwhao.dao.impl.OrderItemDaoImpl;
import com.lwhao.dao.BikeDao;
import com.lwhao.dao.OrderItemDao;

import java.util.Date;
import java.util.List;
import java.util.Map;
/**
 * @author : Luowenhao221
 * @date : 2024/4/18 10:49
 * @Project : SuperBike
 */
public class OrderServiceImpl implements OrderService{
    private OrderDao orderDao = new OrderDaoImpl();//创建OrderDao对象
    private OrderItemDao orderItemDao = new OrderItemDaoImpl();//创建OrderItemDao对象
    private BikeDao bikeDao = new BikeDaoImpl();//创建BikeDao对象

    /**
     * 创建订单
     * @param cart 购物车
     * @param userId 用户id
     * @return 返回订单号
     */
    @Override
    public String createOrder(Cart cart, Integer userId) {

        /**
         * 唯一订单号生成 逻辑：系统时间的毫秒表示加上用户的唯一标识符（userId）组合生成
         */
        String orderId = System.currentTimeMillis() + "" + userId;

           /**
            * 创建一个订单对象
            */
        Order order = new Order(orderId,new Date(),cart.getTotalPrice(),0,userId);
        orderDao.saveOrder(order);
        for(Map.Entry<Integer, CartItem>entry : cart.getItems().entrySet()) {
            /**
             * 获取每个购物车中的商品项转换为每一个订单项
             */
            CartItem cartItem = entry.getValue();
            OrderItem orderItem = new OrderItem(null,cartItem.getName(),cartItem.getCount(),cartItem.getPrice(),cartItem.getTotalPrice(),orderId,"", "", "");
            /**
             * 保存订单到数据库
             */
            orderItemDao.saveOrderItem(orderItem);
            Bike bike = bikeDao.queryBikeById(cartItem.getId());//根据商品id查询商品
            bike.setSales(bike.getSales() + cartItem.getCount());//更新销量
            bike.setStock(bike.getStock() - cartItem.getCount());//更新库存
            bikeDao.updateBike(bike);//更新商品

        }
        /**
         * 清空购物车
         */
        cart.clear();
        return orderId;
    }

    /**
     * 查询所有订单
     * @return 返回订单列表
     */
    @Override
    public List<Order> queryAllOrders() {
        // 查询所有订单
        return orderDao.queryAllOrders();
    }

    /**
     * 发货
     * @param orderId 订单号
     */
    @Override
    public void sendOrder(String orderId) {
        // 修改订单状态为已发货
        orderDao.updateOrderStatus(1, orderId);
    }

    /**
     * 查询我的订单
     * @param id 用户id
     * @return 返回订单列表
     */

    @Override
    public List<Order> queryMyOrders(Integer id) {
        return orderDao.queryMyOrders(id);
    }


    /**
     * 收货
     * @param orderId 订单号
     */

    @Override
    public void receivedOrder(String orderId) {
        // 修改订单状态为已收货
        orderDao.updateOrderStatus(2, orderId);
    }

    /**
     * 查询订单项
     * @param orderId 订单号
     * @return 返回订单项列表
     */

    @Override
    public List<OrderItem> showOrderItem(String orderId) {
        List<OrderItem> orderItems = orderItemDao.showOrderItem(orderId);
        return orderItems;
    }

}
