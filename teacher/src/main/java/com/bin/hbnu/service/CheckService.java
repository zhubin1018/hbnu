package com.bin.hbnu.service;

import com.bin.hbnu.bean.CheckObj;
import com.bin.hbnu.bean.MingXi;

import java.util.List;

public interface CheckService {
    CheckObj selectBy(String dateObj, Integer tid, Integer sid);


    void saveCheckObj(String dateObj, Integer sid, Integer tid ,String str);

    void updateCheckObj(CheckObj checkObj);

    List<MingXi> findMingXiByTid(Integer tid);

    List<CheckObj> findByDate(String date, Integer tid);

    CheckObj selectBeiZhuByids(String date,Integer tid, Integer sid);
}
