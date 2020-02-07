package com.bin.hbnu.dao;

import com.bin.hbnu.bean.Coursegrade;
import com.bin.hbnu.bean.Student;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName StudentMapper
 * @date 2020/2/3 22:57
 **/
public interface StudentMapper {
    @Select("SELECT * From student WHERE tid = #{tid}")
    Student findStudentByTid(Integer tid);

    @Select("SELECT * From student WHERE tid = #{tid}")
    List<Student> selectStudentByTid(Integer tid);

    List<Coursegrade> selectCoursegradeByids(@Param("tid") Integer tid);
}
