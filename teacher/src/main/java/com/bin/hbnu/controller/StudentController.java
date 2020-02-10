package com.bin.hbnu.controller;

import com.bin.hbnu.bean.Coursegrade;
import com.bin.hbnu.bean.User;
import com.bin.hbnu.service.CoursegradeService;
import com.bin.hbnu.service.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName StudentController
 * @date 2020/2/3 22:57
 **/
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private CoursegradeService coursegradeService;
    @Autowired
    private StudentService studentService;

    @RequestMapping("/toStudentMain")
    public String toStudentMain(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
                                @RequestParam(value = "pageSize", required = false, defaultValue = "2") Integer pageSize,
                                HttpSession session,
                                Map map) {
        User user = (User) session.getAttribute("user");
        String loginAccount = user.getLoginAccount();
        PageHelper.startPage(pageNo, pageSize);
        List<Coursegrade> courByStuLog = coursegradeService.findCourByStuLog(loginAccount);
        PageInfo<Coursegrade> info = new PageInfo<Coursegrade>(courByStuLog);
        map.put("pageNo", pageNo);
        map.put("info", info);
        return "studentMain";
    }
    @RequestMapping("/selectLike")
    public String selectLike(@RequestParam(value = "course", required = false) String course,
                             @RequestParam(value = "tname", required = false) String tname,
                             @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "2") Integer pageSize,
                             HttpSession session,
                             Map map) {
        String sname = (String) session.getAttribute("userName");
        PageHelper.startPage(pageNo, pageSize);
        List<Coursegrade> coursegrades = coursegradeService.StufindBy(sname, course, tname);
        PageInfo<Coursegrade> info = new PageInfo<Coursegrade>(coursegrades);
        map.put("course", course);
        map.put("tname", tname);
        map.put("info", info);
        map.put("pageNo", pageNo);
        return "studentMain";
    }
    @RequestMapping("/mingXi")
    public String mingXi(){
        return "stu_mingXi";
    }

}
