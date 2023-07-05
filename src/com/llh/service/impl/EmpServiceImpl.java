package com.llh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.llh.domain.City;
import com.llh.domain.Dept;
import com.llh.domain.Emp;
import com.llh.domain.User;
import com.llh.mapper.EmpMapper;
import com.llh.service.EmpService;
import com.llh.utils.BaseDao;

import java.util.List;
import java.util.Map;

/**
 * User: lilinhan
 * DateTime: 2023/5/6 11:32
 */
public class EmpServiceImpl implements EmpService {
      EmpMapper mapper = BaseDao.getSql().getMapper(EmpMapper.class);
      @Override
      public PageInfo<Emp> getEmp(Map<String, Object> map, String pageNum) {
            if(StringUtil.isEmpty(pageNum)){
                  pageNum = "1";
            }
            PageHelper.startPage(Integer.parseInt(pageNum),6);
            List<Emp> emp = mapper.getEmp(map);
            return new PageInfo<>(emp);
      }

      @Override
      public List<Dept> getDept() {
            return mapper.getDept();
      }

      @Override
      public List<City> getCity() {
            return mapper.getCity();
      }

      @Override
      public int delEmp(String eid) {
            return mapper.delEmp(eid);
      }

      @Override
      public int batchDelEmp(String ids) {
            return mapper.batchDelEmp(ids);
      }

      @Override
      public int checkTel(String tel) {
            return mapper.checkTel(tel);
      }

      @Override
      public int addEmpAndUser(Map<String, Object> map) {
            int count = 0;
            count = mapper.addUser(map);
            count = mapper.addEmp(map);
            return count;
      }

      @Override
      public Emp toUpdate(String eid) {
            return mapper.toUpdate(eid);
      }

      @Override
      public int updateEmp(Map<String, Object> map) {
            return mapper.updateEmp(map);
      }

      @Override
      public PageInfo<User> getUser(Map<String, Object> map, String pageNum) {
            if(StringUtil.isEmpty(pageNum)){
                  pageNum = "1";
            }
            PageHelper.startPage(Integer.parseInt(pageNum),6);
            List<User> user = mapper.getUser(map);
            return new PageInfo<>(user);
      }
}
