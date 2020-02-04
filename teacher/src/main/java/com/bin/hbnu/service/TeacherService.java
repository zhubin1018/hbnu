package com.bin.hbnu.service;

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
}
