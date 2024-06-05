package com.lwhao.dao;
/**
 * @author : Luowenhao221
 * @date   : 2024/6/5 上午12:35
 * @Project : SuperBike
 *
*/

import com.lwhao.bean.CartItem;

import java.util.List;

public interface CartDao {
    int addCartItem(CartItem cartItem, int userId);
    int deleteCartItem(int itemId, int userId);
    int updateCartItem(CartItem cartItem, int userId);
    List<CartItem> getCartItems(int userId);
}