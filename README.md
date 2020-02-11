# HBNU
## 项目介绍
>本项目是使用ssm框架开发的课堂教学助手web应用

* * *

#### 开发技术

* 前端技术 : Bootstrap + jQuery + Layer
* 后端技术 ：Spring + SpringMVC + MyBatis
* 依赖管理：Maven
* 版本控制：Git
* 数据库： MySQL 
* 服务器： Tomcat

* * *
#### 开发工具

IntelliJ IDEA + MySQL + Git + Chrome

* * *


#### 项目功能介绍及演示:


 ##### 教师端

*  **成绩明细:**
> 1.教师登陆成功后即可查询自己课程下所有学生的考勤,平时成绩等数据;
> ![353bcf7974b5160129f2b393afa28329.png](en-resource://database/1624:0)
> 2.教师可进行学号或姓名的模糊查询定位到某个学生;
> ![e82ebff362882a0d2d395558e1d8b03f.png](en-resource://database/1626:0)
> ![fbfd68d783d00ac109c68c07bf90a6f7.png](en-resource://database/1628:0)
> 3.教师可修改某个学生的平时成绩以及考试成绩,系统根据平时成绩考试成绩判断给分是否超过标准并按比例自动算期末成绩;;
> ![7405ce64f155ec85e05bb85f98daa645.png](en-resource://database/1630:0)

* **点名答题**
>1.教师可进行随机抽奖的形式,抽去班上同学进行回答问题
>![42291cde8a72087bb4fe66cdcdeb9f15.png](en-resource://database/1632:0)
>2.教师可根据学生回答问题情况进行适当加分减分进行奖惩
>![7cf49214f0da5b95f8f98e53968970ef.png](en-resource://database/1634:0)
* **上课点名**
> 1.教师可用本系统进行课堂点名记录数据并实施扣分,系统同步记录并扣分
>![4b1a92bcc29a871515d881117cf9216a.png](en-resource://database/1636:0)


>![0f649470a066b4d8b6e1bf76d1ec793f.png](en-resource://database/1644:0)



>2.若意外点错也可直接更正,之前记录数据也会同步更正
>![3381b728f39a88ed1f35623118edf250.png](en-resource://database/1642:1)

* **个人设置**
>教师可通过个人设置更改课程名以及修改密码
>![6dd9e77187f2d4b0e2e4d6c061f083e2.png](en-resource://database/1652:0)
* **退出系统**
>![89facac9889cf718d6cccfd8fe96c748.png](en-resource://database/1654:0)


* * *
##### 学生端
>成绩明细 : 学生登录即可看到各科成绩的明细,同样可进行模糊查询
>![9f0010bad551a9d42584e45f4c1c73db.png](en-resource://database/1646:0)
>考勤明细 : 学生登录后可查看各科老师点名情况中自己的考勤记录
>![f6eb2f55e8e3aeecdad0a97850fd6cbf.png](en-resource://database/1648:0)
>个人设置
>学生可通过个人设置修改登录密码及性别
>![76b300297c85468b77e9bcd7b31aad1c.png](en-resource://database/1656:0)

>##### 家长端
>家长端功能同学生端,主要便于家长查看学生成绩以及考勤


* * *
#### 安装

1. git clone https://github.com/zhubin1018/hbnu.git

2. 打开IDEA --> File --> New --> Open

3. 项目导入后，打开 Project Settings -->Project 设置 Project SDK (本项目JDK版本需在1.8以上)

4. 打开File --> Settings --> Build,Execution,Deployment -->Maven 配置maven相关信息

5. 在 sql 包下，执行 seckill.sql 与 execute_seckill.sql，建立数据库，然后找到 jdbc.properties 文件修改username and password

* * *
#### 项目启动

* 启动 MySQL

* 为项目添加 tomacat 服务器，部署项目并运行

* 打开浏览器进入 http://localhost:8080/

* 成功