package com.bin.hbnu.service.impl;

import com.bin.hbnu.bean.Coursegrade;
import com.bin.hbnu.bean.Teacher;
import com.bin.hbnu.bean.User;
import com.bin.hbnu.dao.TeacherMapper;
import com.bin.hbnu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName TeacherServiceImpl
 * @date 2020/2/2 23:46
 **/
@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;

    public Teacher validateTeacher(User user) {
        return teacherMapper.validateTeacher(user);
    }

    public Integer seletcTidByUser(User user) {
        return teacherMapper.selectTidByUser(user);
    }

    public Coursegrade findCoursegradeByIds(Integer sid, Integer tid) {
        return teacherMapper.findCoursegradeByIds(sid,tid);
    }

    public void updateCoursegrade(Coursegrade coursegrade) {
        teacherMapper.updateCoursegrade(coursegrade);
    }

    public void updateCouresAndPassword(String course, String password,Integer tid) {
        teacherMapper.updateCouresAndPassword(course,password,tid);
    }

    public Teacher selectLikeCourse(String course) {
        return teacherMapper.selectLikeCourse(course);
    }

    public Teacher selectLikeTname(String tname) {
        return teacherMapper.selectLikeTname(tname);
    }


}
