package com.lwhao.servlet;

import com.lwhao.bean.Bike;
import com.lwhao.bean.Page;
import com.lwhao.service.BikeService;
import com.lwhao.service.impl.BikeServiceImpl;
import com.lwhao.util.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * @author : Luowenhao221
 * @date : 2024/4/30 8:24
 * @Project : SuperBike
 */

/**
 * 客户端BikeServlet
 */
public class ClientBikeServlet extends BaseServlet {
    /**
     * BikeService对象
     */
    private BikeService bikeService = new BikeServiceImpl();

    /**
     * 分页
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1、获取请求的参数pageNo和pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);

        //2、调用BikeService.page(pageNo,pageSize)方法：返回page对象
        Page<Bike> page = bikeService.page(pageNo,pageSize);
        page.setUrl("client/bikeServlet?action=page");
        //3、保存Page对象到request域中
        req.setAttribute("page",page);
        //4、请求转发到page/bikemanager/bike_manager.jsp页面
        req.getRequestDispatcher("/pages/client/index.jsp").forward(req,resp);
    }

    /**
     * 根据名称或品牌分页
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void pageByNameOrBrand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1、获取请求的参数pageNo和pageSize、nameorbrand
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        String nameOrBrand = req.getParameter("nameorbrand");

        //2、调用BikeService.page(pageNo,pageSize)方法：返回page对象
        Page<Bike> page = bikeService.pageByNameOrBrand(pageNo,pageSize,nameOrBrand);

        StringBuilder sb = new StringBuilder("client/bikeServlet?action=pageByNameOrBrand");
        if(req.getParameter("nameorbrand")!=null) {
            sb.append("&nameorbrand=").append(req.getParameter("nameorbrand"));
        }
        page.setUrl(sb.toString());
        //3、保存Page对象到request域中
        req.setAttribute("page",page);
        //4、请求转发到page/bikemanager/bike_manager.jsp页面
        req.getRequestDispatcher("/pages/client/index.jsp").forward(req,resp);
    }

    /**
     * 根据价格分页
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void pageByPrice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1、获取请求的参数pageNo和pageSize、min、max
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"),1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        int min = WebUtils.parseInt(req.getParameter("min"),0);
        int max = WebUtils.parseInt(req.getParameter("max"),Integer.MAX_VALUE);

        //2、调用BikeService.page(pageNo,pageSize)方法：返回page对象
        Page<Bike> page = bikeService.pageByPrice(pageNo,pageSize,min,max);

        StringBuilder sb = new StringBuilder("client/bikeServlet?action=pageByPrice");
        if(req.getParameter("min")!=null) {
            sb.append("&min=").append(req.getParameter("min"));
        }
        if(req.getParameter("max")!=null) {
            sb.append("&max=").append(req.getParameter("max"));
        }
        page.setUrl(sb.toString());
        //3、保存Page对象到request域中
        req.setAttribute("page",page);
        //4、请求转发到page/bikemanager/bike_manager.jsp页面
        req.getRequestDispatcher("/pages/client/index.jsp").forward(req,resp);
    }

    /**
     * 根据销量排行
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void pageOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1、获取请求的参数
        //这里直接写死为50
        //2、调用BikeService.page(pageNo,pageSize)方法：返回page对象
        Page<Bike> page = bikeService.pageOrder();
        page.setUrl("client/bikeServlet?action=pageOrder");
        //3、保存Page对象到request域中
        req.setAttribute("page",page);
        //4、请求转发到page/bikemanager/bike_manager.jsp页面
        req.getRequestDispatcher("/pages/client/salestop.jsp").forward(req,resp);
    }
}
