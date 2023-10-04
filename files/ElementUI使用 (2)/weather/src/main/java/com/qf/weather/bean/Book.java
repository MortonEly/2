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
public class Book {

    private int bookId;
    private String bookName;
    private String bookAuthor;
    private double bookPrice;
    private String bookDesc;

}
