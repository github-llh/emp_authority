package com.llh.service;

import com.github.pagehelper.PageInfo;
import com.llh.domain.City;
import com.llh.domain.Dept;
import com.llh.domain.Emp;
import com.llh.domain.User;

import java.util.List;
import java.util.Map;

/**
 * User: lilinhan
 * DateTime: 2023/5/6 11:32
 */
public interface EmpService {
      PageInfo<Emp> getEmp(Map<String,Object> map,String pageNum);
      List<Dept> getDept();
      List<City> getCity();
      int delEmp(String eid);
      int batchDelEmp(String ids);
      int checkTel(String tel);
      int addEmpAndUser(Map<String,Object> map);
      Emp toUpdate(String eid);
      int updateEmp(Map<String,Object> map);
      PageInfo<User> getUser(Map<String,Object> map,String pageNum);
}
