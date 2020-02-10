package com.bin.hbnu.service;

import com.bin.hbnu.bean.CheckObj;
import com.bin.hbnu.bean.Coursegrade;
import com.bin.hbnu.bean.Student;
import com.bin.hbnu.bean.User;

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

    List<Coursegrade> selectCoursegradeByids(Integer tid);

    Student validateStudent(User user);

    Student validateParents(User user);

    void updatePassword(String password, Integer sid);

    void updateParents_Password(String password, Integer sid);


    List<CheckObj> selectCheckBySid(Integer sid,Integer thid);

    Coursegrade selectCourByids(Integer tid, Integer sid);
}
