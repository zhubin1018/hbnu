package com.bin.hbnu.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName User
 * @date 2020/2/2 16:27
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private String loginAccount;

    private String password;

    private String userType;
}
