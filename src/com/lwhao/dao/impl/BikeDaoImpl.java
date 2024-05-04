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
     * 添加自行车
     * @param bike
     */
    @Override
    public int addBike(Bike bike) {
        String sql = "insert into t_bike(`name`,`price`,`brand`,`sales`,`stock`,`size`,`classification`,`img_path`) values(?,?,?,?,?,?,?,?)";
        return update(sql,bike.getName(),bike.getPrice(),bike.getBrand(),bike.getSales(),bike.getStock(),bike.getSize(),bike.getClassification(),bike.getImg_path());
    }

    /**
     * 更新自行车
     * @param bike
     * @return
     */
    @Override
    public int updateBike(Bike bike) {
        String sql = "update t_bike set `name`=?,`price`=?,`brand`=?,`sales`=?,`stock`=?,`size`=?,`classification`=?,`img_path`=? where id=?";
        return update (sql,bike.getName(),bike.getPrice(),bike.getBrand(),bike.getSales(),bike.getStock(),bike.getSize(),bike.getClassification(),bike.getImg_path(),bike.getId());
    }

    /**
     * 删除自行车
     * @param id
     * @return
     */
    @Override
    public int deleteBikeById(Integer id) {
        String sql = "delete from t_bike where id=?";
        return update(sql,id);
    }

    /**
     * 根据id查询自行车
     * @param id
     * @return
     */
    @Override
    public Bike queryBikeById(Integer id) {
        String sql = "select * from t_bike where id = ?";
        return queryForOne(Bike.class,sql,id);
    }

    /**
     * 查询所有自行车
     * @return
     */
    @Override
    public List<Bike> queryBikes() {
        String sql = "select * from t_bike";
        return queryForList(Bike.class,sql);
    }


    /**
     * 分页查询自行车总数
     * @return
     */
    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(*) from t_bike";
        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }


    /**
     * 分页查询自行车
     * @param begin
     * @param pageSize
     * @return
     */
    @Override
    public List<Bike> queryForPageItems(int begin, int pageSize) {
        String sql = "select * from t_bike limit ?,?";
        return queryForList(Bike.class,sql,begin,pageSize);
    }


    /**
     * 根据价格查询自行车总数
     * @param min
     * @param max
     * @return
     */
    @Override
    public Integer queryForPageTotalCountByPrice(int min, int max) {
        String sql = "select count(*) from t_bike where price between ? and ?";
        Number count = (Number) queryForSingleValue(sql,min,max);
        return count.intValue();
    }

    /**
     * 根据价格查询自行车并分页
     * @param begin
     * @param pageSize
     * @param min
     * @param max
     * @return
     */

    @Override
    public List<Bike> queryForPageItemsByPrice(int begin, int pageSize, int min, int max) {
        String sql = "select * from t_bike where price between ? and ? limit ?,?";
        return queryForList(Bike.class,sql,min,max,begin,pageSize);
    }


    /**
     * 根据名称或品牌查询自行车总数
     * @param nameorbrand
     * @return
     */

    @Override
    public Integer queryForPageTotalCountByNameOrBrand(String nameorbrand) {
        nameorbrand = "%" + nameorbrand + "%";
        String sql = "select count(*) from t_bike where name like ? or brand like ?";
        Number count = (Number) queryForSingleValue(sql,nameorbrand,nameorbrand);
        return count.intValue();
    }


    /**
     * 根据名称或品牌查询自行车并分页
     * @param begin
     * @param pageSize
     * @param nameorbrand
     * @return
     */

    @Override
    public List<Bike> queryForPageItemsByNameOrBrand(int begin, int pageSize, String nameorbrand) {
        nameorbrand = "%" + nameorbrand + "%";
        String sql = "select * from t_bike where name like ? or brand like ? limit ?,?";
        return queryForList(Bike.class,sql,nameorbrand,nameorbrand,begin,pageSize);
    }


    /**
     * 查询销量前20的自行车
     * @return
     */

    @Override
    public List<Bike> queryForPageItemsOrder() {
        String sql = "SELECT * FROM t_bike ORDER BY `sales` DESC LIMIT 20";
        return queryForList(Bike.class, sql);
    }

    /**
     * 查询自行车总金额
     * @return
     */
    @Override
    public BigDecimal queryTotalMoney() {
        String sql = "SELECT SUM(price*sales) from t_bike";
        return (BigDecimal) queryForSingleValue(sql);
    }


    /**
     * 查询总销量
     * @return
     */
    @Override
    public Integer queryBikenums() {
        String sql = "SELECT SUM(sales) FROM t_bike";
        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }
}
