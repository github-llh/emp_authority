package com.llh.utils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class MyFilter implements Filter {
      @Override
      public void init(FilterConfig filterConfig) throws ServletException {

      }

      @Override
      public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
            HttpServletRequest request = (HttpServletRequest) servletRequest;
            HttpServletResponse response = (HttpServletResponse) servletResponse;

            HttpSession session = request.getSession();
            String uri = request.getRequestURI();

            Object user = session.getAttribute("USER");
            if (user != null | uri.endsWith(".js") | uri.endsWith(".css") | uri.contains("/user") | uri.contains("index.jsp") | uri.contains("yzm.jsp") | uri.contains("login.jsp") |uri.contains("success.jsp")) {
                  filterChain.doFilter(request, response);
            } else {
                  request.getRequestDispatcher("index.jsp").forward(request, response);
            }
      }

      @Override
      public void destroy() {

      }
}
