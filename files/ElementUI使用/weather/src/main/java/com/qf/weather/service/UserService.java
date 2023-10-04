package com.qf.weather.service;

import com.qf.weather.bean.User;
import org.apache.ibatis.annotations.Param;

public interface UserService {
    User findByNameAndPwd(String userName,String userPwd);
}
