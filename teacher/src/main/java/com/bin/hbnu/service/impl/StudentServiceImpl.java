package com.bin.hbnu.service.impl;

import com.bin.hbnu.bean.Coursegrade;
import com.bin.hbnu.bean.Student;
import com.bin.hbnu.bean.User;
import com.bin.hbnu.dao.StudentMapper;
import com.bin.hbnu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName StudentServiceImpl
 * @date 2020/2/3 22:33
 **/
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;

    public Student getStudentByTid(Integer tid) {
        return studentMapper.findStudentByTid(tid);
    }

    public List<Student> selectStudentByTid(Integer tid) {
        return studentMapper.selectStudentByTid(tid);
    }

    public List<Coursegrade> selectCoursegradeByids(Integer tid) {
        return studentMapper.selectCoursegradeByids(tid);
    }

    public Student validateStudent(User user) {
        return studentMapper.validateStudent(user);
    }

    public Student validateParents(User user) {
        return studentMapper.validateParents(user);
    }

    public void updatePassword(String password, Integer sid) {
        studentMapper.updatePassword(password,sid);
    }

    public void updateParents_Password(String password, Integer sid) {
        studentMapper.updateParents_Password(password,sid);
    }
}
