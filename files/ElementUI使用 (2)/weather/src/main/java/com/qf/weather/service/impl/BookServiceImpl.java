package com.qf.weather.service.impl;

import com.qf.weather.bean.Book;
import com.qf.weather.dao.BookMapper;
import com.qf.weather.service.BookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * description:
 * author:姚哥
 * 公众号:java架构栈
 */

@Service
public class BookServiceImpl implements BookService {

    @Resource
    BookMapper bookMapper;

    @Override
    public List<Book> findAll() {
        return bookMapper.findAll();
    }

    @Override
    public int deleteById(int bookId) {
        return bookMapper.deleteById(bookId);
    }

}
