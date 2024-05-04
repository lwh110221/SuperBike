package com.lwhao.servlet;

import com.lwhao.bean.Bike;
import com.lwhao.bean.Page;
import com.lwhao.service.BikeService;
import com.lwhao.service.impl.BikeServiceImpl;
import com.lwhao.util.WebUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

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
    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtil.parseInt(req.getParameter("pageNo"),0);
        pageNo+=1;
        Bike bike = (Bike) WebUtil.copyParamToBean(req.getParameterMap(),new Bike());
        bikeService.addBike(bike);
        resp.sendRedirect(req.getContextPath() + "/bikemanager/bikeServlet?action=page&pageNo=" +pageNo);
    }

    /**
     * 删除自行车
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        int i = Integer.parseInt(id);
        bikeService.deleteBikeById(i);
        resp.sendRedirect(req.getContextPath() + "/bikemanager/bikeServlet?action=page&pageNo=" +req.getParameter("pageNo"));
    }

    /**
     * 更新自行车
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */

    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Bike bike = (Bike) WebUtil.copyParamToBean(req.getParameterMap(),new Bike());
        bikeService.updateBike(bike);
        resp.sendRedirect(req.getContextPath() + "/bikemanager/bikeServlet?action=page&pageNo=" +req.getParameter("pageNo"));
    }

    /**
     * 根据id查询
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void getBike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        int i = Integer.parseInt(id);
        Bike bike = bikeService.queryBikeById(i);
        req.setAttribute("bike",bike);
        req.getRequestDispatcher("/pages/bikemanager/bike_edit.jsp").forward(req,resp);
    }

    /**
     * 查询列表
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */

    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1、通过BikeService查询数据
        List<Bike> bikes = bikeService.queryBikes();
        //2、将数据保存在request域中
        req.setAttribute("bikes",bikes);
        //3、请求转发到pages/bikemanager/bike_manager.jsp
        req.getRequestDispatcher("/pages/bikemanager/bike_manager.jsp").forward(req,resp);
    }

    /**
     * 分页查询
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */

    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1、获取请求的参数pageNo和pageSize
        int pageNo = WebUtil.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtil.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);

        //2、调用BikeService.page(pageNo,pageSize)方法：返回page对象
        Page<Bike> page = bikeService.page(pageNo,pageSize);
        page.setUrl("bikemanager/bikeServlet?action=page");

        //3、保存Page对象到request域中
        req.setAttribute("page",page);
        //4、请求转发到page/bikemanager/bike_manager.jsp页面
        req.getRequestDispatcher("/pages/bikemanager/bike_manager.jsp").forward(req,resp);
    }

}

