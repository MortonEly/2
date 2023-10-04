package com.qf.weather.dao;

import com.qf.weather.bean.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    //select * from tb_user where user_name=#{userName} and user_pwd=#{userPwd}
    User findByNameAndPwd(@Param("userName") String userName,@Param("userPwd") String userPwd);
}
