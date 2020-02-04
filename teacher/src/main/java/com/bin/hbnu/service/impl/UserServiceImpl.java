package com.bin.hbnu.service.impl;

import com.bin.hbnu.bean.User;
import com.bin.hbnu.dao.UserMapper;
import com.bin.hbnu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName UserServiceImpl
 * @date 2020/2/2 16:36
 **/
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    public User getUserById(Integer id) {
        return userMapper.findUserById(id);
    }
}
