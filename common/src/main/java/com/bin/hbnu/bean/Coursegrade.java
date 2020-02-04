package com.bin.hbnu.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName Coursegrade
 * @date 2020/2/3 23:47
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Coursegrade {
    private Integer id;
    /*学生id*/
    private Integer sid;
    /*教师id*/
    private Integer tid;
    /*加分项*/
    private String add;
    /*减分项*/
    private String subtract;
    /*平时成绩*/
    private String agrade;
    /*期末考试成绩*/
    private String bagrade;
    /*总成绩*/
    private String grade;
    /*期末成绩考试成绩比例*/
    private String proportion;
}
