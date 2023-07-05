package com.llh.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 
 * @TableName t_user
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {
    /**
     * 用户id
     */
    private Integer uid;

    /**
     * 用户名
     */
    private String uname;

    /**
     * 用户密码
     */
    private String upwd;

    /**
     * 电话
     */
    private String tel;

      /**
       * 1：超级管理员，0：普通用户
       */
      private Integer power;

    private static final long serialVersionUID = 1L;
}