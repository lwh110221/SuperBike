package com.lwhao.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.lang.reflect.Method;

/**
 * @author : Luowenhao221
 * @date : 2024/4/23 8:49
 * @Project : SuperBike
 */
public class BaseServlet extends HttpServlet {
    /**
     * 重写doGet方法
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }


    /**
     * 通过反射调用方法
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决post请求中文乱码
        req.setCharacterEncoding("utf-8");
        //解决相应的中文乱码
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        try {
            Method method = this.getClass().getDeclaredMethod(action, HttpServletRequest.class,HttpServletResponse.class);
            method.invoke(this,req,resp);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

}
