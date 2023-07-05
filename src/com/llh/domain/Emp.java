package com.llh.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @TableName t_emp
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Emp implements Serializable {
      /**
       * 员工id
       */
      private Integer eid;

      /**
       * 姓名
       */
      private String ename;

      /**
       * 部门名
       */
      private String dname;

      /**
       * 城市名
       */
      private String cname;

      /**
       * 用户名
       */
      private String uname;

      /**
       * 电话
       */
      private String tel;

      /**
       * 邮箱
       */
      private String email;

      /**
       * 昵称
       */
      private String nickName;

      /**
       * 1：已离职，0：未离职
       */
      private Integer flag;

      /**
       * 1：男，0：女
       */
      private Integer gender;

      /**
       * 部门id
       */
      private Integer did;

      /**
       * 城市id
       */
      private Integer cid;

      /**
       * 创建时间
       */
      private Date createTime;

      /**
       * 操作用户id
       */
      private Integer uid;

      /**
       * 1：禁用，0：正常
       */
      private Integer status;

      private static final long serialVersionUID = 1L;
}