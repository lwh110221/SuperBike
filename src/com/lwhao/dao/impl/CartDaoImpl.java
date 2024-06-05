
/**
 * @author : Luowenhao221
 * @date : 2024/6/5 上午12:36
 * @Project : SuperBike
 */

package com.lwhao.dao.impl;

import com.lwhao.bean.CartItem;
import com.lwhao.dao.CartDao;

import java.sql.SQLException;
import java.util.List;

public class CartDaoImpl extends BaseDao implements CartDao {
    @Override
    public int addCartItem(CartItem cartItem, int userId) {
        // 检查如果购物车中已经存在该商品，则更新数量，否则插入新记录
        String checkSql = "SELECT quantity FROM cart WHERE user_id = ? AND product_id = ?";
        Integer existingQuantity = (Integer) queryForSingleValue(checkSql, userId, cartItem.getId());

        if (existingQuantity != null) {
            // 商品已经存在，更新数量
            String updateSql = "UPDATE cart SET quantity = quantity + ? WHERE user_id = ? AND product_id = ?";
            return update(updateSql, cartItem.getCount(), userId, cartItem.getId());
        } else {
            // 商品不存在，插入新记录
            String insertSql = "INSERT INTO cart(user_id, product_id, quantity) VALUES(?, ?, ?)";
            return update(insertSql, userId, cartItem.getId(), cartItem.getCount());
        }
    }

    @Override
    public int deleteCartItem(int itemId, int userId) {
        String sql = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
        return update(sql, userId, itemId);
    }

    @Override
    public int updateCartItem(CartItem cartItem, int userId) {
        String sql = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
        return update(sql, cartItem.getCount(), userId, cartItem.getId());
    }

    @Override
    public List<CartItem> getCartItems(int userId) {
        String sql = "SELECT product_id AS id, quantity AS count FROM cart WHERE user_id = ?";
        return queryForList(CartItem.class, sql, userId);
    }
}
