package com.bin.hbnu.controller;

import com.bin.hbnu.bean.*;
import com.bin.hbnu.service.CoursegradeService;
import com.bin.hbnu.service.StudentService;
import com.bin.hbnu.service.TeacherService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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
    @Autowired
    private CoursegradeService coursegradeService;

    @RequestMapping("/selectLike")
    public String selectLike(@RequestParam(value = "stuLog", required = false) String stuLog,
                             @RequestParam(value = "stuName", required = false) String stuName,
                             @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "2") Integer pageSize,
                             HttpSession session,
                             Map map) {
        String tname = (String) session.getAttribute("userName");
        PageHelper.startPage(pageNo, pageSize);
        List<Coursegrade> coursegrades = coursegradeService.findBy(tname, stuLog, stuName);
        PageInfo<Coursegrade> info = new PageInfo<Coursegrade>(coursegrades);
        map.put("stuLog", stuLog);
        map.put("stuName", stuName);
        map.put("info", info);
        map.put("pageNo", pageNo);
        return "teacherMain";
    }

    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public String index(@RequestParam(value = "stuLog", required = false) String stuLog,
                        @RequestParam(value = "stuName", required = false) String stuName,
                        @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
                        @RequestParam(value = "pageSize", required = false, defaultValue = "2") Integer pageSize,
                        HttpSession session,
                        Coursegrade coursegrade,
                        Map map) {
        String tname = (String) session.getAttribute("userName");
        /*算分*/
        System.out.println(tname+"8888888888888888888888888888888888888888888888888888888888888888888");
        System.out.println("coursegrade = " + coursegrade);
        System.out.println(coursegrade.getSname());
        System.out.println(" = 77777777777777777777777777777777777777777777777777777777777777777777777777");
        Integer agrade = Integer.parseInt(coursegrade.getAgrade());
        if (agrade > 100) {
            agrade = 100;
        }
        Integer bgrade = Integer.parseInt(coursegrade.getBgrade());
        if (bgrade > 100) {
            bgrade = 100;
        }
        Double proportion = Double.parseDouble(coursegrade.getProportion());
        String grade = Math.round(agrade * proportion + bgrade * (1 - proportion)) + "";
        coursegrade.setGrade(grade);
        coursegradeService.updateCourByCour(coursegrade);

        PageHelper.startPage(pageNo, pageSize);
        List<Coursegrade> coursegrades = coursegradeService.findBy(tname, stuLog, stuName);
        PageInfo<Coursegrade> info = new PageInfo<Coursegrade>(coursegrades);
        map.put("stuLog", stuLog);
        map.put("stuName", stuName);
        map.put("info", info);
        map.put("pageNo", pageNo);
        return "teacherMain";
    }

    @RequestMapping("/toTeacherEndit")
    public String toTeacherEndit(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
                                 @RequestParam(value = "stuLog", required = false) String stuLog,
                                 @RequestParam(value = "stuName", required = false) String stuName,
                                 @RequestParam(value = "sid") Integer sid,
                                 @RequestParam(value = "tid") Integer tid,
                                 Map map) {
        Coursegrade coursegrade = coursegradeService.selectCourByIds(sid, tid);
        map.put("pageNo", pageNo);
        map.put("stuLog", stuLog);
        map.put("stuName", stuName);
        map.put("coursegrade", coursegrade);
        return "teacherEndit";
    }

    @RequestMapping("/toTeacherMain")
    public String toTeacherMain(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
                                @RequestParam(value = "pageSize", required = false, defaultValue = "2") Integer pageSize,
                                HttpSession session,
                                Map map) {

        List<Coursegrade> coursegrades = null;
        try {
            User user = (User) session.getAttribute("user");
            Teacher teacher = teacherService.validateTeacher(user);
            Integer tid = teacher.getTid();
            PageHelper.startPage(pageNo, pageSize);
            coursegrades = studentService.selectCoursegradeByids(tid);

        } catch (Exception e) {
        }
        PageInfo<Coursegrade> info = new PageInfo<Coursegrade>(coursegrades);
        map.put("info", info);
        map.put("pageNo", pageNo);
        return "teacherMain";
    }


    @ResponseBody
    @RequestMapping("/ajaxAdd")
    public AjaxResult ajaxAdd(@RequestParam("add") Integer add, Coursegrade coursegrade) {
        AjaxResult ajaxResult = new AjaxResult();
        System.out.println("add = " + add);
        System.out.println(Integer.parseInt(coursegrade.getAddgrade()));
        String addgrade = (Integer.parseInt(coursegrade.getAddgrade()) + add) + "";
        Integer sid = coursegrade.getSid();
        Integer tid = coursegrade.getTid();
        try {
            Coursegrade coursegradeByIds = teacherService.findCoursegradeByIds(sid, tid);
            Integer agrade = Integer.parseInt(coursegradeByIds.getAgrade()) + add;
            if (agrade > 100) {
                agrade = 100;
            }
            Integer bgrade = Integer.parseInt(coursegradeByIds.getBgrade());
            if (bgrade > 100) {
                bgrade = 100;
            }
            Double proportion = Double.parseDouble(coursegradeByIds.getProportion());
            String grade = Math.round(agrade * proportion + bgrade * (1 - proportion)) + "";
            coursegradeByIds.setAgrade(agrade + "");
            coursegradeByIds.setGrade(grade);
            coursegradeByIds.setAddgrade(addgrade);
            teacherService.updateCoursegrade(coursegradeByIds);
            ajaxResult.setSuccess(true);
        } catch (Exception e) {
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }
}
