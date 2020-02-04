package com.bin.hbnu.controller;

import com.bin.hbnu.bean.Coursegrade;
import com.bin.hbnu.bean.Student;
import com.bin.hbnu.bean.Teacher;
import com.bin.hbnu.bean.User;
import com.bin.hbnu.service.StudentService;
import com.bin.hbnu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName TeacherController
 * @date 2020/2/3 22:16
 **/
@Controller
@RequestMapping("/teacher")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;


    @RequestMapping("/toTeacherMain")
    public String toTeacherMain(HttpSession session,Map map){
        List<Coursegrade> coursegrades = new ArrayList<Coursegrade>();
        String tname = null;
        try {
            User user = (User)session.getAttribute("user");
            Teacher teacher = teacherService.validateTeacher(user);
            Integer tid = teacher.getTid();
            tname = teacher.getTname();
            List<Student> students = studentService.selectStudentByTid(tid);
            for (Student student : students) {
                Integer sid = student.getSid();
                Coursegrade coursegrade = studentService.selectCoursegradeByids(sid, tid);
                if (coursegrade != null){
                    coursegrades.add(coursegrade);
                }
            }
        }catch (Exception e){
        }
        map.put("coursegrades",coursegrades);
        map.put("tname",tname);
        return "teacherMain";
    }
}
