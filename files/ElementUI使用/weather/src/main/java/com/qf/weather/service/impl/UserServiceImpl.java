package com.qf.weather.service.impl;

import com.qf.weather.bean.User;
import com.qf.weather.dao.UserMapper;
import com.qf.weather.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * description:
 * author:姚哥
 * 公众号:java架构栈
 */
@Service
public class UserServiceImpl implements UserService {

    //获得UserMapper的对象
    //依赖注入 创建UserMapper的实现类对象 并将该对象注入userMapper
    @Resource
    UserMapper userMapper;

    @Override
    public User findByNameAndPwd(String userName, String userPwd) {
        return userMapper.findByNameAndPwd(userName,userPwd);
    }
}
