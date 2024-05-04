package com.lwhao.bean;

import java.math.BigDecimal;

/**
 * @author : Luowenhao221
 * @date : 2024/4/13 15:48
 * @Project : SuperBike
 */

// 订单项
public class OrderItem {
    private Integer id;
    private String name;
    private Integer count;
    private BigDecimal price;
    private BigDecimal totalPrice;
    private String orderId;
    private String address;
    private String phone;
    private String receiver;




    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    /**
     * @param id
     * @param name
     * @param count
     * @param price
     * @param totalPrice
     * @param orderId
     * @param address
     * @param phone
     * @param receiver
     */
    public OrderItem(Integer id, String name, Integer count, BigDecimal price, BigDecimal totalPrice, String orderId, String address, String phone, String receiver) {
        this.id = id;
        this.name = name;
        this.count = count;
        this.price = price;
        this.totalPrice = totalPrice;
        this.orderId = orderId;
        this.address = address;
        this.phone = phone;
        this.receiver = receiver;
    }

    public OrderItem() {
    }


    /**
     * 重写toString方法
     * @return
     */
    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", count=" + count +
                ", price=" + price +
                ", totalPrice=" + totalPrice +
                ", orderId='" + orderId + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", receiver='" + receiver + '\'' +
                '}';
    }
}
