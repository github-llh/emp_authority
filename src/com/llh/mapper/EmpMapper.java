package com.llh.mapper;

import com.llh.domain.City;
import com.llh.domain.Dept;
import com.llh.domain.Emp;
import com.llh.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * User: lilinhan
 * DateTime: 2023/5/6 9:05
 */
public interface EmpMapper {
      List<Emp> getEmp(Map<String,Object> map);
      List<Dept> getDept();
      List<City> getCity();
      int delEmp(String eid);
      int batchDelEmp(@Param("ids") String ids);
      int checkTel(String tel);
      int addEmp(Map<String,Object> map);
      int addUser(Map<String,Object> map);
      Emp toUpdate(@Param("eid") String eid);
      int updateEmp(Map<String,Object> map);
      List<User> getUser(Map<String,Object> map);
}
