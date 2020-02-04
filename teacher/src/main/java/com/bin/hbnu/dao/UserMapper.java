package com.bin.hbnu.dao;

import com.bin.hbnu.bean.User;
import org.apache.ibatis.annotations.Select;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName UserMapper
 * @date 2020/2/2 16:20
 **/
public interface UserMapper {
    @Select("SELECT * FROM user WHERE id = #{id}")
    User findUserById(Integer id);
}
