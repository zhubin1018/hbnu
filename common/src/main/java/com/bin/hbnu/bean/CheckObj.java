package com.bin.hbnu.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CheckObj {
    private Integer id;
    private String dateObj;
    private Integer sid;
    private Integer tid;
    private String beiZhu;


    /*info*/
    private MingXiMessage mingXiMessage;
}
