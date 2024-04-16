package com.lwhao.service;

import com.lwhao.bean.Bike;
import com.lwhao.bean.Page;

import java.util.List;
import java.math.BigDecimal;

/**
 * @author : Luowenhao221
 * @date : 2024/4/12 20:56
 * @Project : SuperBike
 */
public interface BikeService {
    /**
     * 添加自行车车
     * @param bike
     */
    public void addBike(Bike bike);
    /**
     * 更新自行车车
     * @param bike
     */

    public void updateBike(Bike bike);
    /**
     * 删除自行车车
     * @param id
     */
    public void deleteBikeById(Integer id);
    /**
     * 根据id查询自行车车
     * @param id
     * @return
     */
    public Bike queryBikeById(Integer id);
    /**
     * 查询所有自行车车
     * @return
     */
    public List<Bike> queryBikes();
/**
     * 根据价格查询自行车车
     * @return
     */
    public Integer queryTotalBikes();
/**
     * 查询所有自行车车的总价
     * @return
     */
    BigDecimal queryTotalMoney();

    /**
     * 分页查询
     * @param pageNo
     * @param pageSize
     * @return
     */

    Page<Bike> page(int pageNo, int pageSize);

    /**
     * 根据价格分页查询
     * @param pageNo
     * @param pageSize
     * @param min
     * @param max
     * @return
     */

    Page<Bike> pageByPrice(int pageNo, int pageSize, int min, int max);
    /**
     * 根据名称或品牌分页查询
     * @param pageNo
     * @param pageSize
     * @param nameOrBrand
     * @return
     */
    Page<Bike> pageByNameOrBrand(int pageNo, int pageSize, String nameOrBrand);
    /**
     * 查询所有自行车车并按价格排序
     * @return
     */
    Page<Bike> pageOrder();
}
