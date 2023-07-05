package com.llh.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.llh.domain.City;
import com.llh.domain.Dept;
import com.llh.domain.Emp;
import com.llh.domain.User;
import com.llh.service.EmpService;
import com.llh.service.impl.EmpServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: lilinhan
 * DateTime: 2023/5/6 11:32
 */
@WebServlet("/emp")
public class EmpController extends HttpServlet {
      EmpService es = new EmpServiceImpl();
      @Override
      protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html;charset=UTF-8");
            String method = req.getParameter("m");
            if (method != null && !"".equals(method)){
                  if("getEmp".equals(method)){
                        getEmp(req,resp);
                  }
                  if("getDept".equals(method)){
                        getDept(req,resp);
                  }
                  if("getCity".equals(method)){
                        getCity(req,resp);
                  }
                  if("exit".equals(method)){
                        exit(req,resp);
                  }
                  if("delEmp".equals(method)){
                        delEmp(req,resp);
                  }
                  if("batchDelEmp".equals(method)){
                        batchDelEmp(req,resp);
                  }
                  if("checkTel".equals(method)){
                        checkTel(req,resp);
                  }
                  if("addEmpAndUser".equals(method)){
                        addEmpAndUser(req,resp);
                  }
                  if("toUpdate".equals(method)){
                        toUpdate(req,resp);
                  }
                  if("updateEmp".equals(method)){
                        updateEmp(req,resp);
                  }
                  if("getUser".equals(method)){
                        getUser(req,resp);
                  }
            }
      }

      private void getUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            Map<String,Object> map = new HashMap<>();

            String pageNum = req.getParameter("pageNum");
            PageInfo<User> user = es.getUser(map, pageNum);
            req.setAttribute("pageInfo",user);
            req.setAttribute("map",map);
            req.getRequestDispatcher("user_list.jsp").forward(req,resp);
      }

      private void updateEmp(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            Map<String,Object> map = new HashMap<>();
            User user = (User) req.getSession().getAttribute("USER");

            map.put("eid",req.getParameter("eid"));
            map.put("ename",req.getParameter("ename"));
            map.put("cid",req.getParameter("cid"));
            map.put("did",req.getParameter("did"));
            map.put("nickName",req.getParameter("nickName"));
            map.put("tel",req.getParameter("tel"));
            map.put("email",req.getParameter("email"));
            map.put("gender",req.getParameter("gender"));
            map.put("status",req.getParameter("status"));
            map.put("uid",user.getUid());//创建人id 来源于登陆人的id
            int i = es.updateEmp(map);
            resp.getWriter().println(JSON.toJSONString(i));
      }

      private void toUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String eid = req.getParameter("eid");
            Emp emp = es.toUpdate(eid);
            req.setAttribute("emp",emp);
            req.getRequestDispatcher("emp_update.jsp").forward(req,resp);
      }

      private void addEmpAndUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            Map<String,Object> map = new HashMap<>();
            User user = (User) req.getSession().getAttribute("USER");

            map.put("ename",req.getParameter("ename"));
            map.put("upwd",req.getParameter("upwd"));
            map.put("cid",req.getParameter("cid"));
            map.put("did",req.getParameter("did"));
            map.put("nickName",req.getParameter("nickName"));
            map.put("tel",req.getParameter("tel"));
            map.put("email",req.getParameter("email"));
            map.put("gender",req.getParameter("gender"));
            map.put("status",req.getParameter("status"));
            map.put("uid",user.getUid());//创建人id 来源于登陆人的id
            int i = es.addEmpAndUser(map);
            resp.getWriter().println(JSON.toJSONString(i));
      }

      private void checkTel(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            String tel = req.getParameter("tel");
            int i = es.checkTel(tel);
            resp.getWriter().println(JSON.toJSONString(i));
      }

      private void batchDelEmp(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            String ids = req.getParameter("ids");
            int i = es.batchDelEmp(ids);
            resp.getWriter().println(JSON.toJSONString(i));
      }

      private void delEmp(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            String eid = req.getParameter("eid");
            int i = es.delEmp(eid);
            resp.getWriter().println(JSON.toJSONString(i));
      }

      private void exit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getSession().invalidate();
            req.getRequestDispatcher("index.jsp").forward(req,resp);
      }

      private void getCity(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            List<City> city = es.getCity();
            resp.getWriter().println(JSON.toJSONString(city));
      }

      private void getDept(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            List<Dept> dept = es.getDept();
            resp.getWriter().println(JSON.toJSONString(dept));
      }

      private void getEmp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            Map<String,Object> map = new HashMap<>();
            map.put("ename",req.getParameter("ename"));
            map.put("uname",req.getParameter("uname"));
            map.put("createTimeMin",req.getParameter("createTimeMin"));
            map.put("createTimeMax",req.getParameter("createTimeMax"));
            map.put("did",req.getParameter("did"));
            map.put("cid",req.getParameter("cid"));
            map.put("orderName",req.getParameter("orderName"));
            map.put("orderType",req.getParameter("orderType"));

            String pageNum = req.getParameter("pageNum");
            PageInfo<Emp> emp = es.getEmp(map, pageNum);
            req.setAttribute("pageInfo",emp);
            req.setAttribute("map",map);
            req.getRequestDispatcher("emp_list.jsp").forward(req,resp);
      }
}
