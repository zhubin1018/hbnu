package com.bin.hbnu.dao;

import com.bin.hbnu.bean.Coursegrade;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CoursegradeMapper {
    Coursegrade selectCourByIds(@Param("sid") Integer sid, @Param("tid") Integer tid);

    void updateCourByCour(Coursegrade coursegrade);

    List<Coursegrade> findBy(@Param("tname")String tname, @Param("stuLog")String stuLog, @Param("sname")String stuName);
}
