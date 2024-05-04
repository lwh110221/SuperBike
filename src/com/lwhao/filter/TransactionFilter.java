package com.lwhao.filter;

import com.lwhao.util.JDBCUtils;

import java.io.IOException;
import javax.servlet.*;

/**
 * @author : Luowenhao221
 * @date : 2024/4/22 20:50
 * @Project : SuperBike
 */
public class TransactionFilter implements Filter {
    /**
     * 初始化方法
     * @param filterConfig
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    /**
     * 过滤方法
     * @param servletRequest
     * @param servletResponse
     * @param filterChain
     * @throws IOException
     */
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        try {
            filterChain.doFilter(servletRequest,servletResponse);
            JDBCUtils.commitAndClose();  //提交事务
        } catch (Exception e) {
            JDBCUtils.rollbackAndClose();  //回滚事务
            e.printStackTrace();
            throw new RuntimeException(e);  //把异常抛给tomcat服务器统一展示友好提示页面
        }
    }
    /**
     * 销毁方法
     */
    @Override
    public void destroy() {
    }
}
