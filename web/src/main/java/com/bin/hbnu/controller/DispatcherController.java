package com.bin.hbnu.controller;

import com.bin.hbnu.bean.AjaxResult;
import com.bin.hbnu.bean.Student;
import com.bin.hbnu.bean.Teacher;
import com.bin.hbnu.bean.User;
import com.bin.hbnu.service.StudentService;
import com.bin.hbnu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @author Bin1018
 * @Description TODO
 * @ClassName DispatcherController
 * @date 2020/2/2 22:37
 **/
@Controller
public class DispatcherController {

    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();// 使Session中的数据失效
        return "redirect:/toLogin";
    }

    @RequestMapping("/toChange")
    public String toChange(HttpSession session,
                           @RequestParam(value = "course" , required = false)String course,
                           @RequestParam(value = "password")String password){
        User user = (User)session.getAttribute("user");
        String userType = user.getUserType();
        if (userType.equals("teacher")){
            Teacher teacher = teacherService.validateTeacher(user);
            Integer tid = teacher.getTid();
            teacherService.updateCouresAndPassword(course,password,tid);

        }
        if (userType.equals("student")){
            Student student = studentService.validateStudent(user);
            Integer sid = student.getSid();
            studentService.updatePassword(password,sid);
        }
        if (userType.equals("parents")){
            Student student = studentService.validateParents(user);
            Integer sid = student.getSid();
            studentService.updateParents_Password(password,sid);
        }
        return "redirect:/logout";
    }
    @RequestMapping("/changeMyself")
    public String changeMyself(HttpSession session,Map map){
        User user = (User)session.getAttribute("user");
        String name = null;
        String userType = user.getUserType();
        if (userType.equals("teacher")){
            Teacher teacher = teacherService.validateTeacher(user);
            name = teacher.getTname();
            String course = teacher.getCourse();
            map.put("course",course);
        }
        if (userType.equals("student") || userType.equals("parents")){
            Student student = studentService.validateStudent(user);
            name = student.getSname();
            String ssex = student.getSsex();
            map.put("ssex",ssex);
        }

        map.put("name",name);
        map.put("user",user);
        return "changeMyself";
    }

    @ResponseBody
    @RequestMapping("/doAjaxLogin")
    public AjaxResult doAjaxLogin(User user, HttpSession session) {
        System.out.println(user.getUserType());
        String userName = null;
        // 创建AjaxResult对象
        AjaxResult ajaxResult = new AjaxResult();
        if (user.getUserType().equals("teacher")) {
            Teacher teacher = teacherService.validateTeacher(user);
            if (teacher != null) {
                userName = teacher.getTname();
                ajaxResult.setSuccess(true);
                session.setAttribute("teacher", teacher);
                session.setAttribute("user", user);
                session.setAttribute("userName", userName);
            } else {
                ajaxResult.setSuccess(false);
            }
        }
        if (user.getUserType().equals("student")) {
            Student student = studentService.validateStudent(user);
            if (student != null) {
                userName = student.getSname();
                ajaxResult.setSuccess(true);
                session.setAttribute("student", student);
                session.setAttribute("user", user);
                session.setAttribute("userName", userName);
            } else {
                ajaxResult.setSuccess(false);
            }
        }
        if (user.getUserType().equals("parents")) {
            Student student = studentService.validateParents(user);
            if (student != null) {
                userName = student.getSname();
                ajaxResult.setSuccess(true);
                session.setAttribute("student", student);
                session.setAttribute("user", user);
                session.setAttribute("userName", userName);
            } else {
                ajaxResult.setSuccess(false);
            }
        }
        return ajaxResult;
    }

    @RequestMapping("/toMain")
    public String toMain(HttpSession session) {
        User user = (User) session.getAttribute("user");
        String userType = user.getUserType();
        if (userType.equals("teacher")) {
            /*session.setAttribute("user", user);*/
            return "redirect:/teacher/toTeacherMain";
        } else if (userType.equals("student")) {
            return "redirect:/student/toStudentMain";
        } else {
            return "redirect:/student/toParentsMain";
        }
    }
}
