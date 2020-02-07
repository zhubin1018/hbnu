package com.bin.hbnu.service;

import com.bin.hbnu.bean.Coursegrade;

import java.util.List;

public interface CoursegradeService {
    Coursegrade selectCourByIds(Integer sid, Integer tid);

    void updateCourByCour(Coursegrade coursegrade);

    List<Coursegrade> findBy(String tname, String stuLog, String stuName);

    Coursegrade findByTidSid(Integer tid, Integer sid);
}
