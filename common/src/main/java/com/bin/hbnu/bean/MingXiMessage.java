package com.bin.hbnu.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MingXiMessage {
    private String stuLoginAccount;
    private String tname;
    private String course;
    private Integer subtract;
    private Integer qingjia;
}
