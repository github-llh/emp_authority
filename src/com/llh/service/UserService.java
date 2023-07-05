package com.llh.service;

import com.llh.domain.User;

/**
 * User: lilinhan
 * DateTime: 2023/5/6 9:07
 */
public interface UserService {
      User findByName(String uname);
      User checkName(String name);
      User login2(String name,String pwd);
}
