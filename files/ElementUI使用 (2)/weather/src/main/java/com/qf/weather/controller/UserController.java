package com.qf.weather.controller;

import com.qf.weather.bean.User;
import com.qf.weather.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * description:
 * author:姚哥
 * 公众号:java架构栈
 */
@Controller
@RequestMapping("user")
@CrossOrigin
public class UserController {

    @Resource
    UserService service;

    //处理登录请求的方法
    @RequestMapping("login")
    @ResponseBody
    //参数User是前端用户传入的，里面包含用户填写的用户名和密码
    //@RequestBody：user对象从请求正文中获得
    public String login(@RequestBody User user) {
        System.out.println(user);
        //此时的u是从数据库中查询到的内容，
        User u = service.findByNameAndPwd(user.getUserName(), user.getUserPwd());
        String str = "{\"code\":200,\"msg\":\"success\"}";
        if (u == null) {//说明登录失败
            str = "{\"code\":500,\"msg\":\"err\"}";
        }
        return str;
    }
}
