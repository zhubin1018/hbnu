package com.bin.hbnu.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MingXi {
    private Integer id;
    private Integer tid;
    private Integer sid;
    private String dateObj;
    private String beiZhu;
    private String sname;
    private String tname;
    private String course;

}
