package com.lwhao.filter;

import com.lwhao.bean.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @author : Luowenhao221
 * @date : 2024/4/26 23:27
 * @Project : SuperBike
 */


/**
 * 管理员过滤器
 */
public class ManagerFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    //新加入的过滤器，用于管理者登录，yes是管理员
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        User user = (User) httpServletRequest.getSession().getAttribute("user");
        if(user==null) {      //用户未登录
            httpServletRequest.getRequestDispatcher("/pages/user/login.jsp").forward(servletRequest,servletResponse);
        } else if(!"yes".equals(user.getAdminornot())){         //不是管理员！
            httpServletRequest.getRequestDispatcher("/pages/error/errorManager.jsp").forward(servletRequest,servletResponse);
        }else{                  //是管理员！
            filterChain.doFilter(servletRequest,servletResponse);
        }
    }


    /**
     * 销毁
     */
    @Override
    public void destroy() {
    }
}