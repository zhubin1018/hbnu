package com.bin.hbnu.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
    /*当前页*/
    private Integer pageNo;
    /*模糊查询中,传递的学生学号*/
    private String stuLog;
    /*模糊查询中,传递的学生姓名*/
    private String stuName;

}
