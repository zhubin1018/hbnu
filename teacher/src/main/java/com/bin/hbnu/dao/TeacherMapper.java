package com.bin.hbnu.dao;

import com.bin.hbnu.bean.Coursegrade;
import com.bin.hbnu.bean.Teacher;
import com.bin.hbnu.bean.User;
import org.apache.ibatis.annotations.Param;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName TeacherMapper
 * @date 2020/2/2 23:46
 **/
public interface TeacherMapper {

    Teacher validateTeacher(User user);

    Integer selectTidByUser(User user);

    void updataCoursegradeByIds(Integer sid, Integer tid);

    Coursegrade findCoursegradeByIds(@Param("sid") Integer sid, @Param("tid") Integer tid);

    void updateCoursegrade(Coursegrade coursegrade);


    void updateCouresAndPassword(@Param("course") String course, @Param("password") String password,@Param("tid")Integer tid);

    Teacher selectLikeCourse(@Param("course") String course);

    Teacher selectLikeTname(@Param("tname")String tname);
}
