package com.bin.hbnu.service.impl;

import com.bin.hbnu.bean.CheckObj;
import com.bin.hbnu.bean.MingXi;
import com.bin.hbnu.dao.CheckMapper;
import com.bin.hbnu.service.CheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CheckServiceImpl implements CheckService {
    @Autowired
    private CheckMapper checkMapper;

    public CheckObj selectBy(String dateObj, Integer tid, Integer sid) {
        return checkMapper.selectBy(dateObj,tid,sid);
    }

    public void saveCheckObj(String dateObj, Integer sid, Integer tid,String str) {
        checkMapper.saveCheckObj(dateObj,sid,tid,str);
    }

    public void updateCheckObj(CheckObj checkObj) {
        checkMapper.updateCheckObj(checkObj);
    }

    public List<MingXi> findMingXiByTid(Integer tid) {
        return checkMapper.findMingXiByTid(tid);
    }

    public List<CheckObj> findByDate(String date, Integer tid) {
        return checkMapper.findByDate(date,tid);
    }

    public CheckObj selectBeiZhuByids(String date,Integer tid, Integer sid) {
        return checkMapper.selectBeiZhuByids(date,tid,sid);
    }


}
