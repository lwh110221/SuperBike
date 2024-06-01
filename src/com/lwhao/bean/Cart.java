package com.lwhao.bean;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author : Luowenhao221
 * @date : 2024/4/13 15:31
 * @Project : SuperBike
 */

/**
 * 购物车类
 */
public class Cart {
    private Integer totalCount;//购物车商品总数量
    private BigDecimal totalPrice;//购物车商品总价格
    public Integer getTotalCount() {
        Integer totalCount = 0;
        for (Map.Entry<Integer, CartItem> entry : items.entrySet()) {//遍历购物车中的商品
            totalCount += entry.getValue().getCount();//获取购物车中商品的数量
        }
        return totalCount;//返回总数量
    }

    /**
     * 购物车总价格
     */
    public BigDecimal getTotalPrice() {//获取购物车中商品的总价格
        BigDecimal totalPrice = new BigDecimal(0);//初始化总价格
        for (Map.Entry<Integer,CartItem>entry : items.entrySet()) {//遍历购物车中的商品
            totalPrice = totalPrice.add(entry.getValue().getTotalPrice());
        }
        return totalPrice;//返回总价格
    }

    /**
     * 购物车商品
     */
    public Map<Integer, CartItem> getItems() {//获取购物车中的商品
        return items;
    }

    /**
     * 设置购物车商品
     * @param items
     */
    public void setItems(Map<Integer, CartItem> items) {
        this.items = items;
    }


    /**
     * key是商品编号，value是商品信息
     */
    private Map<Integer,CartItem> items = new LinkedHashMap<Integer, CartItem>();//创建一个LinkedHashMap对象

    @Override
    public String toString() {
        return "Cart{" +
                "totalCount=" + getTotalCount() +
                ", totalPrice=" + getTotalPrice() +
                ", items=" + items +
                '}';
    }
    /**
     * 添加商品项
     * @param cartItem
     */
    public void addItem(CartItem cartItem) {
        //先查看购物车中是否包含此商品，如果有的话，数量更新，总金额更新；如果没有，直接放到集合中即可
        CartItem item = items.get(cartItem.getId());

        if(item == null) {
            //之前没有添加过此商品
            items.put(cartItem.getId(),cartItem);
        } else {
            item.setCount(item.getCount() + 1);//数量累计
            item.setTotalPrice(item.getPrice().multiply(new BigDecimal(item.getCount())));//更新总金额
        }
    }

    /**
     * 删除商品项
     * @param  id
     */
    public void deleteItem(Integer id) {
        items.remove(id);
    }

    /**
     * 清空购物车
     */
    public void clear() {
        items.clear();
    }

    /**
     * 修改商品数量
     * @param id
     * @param count
     */
    public void updateCount(Integer id,Integer count) {
        //先查看购物车中是否包含次商品，如果有的话，数量更新，总金额更新；
        CartItem cartItem = items.get(id);//获取购物车中的商品

        if(cartItem != null) {
            cartItem.setCount(count);
            cartItem.setTotalPrice(cartItem.getPrice().multiply(new BigDecimal(cartItem.getCount())));//更新总金额
        }
    }

}
