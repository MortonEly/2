package com.qf.weather.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * description:
 * author:姚哥
 * 公众号:java架构栈
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class User {

    private int userId;
    private String userName;
    private String userPwd;

}
