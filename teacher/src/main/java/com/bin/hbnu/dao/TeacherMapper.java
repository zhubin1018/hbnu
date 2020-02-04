package com.bin.hbnu.dao;

import com.bin.hbnu.bean.Teacher;
import com.bin.hbnu.bean.User;
import org.apache.ibatis.annotations.Select;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName TeacherMapper
 * @date 2020/2/2 23:46
 **/
public interface TeacherMapper {

    Teacher validateTeacher(User user);

    Integer selectTidByUser(User user);
}
