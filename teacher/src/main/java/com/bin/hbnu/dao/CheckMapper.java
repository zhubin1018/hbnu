package com.bin.hbnu.dao;

import com.bin.hbnu.bean.CheckObj;
import com.bin.hbnu.bean.MingXi;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CheckMapper {
    CheckObj selectBy(@Param("dateObj") String dateObj, @Param("tid")Integer tid, @Param("sid")Integer sid);


    void saveCheckObj(@Param("dateObj") String dateObj, @Param("sid") Integer sid, @Param("tid") Integer tid,@Param("beiZhu") String str);

    void updateCheckObj(CheckObj checkObj);

    List<MingXi> findMingXiByTid(@Param("tid") Integer tid);

    List<CheckObj> findByDate(@Param("dateObj") String date, @Param("tid") Integer tid);

    CheckObj selectBeiZhuByids(@Param("dateObj") String date,@Param("tid")Integer tid, @Param("sid")Integer sid);
}
