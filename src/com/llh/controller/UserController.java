package com.llh.controller;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.llh.domain.User;
import com.llh.service.UserService;
import com.llh.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * User: lilinhan
 * DateTime: 2023/5/6 9:07
 */
@WebServlet("/user")
public class UserController extends HttpServlet {
      UserService us = new UserServiceImpl();
      @Override
      protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html;charset=UTF-8");
            String method = req.getParameter("m");
            if (method != null && !"".equals(method)){
                  if("login".equals(method)){
                        login(req,resp);
                  }
                  if("findByName".equals(method)){
                        findByName(req,resp);
                  }
                  if("checkYzm".equals(method)){
                        checkYzm(req,resp);
                  }
                  if("checkName".equals(method)){
                        checkName(req,resp);
                  }
                  if("login2".equals(method)){
                        login2(req,resp);
                  }
                  if("yzm".equals(method)){
                        yzm(req,resp);
                  }
            }
      }

      private void yzm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher("yzm.jsp").forward(req,resp);
      }

      private void login2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String yzm = (String) req.getSession().getAttribute("yzm");
            String code = req.getParameter("code");
            String name = req.getParameter("name");
            String pwd = req.getParameter("pwd");

            User user = us.login2(name, pwd);
            if(!StrUtil.equalsAnyIgnoreCase(yzm,code)){
                  String error = "验证码错误";
                  resp.getWriter().println(error);
            }
            if(pwd.equals(user.getUpwd())){
                  req.getSession().setAttribute("test",user);
            }
      }

      private void checkName(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            String name = req.getParameter("name");
            User user = us.checkName(name);
            resp.getWriter().println(JSON.toJSONString(user));
      }





      private void checkYzm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            // 获取验证码的值
            String yzm = (String) req.getSession().getAttribute("yzm");
            resp.getWriter().println(yzm);

//            // 获取输入框的值
//            String code = req.getParameter("code");
//            // 使用hutool工具 忽略大小写 判断是否输入正确
//            if(!StrUtil.equalsAnyIgnoreCase(yzm,code)){
//                  System.out.println("yzm:"+yzm+" code:"+code);
//                  req.setAttribute("error","验证码错误");
////                  req.getRequestDispatcher("index.jsp").forward(req,resp);
//            }
      }

      private void findByName(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            String uname = req.getParameter("uname");
            User dbUser = us.findByName(uname);
            resp.getWriter().println(JSON.toJSONString(dbUser));
      }

      private void login(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
            String uname = req.getParameter("uname");
            String upwd = req.getParameter("upwd");
            User user = us.findByName(uname);
            if(user!=null && user.getUpwd().equals(upwd)){
                  req.getSession().setAttribute("USER",user);
            }
            resp.getWriter().println(JSON.toJSONString(user));
      }
}
