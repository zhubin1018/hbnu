package com.bin.hbnu.service;

import com.bin.hbnu.bean.Coursegrade;
import com.bin.hbnu.bean.Teacher;
import com.bin.hbnu.bean.User;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName TeacherService
 * @date 2020/2/2 23:46
 **/
public interface TeacherService {
    Teacher validateTeacher(User user);

    Integer seletcTidByUser(User user);

    Coursegrade findCoursegradeByIds(Integer sid, Integer tid);

    void updateCoursegrade(Coursegrade coursegradeByIds);


    void updateCouresAndPassword(String course, String password,Integer tid);

    Teacher selectLikeCourse(String course);

    Teacher selectLikeTname(String tname);
}
