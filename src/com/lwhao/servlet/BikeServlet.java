package com.lwhao.servlet;

import com.lwhao.bean.Bike;
import com.lwhao.service.BikeService;
import com.lwhao.service.impl.BikeServiceImpl;
import com.lwhao.util.WebUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author : Luowenhao221
 * @date : 2024/4/23 8:52
 * @Project : SuperBike
 */


public class BikeServlet extends BaseServlet{
// 创建一个BikeService对象
private BikeService bikeService = new BikeServiceImpl();

/**
 * 添加自行车
 *
 * @param req
 * @param resp
 * @throws Exception
 */
protected void add(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    // 获取请求参数
    int pageNo = WebUtil.parseInt(req.getParameter("pageNo"), 0);
    pageNo += 1;
    // 将请求参数封装成Bike对象
    Bike bike = (Bike) WebUtil.copyParamToBean(req.getParameterMap(), new Bike());
    // 调用BikeService的addBike方法添加自行车
    bikeService.addBike(bike);
    // 重定向到自行车列表页面
    resp.sendRedirect(req.getContextPath() + "/自行车管理页面目录/?action=page&pageNo=" + pageNo);
}


/**
 * 删除自行车
 *
 * @param req
 * @param resp
 * @throws Exception
 */
protected void delete(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    // 获取请求参数
    String id = req.getParameter("id");
    int i = Integer.parseInt(id);
    // 调用BikeService的deleteBikeById方法删除自行车
    bikeService.deleteBikeById(i);
    // 重定向到自行车列表页面
    resp.sendRedirect(req.getContextPath() + "/自行车管理页面目录/?action=page&pageNo=" + req.getParameter("pageNo"));
}

/**
 * 更新自行车
 *
 * @param req
 * @param resp
 * @throws Exception
 */
protected void update(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    // 将请求参数封装成Bike对象
    Bike bike = (Bike) WebUtil.copyParamToBean(req.getParameterMap(), new Bike());
    // 调用BikeService的updateBike方法更新自行车
    bikeService.updateBike(bike);
    // 重定向到自行车列表页面
    resp.sendRedirect(req.getContextPath() + "/自行车管理页面目录/?action=page&pageNo=" + req.getParameter("pageNo"));
}

// 获取自行车

//查询自行车列表

// 分页查询自行车

}

