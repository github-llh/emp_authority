package com.llh.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 
 * @TableName t_city
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class City implements Serializable {
    /**
     * 城市id
     */
    private Integer cid;

    /**
     * 城市名
     */
    private String cname;

    private static final long serialVersionUID = 1L;
}