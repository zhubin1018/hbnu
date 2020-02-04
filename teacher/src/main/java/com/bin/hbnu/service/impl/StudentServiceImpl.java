package com.bin.hbnu.service.impl;

import com.bin.hbnu.bean.Coursegrade;
import com.bin.hbnu.bean.Student;
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

    public Coursegrade selectCoursegradeByids(Integer sid, Integer tid) {
        return studentMapper.selectCoursegradeByids(sid,tid);
    }
}
