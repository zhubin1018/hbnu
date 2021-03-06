package com.bin.hbnu.service;

import com.bin.hbnu.bean.Coursegrade;

import java.util.List;

public interface CoursegradeService {
    Coursegrade selectCourByIds(Integer sid, Integer tid);

    void updateCourByCour(Coursegrade coursegrade);

    List<Coursegrade> findBy(String tname, String stuLog, String stuName);

    Coursegrade findByTidSid(Integer tid, Integer sid);

    List<Coursegrade> selectCourByTname(String tname);

    Coursegrade selectCourByTnameSname(String tname, String sname);

    Coursegrade finCourBySidTname(Integer sid, String tname);

    void updateCourByCourCheck(Coursegrade coursegrade);

    List<Coursegrade> findCourByStuLog(String loginAccount);

    List<Coursegrade> StufindBy(String sname, String course, String tname);
}
