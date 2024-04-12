package com.lwhao.dao;

import com.lwhao.bean.Bike;

import java.util.List;
import java.math..BigDecimal;

/**
 * @author : Luowenhao221
 * @date : 2024/4/12 18:53
 * @Project : SuperBike
 */

//自行车类的数据库操作接口
public interface BikeDao {
    public int addBike(Bike bike);

    public int deleteBikeById(Integer id);

    public int updateBike(Bike bike);

    public Bike queryBikeById(Integer id);

}
