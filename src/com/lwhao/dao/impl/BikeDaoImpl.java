package com.lwhao.dao.impl;

import com.lwhao.bean.Bike;
import com.lwhao.dao.BikeDao;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author : Luowenhao221
 * @date : 2024/4/14 18:34
 * @Project : SuperBike
 */


/**
 * 实现BikeDao接口
 */
public class BikeDaoImpl extends BaseDao implements BikeDao {


    /**
     * 添加车辆
     * @param bike
     * @return
     */
    @Override
    public int addBike(Bike bike) {
        String sql = "insert into t_bike(`name`,`price`,`brand`,`sales`,`stock`,`size`,`classification`,`img_path`) values(?,?,?,?,?,?,?,?)";
        return update(sql, bike.getName(), bike.getPrice(), bike.getBrand(), bike.getSales(), bike.getStock(), bike.getSize(), bike.getClassification(), bike.getImg_path());
    }

    /**
     * 更新车辆
     * @param bike
     * @return
     */

    @Override
    public int updateBike(Bike bike) {
        String sql = "update t_bike set `name`=?,`price`=?,`brand`=?,`sales`=?,`stock`=?,`size`=?,`classification`=?,`img_path`=? where id=?";
        return update(sql, bike.getName(), bike.getPrice(), bike.getBrand(), bike.getSales(), bike.getStock(), bike.getSize(), bike.getClassification(), bike.getImg_path(), bike.getId());
    }

    @Override
    public Bike queryBikeById(Integer id) {
        String sql = "select * from t_bike where id = ?";
        return null;
    }

    @Override
    public int deleteBikeById(Integer id) {
        String sql = "delete from t_bike where id=?";
        return update(sql, id);
    }

}
