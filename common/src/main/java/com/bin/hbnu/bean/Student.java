package com.bin.hbnu.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName Student
 * @date 2020/2/3 22:36
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    private Integer sid;
    private String sname;
    private String ssex;
    private Integer tid;
    private String loginAccount;
    private String password;
}
