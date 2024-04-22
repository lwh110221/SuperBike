package com.lwhao.service.impl;

import com.lwhao.bean.Bike;
import com.lwhao.bean.Page;
import com.lwhao.dao.BikeDao;
import com.lwhao.dao.impl.BikeDaoImpl;
import com.lwhao.service.BikeService;

import java.math.BigDecimal;
import java.util.List;


/**
 * @author : Luowenhao221
 * @date : 2024/4/22 19:54
 * @Project : SuperBike
 */
public class BikeServiceImpl implements BikeService {
    /**
     * 通过BikeDao接口实现类对象
     */
    private BikeDao bikeDao = new BikeDaoImpl();

    /**
     * 添加自行车
     * @param bike 车辆对象
     */
    @Override
    public void addBike(Bike bike) {
        bikeDao.addBike(bike);
    }

    /**
     * 更新自行车
     * @param bike 车辆对象
     */
    @Override
    public void updateBike(Bike bike) {
        bikeDao.updateBike(bike);
    }

    /**
     * 通过id删除自行车
     * @param id 自行车id
     */
    @Override
    public void deleteBikeById(Integer id) {
        bikeDao.deleteBikeById(id);
    }

    /**
     * 通过id查询自行车
     * @param id 自行车id
     * @return 返回自行车对象
     */
    @Override
    public Bike queryBikeById(Integer id) {
        return bikeDao.queryBikeById(id);
    }

    /**
     * 查询所有自行车
     * @return 返回自行车集合
     */
    @Override
    public List<Bike> queryBikes() {
        return bikeDao.queryBikes();
    }

    /**
     * 分页查询
     * @param pageNo 当前页
     * @param pageSize 每页记录数
     * @return 返回分页对象
     */
    @Override
    public Page<Bike> page(int pageNo, int pageSize) {
        Page<Bike> page = new Page<Bike>();

        //设置每页记录数
        page.setPageSize(pageSize);

        //设置总记录数
        Integer pageTotalCount = bikeDao.queryForPageTotalCount();
        page.setPageTotalCount(pageTotalCount);

        //求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if(pageTotalCount % pageSize >0) {
            pageTotal+=1;
        }
        //设置当前页
        if(pageNo>pageTotal) {
            pageNo = pageTotal;
        }
        if(pageNo<1) {
            pageNo = 1;
        }
        page.setPageNo(pageNo);
        //设置总页码
        page.setPageTotal(pageTotal);


        int begin = (page.getPageNo() -1)*pageSize;
        List<Bike> items = bikeDao.queryForPageItems(begin,pageSize);
        page.setItems(items);

        return page;
    }

    /**
     * 通过价格区间分页查询
     * @param pageNo 当前页
     * @param pageSize 每页记录数
     * @param min 最小价格
     * @param max 最大价格
     * @return 返回分页对象
     */
    @Override
    public Page<Bike> pageByPrice(int pageNo, int pageSize, int min, int max) {
        Page<Bike> page = new Page<Bike>();

        //设置每页记录数
        page.setPageSize(pageSize);

        //设置总记录数
        Integer pageTotalCount = bikeDao.queryForPageTotalCountByPrice(min,max);
        page.setPageTotalCount(pageTotalCount);

        //求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if(pageTotalCount % pageSize >0) {
            pageTotal+=1;
        }
        //设置当前页
        if(pageNo>pageTotal) {
            pageNo = pageTotal;
        }
        if(pageNo<1) {
            pageNo = 1;
        }
        page.setPageNo(pageNo);
        //设置总页码
        page.setPageTotal(pageTotal);


        int begin = (page.getPageNo() -1)*pageSize;
        List<Bike> items = bikeDao.queryForPageItemsByPrice(begin,pageSize,min,max);
        page.setItems(items);

        return page;
    }

    /**
     * 通过名称或品牌分页查询
     * @param pageNo 当前页
     * @param pageSize 每页记录数
     * @param nameorbrand 名称或品牌
     * @return 返回分页对象
     */

    @Override
    public Page<Bike> pageByNameOrBrand(int pageNo, int pageSize, String nameorbrand) {
        Page<Bike> page = new Page<Bike>();

        //设置每页记录数
        page.setPageSize(pageSize);

        //设置总记录数
        Integer pageTotalCount = bikeDao.queryForPageTotalCountByNameOrBrand(nameorbrand);
        page.setPageTotalCount(pageTotalCount);

        //求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if(pageTotalCount % pageSize >0) {
            pageTotal+=1;
        }
        //设置当前页
        if(pageNo>pageTotal) {
            pageNo = pageTotal;
        }
        if(pageNo<1) {
            pageNo = 1;
        }
        page.setPageNo(pageNo);
        //设置总页码
        page.setPageTotal(pageTotal);


        int begin = (page.getPageNo() -1)*pageSize;
        List<Bike> items = bikeDao.queryForPageItemsByNameOrBrand(begin,pageSize,nameorbrand);
        page.setItems(items);

        return page;
    }




    //分页查询并排序
    @Override
    public Page<Bike> pageOrder() {
        Page<Bike> page = new Page<Bike>();
        List<Bike> items = bikeDao.queryForPageItemsOrder();
        page.setItems(items);

        return page;
    }


    //分页查询并排序
    @Override
    public Integer queryTotalBikes() {
        return bikeDao.queryBikenums();
    }

    //查询总金额
    @Override
    public BigDecimal queryTotalMoney() {
        return bikeDao.queryTotalMoney();
    }


}
