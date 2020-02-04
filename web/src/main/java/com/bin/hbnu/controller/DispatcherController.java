package com.bin.hbnu.controller;

import com.bin.hbnu.bean.Student;
import com.bin.hbnu.service.StudentService;
import com.bin.hbnu.bean.AjaxResult;
import com.bin.hbnu.bean.Teacher;
import com.bin.hbnu.bean.User;
import com.bin.hbnu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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


    @ResponseBody
    @RequestMapping("/doAjaxLogin")
    public AjaxResult doAjaxLogin(User user, HttpSession session) {
        System.out.println("=============================================================");
        System.out.println("DispatcherController.doAjaxLogin  1");
        System.out.println(user.getUserType());
        // 创建AjaxResult对象
        AjaxResult ajaxResult = new AjaxResult();
        if (user.getUserType().equals("teacher")) {
           /* user.setLoginAccount("'"+user.getLoginAccount()+"'");
            user.setPassword("'"+user.getPassword()+"'");*/
            System.out.println("DispatcherController.doAjaxLogin  2");
            Teacher teacher = teacherService.validateTeacher(user);
            System.out.println("============================" + teacher);
            if (teacher != null) {
                System.out.println("DispatcherController.doAjaxLogin  3");
                ajaxResult.setSuccess(true);
                session.setAttribute("teacher", teacher);
                session.setAttribute("user", user);
            } else {
                ajaxResult.setSuccess(false);
            }
        }
        return ajaxResult;
    }

    @RequestMapping("/toMain")
    public String toMain(HttpSession session, Map map) {
        User user = (User) session.getAttribute("user");
        System.out.println("============================================================================");
        System.out.println("user = " + user);
        String userType = user.getUserType();
        String loginAccount = user.getLoginAccount();
        if (userType.equals("teacher")) {
            session.setAttribute("user",user);
            return "redirect:/teacher/toTeacherMain";
        } else if (userType.equals("student")) {
            return "studentMain";
        } else {
            return "parentsMain";
        }
    }
}
