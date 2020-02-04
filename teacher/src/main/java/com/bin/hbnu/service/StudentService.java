package com.bin.hbnu.service;

import com.bin.hbnu.bean.Coursegrade;
import com.bin.hbnu.bean.Student;

import java.util.List;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName StudentService
 * @date 2020/2/3 22:31
 **/
public interface StudentService {

    Student getStudentByTid(Integer tid);

    List<Student> selectStudentByTid(Integer tid);

    Coursegrade selectCoursegradeByids(Integer sid, Integer tid);
}
