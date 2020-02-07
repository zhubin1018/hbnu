package com.bin.hbnu.service.impl;

import com.bin.hbnu.bean.Coursegrade;
import com.bin.hbnu.dao.CoursegradeMapper;
import com.bin.hbnu.service.CoursegradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoursegradeServiceImpl implements CoursegradeService {
    @Autowired
    private CoursegradeMapper coursegradeMapper;

    public Coursegrade selectCourByIds(Integer sid, Integer tid) {
        return coursegradeMapper.selectCourByIds(sid,tid);
    }

    public void updateCourByCour(Coursegrade coursegrade) {
        coursegradeMapper.updateCourByCour(coursegrade);
    }

    public List<Coursegrade> findBy(String tname, String stuLog, String stuName) {
        return coursegradeMapper.findBy(tname,stuLog,stuName);
    }
}
