package com.llh.mapper;

import com.llh.domain.User;
import org.apache.ibatis.annotations.Param;

/**
 * User: lilinhan
 * DateTime: 2023/5/6 9:06
 */
public interface UserMapper {
      User findByName(@Param("uname") String uname);
      User checkName(@Param("name") String name);
      User login2(@Param("name") String name,@Param("pwd") String pwd);
}
