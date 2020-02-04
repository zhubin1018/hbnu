package com.bin.hbnu.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName AjaxResult
 * @date 2020/2/2 22:39
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AjaxResult {
    private Boolean success;
    // data 用来存放ajax请求返回的数据
    private Object data;
}
