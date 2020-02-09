package com.bin.hbnu.controller;

import com.bin.hbnu.bean.*;
import com.bin.hbnu.service.CheckService;
import com.bin.hbnu.service.CoursegradeService;
import com.bin.hbnu.service.StudentService;
import com.bin.hbnu.service.TeacherService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

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
    @Autowired
    private CheckService checkService;

    @ModelAttribute
    public void getCoursegrade(@RequestParam(value = "tid", required = false, defaultValue = "0") Integer tid,
                               @RequestParam(value = "sid", required = false, defaultValue = "0") Integer sid,
                               Map map) {
        if (tid != 0 && sid != 0) {
            Coursegrade coursegrade = coursegradeService.findByTidSid(tid, sid);
            map.put("coursegrade", coursegrade);
        }
    }


    @RequestMapping("/selectLike")
    public String selectLike(@RequestParam(value = "stuLog", required = false) String stuLog,
                             @RequestParam(value = "stuName", required = false) String stuName,
                             @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "8") Integer pageSize,
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
    public String index(@ModelAttribute("coursegrade") Coursegrade coursegrade,
                        @RequestParam(value = "stuLog", required = false) String stuLog,
                        @RequestParam(value = "stuName", required = false) String stuName,
                        @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
                        @RequestParam(value = "pageSize", required = false, defaultValue = "8") Integer pageSize,
                        HttpSession session,

                        Map map) {
        String tname = (String) session.getAttribute("userName");
        /*算分*/
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
                                @RequestParam(value = "pageSize", required = false, defaultValue = "8") Integer pageSize,
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


    /*  @RequestMapping("/toCheckMingXi")
      public String toCheckMingXi(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
                                  @RequestParam(value = "pageSize", required = false, defaultValue = "2") Integer pageSize,
                                  HttpSession session,
                                  Map map){
          Teacher teacher = (Teacher) session.getAttribute("teacher");
          Integer tid = teacher.getTid();
          PageHelper.startPage(pageNo, pageSize);
          List<MingXi> list = checkService.findMingXiByTid(tid);
          PageInfo<MingXi> info = new PageInfo<MingXi>(list);
          map.put("info",info);
          map.put("pageNo",pageNo);
          return "checkMingXi";
      }*/
    @ResponseBody
    @RequestMapping("/dianMingByAjax")
    public AjaxResult dianMingByAjax(HttpSession session) {
        String tname = (String) session.getAttribute("userName");
        AjaxResult ajaxResult = new AjaxResult();
        ArrayList<String> arr = new ArrayList<String>();
        try {
            List<Coursegrade> coursegrades = coursegradeService.selectCourByTname(tname);
            for (Coursegrade coursegrade : coursegrades) {
                arr.add(coursegrade.getSname());
            }
            System.out.println(arr);
            ajaxResult.setData(arr);
            ajaxResult.setSuccess(true);
        } catch (Exception e) {
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }

    @ResponseBody
    @RequestMapping("/stuAddFiveByAjax")
    public AjaxResult stuAddFiveByAjax(String sname, HttpSession session) {
        AjaxResult ajaxResult = new AjaxResult();
        try {
            String tname = (String) session.getAttribute("userName");
            Coursegrade coursegrade = coursegradeService.selectCourByTnameSname(tname, sname);
            int agrade = Integer.parseInt(coursegrade.getAgrade()) + 5;
            if (agrade > 100) {
                agrade = 100;
            }
            int bgrade = Integer.parseInt(coursegrade.getBgrade());
            if (bgrade > 100) {
                bgrade = 100;
            }
            double proportion = Double.parseDouble(coursegrade.getProportion());
            String grade = Math.round(agrade * proportion + bgrade * (1 - proportion)) + "";
            coursegrade.setGrade(grade);
            coursegrade.setAgrade(agrade + "");
            coursegradeService.updateCourByCour(coursegrade);
            ajaxResult.setSuccess(true);
            ajaxResult.setData(agrade);
        } catch (Exception e) {
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }

    @ResponseBody
    @RequestMapping("/stuAddTenByAjax")
    public AjaxResult stuAddTenByAjax(String sname, HttpSession session) {
        AjaxResult ajaxResult = new AjaxResult();
        try {
            String tname = (String) session.getAttribute("userName");
            Coursegrade coursegrade = coursegradeService.selectCourByTnameSname(tname, sname);
            int agrade = Integer.parseInt(coursegrade.getAgrade()) + 10;
            if (agrade > 100) {
                agrade = 100;
            }
            int bgrade = Integer.parseInt(coursegrade.getBgrade());
            if (bgrade > 100) {
                bgrade = 100;
            }
            double proportion = Double.parseDouble(coursegrade.getProportion());
            String grade = Math.round(agrade * proportion + bgrade * (1 - proportion)) + "";
            coursegrade.setGrade(grade);
            coursegrade.setAgrade(agrade + "");
            ajaxResult.setSuccess(true);
            ajaxResult.setData(agrade);
            coursegradeService.updateCourByCour(coursegrade);
        } catch (Exception e) {
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }

    @ResponseBody
    @RequestMapping("/stuSubFiveByAjax")
    public AjaxResult stuSubFiveByAjax(String sname, HttpSession session) {
        AjaxResult ajaxResult = new AjaxResult();
        System.out.println(sname);
        try {
            String tname = (String) session.getAttribute("userName");
            Coursegrade coursegrade = coursegradeService.selectCourByTnameSname(tname, sname);
            int agrade = Integer.parseInt(coursegrade.getAgrade()) - 5;
            if (agrade > 100) {
                agrade = 100;
            }
            int bgrade = Integer.parseInt(coursegrade.getBgrade());
            if (bgrade > 100) {
                bgrade = 100;
            }
            double proportion = Double.parseDouble(coursegrade.getProportion());
            String grade = Math.round(agrade * proportion + bgrade * (1 - proportion)) + "";
            coursegrade.setGrade(grade);
            coursegrade.setAgrade(agrade + "");
            ajaxResult.setSuccess(true);
            ajaxResult.setData(agrade);
            coursegradeService.updateCourByCour(coursegrade);
        } catch (Exception e) {
            ajaxResult.setSuccess(false);
        }
        return ajaxResult;
    }


    @RequestMapping("/toSubract")
    public String toSubract(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
                            @RequestParam(value = "pageSize", required = false, defaultValue = "7") Integer pageSize,
                            HttpSession session,
                            Map map) {
        Date d = new Date();
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        Integer tid = teacher.getTid();
        String tname = teacher.getTname();
        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日hh时");
        String date = format.format(d);
        List<CheckObj> checkObjs = checkService.findByDate(date, tid);
        System.out.println("========================================================================");
        System.out.println("checkObjs = " + checkObjs);
        PageHelper.startPage(pageNo, pageSize);
        List<Coursegrade> coursegrades = coursegradeService.selectCourByTname(tname);
        for (Coursegrade coursegrade : coursegrades) {
            coursegrade.setDateObj(date);
        }
        if (!checkObjs.isEmpty()) {
            System.out.println("222222222222222222222222222222222222222222222222222222222222222");
            for (Coursegrade coursegrade : coursegrades) {
                Integer sid = coursegrade.getSid();
                CheckObj checkObj = checkService.selectBeiZhuByids(date, tid, sid);
                String beiZhu = "";
                if (checkObj != null) {
                    beiZhu = checkObj.getBeiZhu();
                }
                coursegrade.setBeiZhu(beiZhu);
            }
        }


        PageInfo<Coursegrade> info = new PageInfo<Coursegrade>(coursegrades);
        map.put("info",info);
        map.put("dateObj", date);
        return "subract";
    }

    @ResponseBody
    @RequestMapping("/toCheckByAjax")
    private AjaxResult toCheckByAjax(String dateObj, String str, Integer sid, HttpSession session) {
        AjaxResult ajaxResult = new AjaxResult();
        String tname = (String) session.getAttribute("userName");
        Coursegrade coursegrade = coursegradeService.finCourBySidTname(sid, tname);
        Integer tid = coursegrade.getTid();
        CheckObj checkObj = checkService.selectBy(dateObj, tid, sid);
        if (checkObj == null) {
            checkService.saveCheckObj(dateObj, sid, tid, str);
            CheckObj checkObjNew = checkService.selectBy(dateObj, tid, sid);
            if (str.equals("已到")) {
                ajaxResult.setSuccess(true);
                return ajaxResult;
            }
            Boolean aBoolean = changeStr(str, checkObjNew, coursegrade);
            ajaxResult.setSuccess(aBoolean);
            return ajaxResult;

        } else {
            String beiZhu = checkObj.getBeiZhu();
            Boolean aBoolean = notNull(beiZhu, str, checkObj, coursegrade);
            ajaxResult.setSuccess(aBoolean);
            return ajaxResult;
        }
    }

    public Boolean notNull(String beiZhu, String str, CheckObj checkObj, Coursegrade coursegrade) {
        if (beiZhu.equals(str)) {
            return true;
        } else {
            recoverAll(beiZhu, coursegrade);
            return changeStr(str, checkObj, coursegrade);
        }
    }

    public Boolean changeStr(String str, CheckObj checkObj, Coursegrade coursegrade) {
        if (str.equals("已到")) {
            checkObj.setBeiZhu("已到");
            checkService.updateCheckObj(checkObj);
        }
        if (str.equals("请假")) {
            qingjia(checkObj, coursegrade);
        }
        if (str.equals("缺勤扣5分")) {
            queQing(5, checkObj, coursegrade);
        }
        if (str.equals("缺勤扣10分")) {
            queQing(10, checkObj, coursegrade);
        }
        if (str.equals("缺勤扣15分")) {
            queQing(15, checkObj, coursegrade);
        }
        return true;
    }

    public void recoverAll(String beiZhu, Coursegrade coursegrade) {
        if (beiZhu.equals("请假")) {
            Integer qingjia = coursegrade.getQingjia() - 1;
            if (qingjia < 0) {
                qingjia = 0;
            }
            coursegrade.setQingjia(qingjia);
            coursegradeService.updateCourByCourCheck(coursegrade);
        }
        if (beiZhu.equals("缺勤扣5分")) {
            queQingAdd(5, coursegrade);
        }
        if (beiZhu.equals("缺勤扣10分")) {
            queQingAdd(10, coursegrade);
        }
        if (beiZhu.equals("缺勤扣15分")) {
            queQingAdd(15, coursegrade);
        }
    }

    public void queQing(Integer sub, CheckObj checkObj, Coursegrade coursegrade) {
        Integer subtract = coursegrade.getSubtract();
        Integer agrade = Integer.parseInt(coursegrade.getAgrade());
        Integer bgrade = Integer.parseInt(coursegrade.getBgrade());
        Double proportion = Double.parseDouble(coursegrade.getProportion());
        String grade = coursegrade.getGrade();
        coursegrade.setSubtract(subtract + 1);
        agrade = agrade - sub;
        if (agrade < 0) {
            agrade = 0;
        }
        checkObj.setBeiZhu("缺勤扣" + sub + "分");
        grade = Math.round(agrade * proportion + bgrade * (1 - proportion)) + "";
        coursegrade.setAgrade(agrade + "");
        coursegrade.setGrade(grade);

        checkService.updateCheckObj(checkObj);
        coursegradeService.updateCourByCourCheck(coursegrade);
    }

    public void queQingAdd(Integer sub, Coursegrade coursegrade) {
        Integer subtract = coursegrade.getSubtract();
        Integer agrade = Integer.parseInt(coursegrade.getAgrade());
        Integer bgrade = Integer.parseInt(coursegrade.getBgrade());
        Double proportion = Double.parseDouble(coursegrade.getProportion());
        String grade = coursegrade.getGrade();
        int i = subtract - 1;
        if (i < 0) {
            i = 0;
        }
        coursegrade.setSubtract(i);
        agrade = agrade + sub;
        if (agrade > 100) {
            agrade = 100;
        }
        grade = Math.round(agrade * proportion + bgrade * (1 - proportion)) + "";
        coursegrade.setAgrade(agrade + "");
        coursegrade.setGrade(grade);
        coursegradeService.updateCourByCourCheck(coursegrade);
    }

    public void qingjia(CheckObj checkObj, Coursegrade coursegrade) {
        coursegrade.setQingjia(coursegrade.getQingjia() + 1);
        checkObj.setBeiZhu("请假");
        checkService.updateCheckObj(checkObj);
        coursegradeService.updateCourByCourCheck(coursegrade);
    }


}
