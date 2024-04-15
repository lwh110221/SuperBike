package com.lwhao.dao;

import com.lwhao.bean.Bike;

import java.util.List;
import java.math.BigDecimal;

/**
 * @author : Luowenhao221
 * @date : 2024/4/12 18:53
 * @Project : SuperBike
 */

//自行车类的数据库操作接口
public interface BikeDao {
    /**
     * 添加自行车
     * @param bike
     */
    public int addBike(Bike bike);

    /**
     * 删除自行车
     * @param id
     */
    public int deleteBikeById(Integer id);

    /**
     * 更新自行车
     * @param bike
     * @return
     */
    public int updateBike(Bike bike);
    /**
     * 根据id查询自行车
     * @param id
     */
    public Bike queryBikeById(Integer id);

    /**
     * 查询所有自行车
     * @return
     */
    public List<Bike> queryBikes();

}
