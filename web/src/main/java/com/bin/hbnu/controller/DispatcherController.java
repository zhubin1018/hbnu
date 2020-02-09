package com.bin.hbnu.controller;

import com.bin.hbnu.bean.AjaxResult;
import com.bin.hbnu.bean.Teacher;
import com.bin.hbnu.bean.User;
import com.bin.hbnu.service.StudentService;
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

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();// 使Session中的数据失效
        return "redirect:/toLogin";
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
                session.setAttribute("userName",userName);
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
