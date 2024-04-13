package com.lwhao.bean;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author : Luowenhao221
 * @date : 2024/4/12 21:29
 * @Project : SuperBike
 */

// 订单类
public class Order {
    private String orderId;
    private Date createTime;
    private BigDecimal price;
    private Integer userId;
    private Integer status = 0; // 0:未发货 1:已发货 2:已签收 默认为0


    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }




    /**
     * @param orderId 订单号
     * @param createTime 订单创建时间
     * @param price 订单总价
     * @param status 订单状态
     * @param userId 用户id
     */
    public Order(String orderId, Date createTime, BigDecimal price, Integer status, Integer userId) {
        this.orderId = orderId;
        this.createTime = createTime;
        this.price = price;
        this.status = status;
        this.userId = userId;
    }

    public Order() {
    }//无参构造方法


    // 重写toString方法
    @Override
    public String toString() {
        return "Order{" +
                "orderId='" + orderId + '\'' +
                ", createTime=" + createTime +
                ", price=" + price +
                ", status=" + status +
                ", userId=" + userId +
                '}';
    }
}
