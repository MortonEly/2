package com.qf.weather.dao;

import com.qf.weather.bean.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {

    //查询所有内容
    List<Book> findAll();

    //根据id进行删除操作
    int deleteById(int bookId);
}
