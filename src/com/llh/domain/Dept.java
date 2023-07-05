package com.llh.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 
 * @TableName t_dept
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dept implements Serializable {
    /**
     * 部门id
     */
    private Integer did;

    /**
     * 部门名
     */
    private String dname;

    private static final long serialVersionUID = 1L;
}