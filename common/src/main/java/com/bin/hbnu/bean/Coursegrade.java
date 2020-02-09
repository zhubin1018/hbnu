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
    /*学号*/
    private String stuLoginAccount;
    /*学生id*/
    private Integer sid;
    /*学生性别*/
    private String ssex;
    /*学生姓名*/
    private String sname;
    /*教师id*/
    private Integer tid;
    /*教师姓名*/
    private String tname;
    /*课程*/
    private String course;

    /*缺勤数*/
    private Integer subtract;
    /*请假数*/
    private Integer qingjia;
    /*平时成绩*/
    private String agrade;
    /*期末考试成绩*/
    private String bgrade;
    /*总成绩*/
    private String grade;
    /*期末成绩考试成绩比例*/
    private String proportion;


    /*dateObj*/
    private String beiZhu;
    private String dateObj;
}
