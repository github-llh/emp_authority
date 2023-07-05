package com.llh.service.impl;

import com.llh.domain.User;
import com.llh.mapper.UserMapper;
import com.llh.service.UserService;
import com.llh.utils.BaseDao;

/**
 * User: lilinhan
 * DateTime: 2023/5/6 9:07
 */
public class UserServiceImpl implements UserService {
      UserMapper mapper = BaseDao.getSql().getMapper(UserMapper.class);
      @Override
      public User findByName(String uname) {
            return mapper.findByName(uname);
      }

      @Override
      public User checkName(String name) {
            return mapper.checkName(name);
      }

      @Override
      public User login2(String name, String pwd) {
            return mapper.login2(name,pwd);
      }
}
