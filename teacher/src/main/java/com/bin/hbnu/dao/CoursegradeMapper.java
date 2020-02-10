package com.bin.hbnu.dao;

import com.bin.hbnu.bean.Coursegrade;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CoursegradeMapper {
    Coursegrade selectCourByIds(@Param("sid") Integer sid, @Param("tid") Integer tid);

    void updateCourByCour(Coursegrade coursegrade);

    List<Coursegrade> findBy(@Param("tname")String tname, @Param("stuLog")String stuLog, @Param("sname")String stuName);

    Coursegrade findByTidSid(@Param("tid") Integer tid, @Param("sid") Integer sid);

    List<Coursegrade> selectCourByTname(@Param("tname") String tname);

    Coursegrade selectCourByTnameSname(@Param("tname") String tname, @Param("sname") String sname);

    Coursegrade finCourBySidTname(@Param("sid") Integer sid, @Param("tname") String tname);

    void updateCourByCourCheck(Coursegrade coursegrade);

    List<Coursegrade> findCourByStuLog(@Param("stuLoginAccount") String loginAccount);

    List<Coursegrade> StufindBy(@Param("sname") String sname, @Param("course")String course, @Param("tname")String tname);
}
