package com.qf.weather.controller;

import com.qf.weather.bean.Book;
import com.qf.weather.service.BookService;
import lombok.Lombok;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * description:
 * author:姚哥
 * 公众号:java架构栈
 *
 * @CrossOrigin可以用来解决跨域问题
 */
@Controller
@RequestMapping("book")
@CrossOrigin
public class BookController {

    @Resource
    BookService bookService;

    @RequestMapping("list")
    @ResponseBody
    public List<Book> bookList() {
        return bookService.findAll();
    }

    @RequestMapping("del")
    @ResponseBody
    public String del(int bookId) {
        int i = bookService.deleteById(bookId);
        String str = "{\"code\":200,\"msg\":\"success\"}";
        if (i == 0) {//说明登录失败
            str = "{\"code\":500,\"msg\":\"err\"}";
        }
        return str;
    }
}
