<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>选课系统--关于</title>
<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
</head>
<style type="text/css">
.two-box{
	margin:0 10%;
	display:flex; 
	flex-direction:row;
	font-size:15px;
	justify-content: space-around;
}
.fuxian{
margin:0 10%;
}
</style>
<body>
<div class="place">
    <a href="http://jimmysmile.site:8080/my_term_project_xuanke/index.jsp">返回</a>
    </div>
      <h1 style="width:100%;text-align:center">关于</h1>
      <div class="two-box">
 <div class="author">
 		<h3>关于作者</h3>
 		<text>强调：本项目为团队合作产品；考虑到时间精力与隐私，只提供队长相关信息<text><br/>
    	 姓名：JimmySmile<br/>
    	 e-mail:41911238@smail.swufe.edu.cn<br/>
    	 地址：西南财经大学经济信息工程学院19电商1班<br/>
   	</div>
   	<div class="project">
   	<h3>关于项目</h3>
   	    所用技术：JSP+JavaBean+Servlet+JDBC<br/>
    	数据库 MySQL8,推荐使用workbench<br/>
    	运行环境：Tomcat8+eclipse2021-3+MySQL8+JavaSE1.8(JRE1.8)<br/>
    	项目创建时间：2021-07-11<br/>
    	汇报展示时间：2021-7-24<br/>
    	第一次上云  ：2022-6-16<br/>
   	</div>
   	</div>

   	<h1  style="width:100%;text-align:center">复现</h1>
   	   	<div class="fuxian">
   		<span>1. 数据库准备</span>
   		<p>执行src/sql 下的sql文件即可(为避免奇奇怪怪的bug,建议使用推荐版本)</p>
   		 <span>2. 代码修正</span>
   		<p>修正src/main/java/DB.java,检查端口号，用户名，密码，DB.java中写了一个main方法，配置无误的话运行DB.Java,控制台输出 有
   		<image src="../resource/image/db.png"/>
   		</p>
   		<span>3. eclipse下右键点击项目下build path配置依赖
   		<p>mysql-connector 放在了src/main/webapps/WEN-INF/lib ,add JARs导入即可<br/>
   			JSE1.8 配置  点击Add Library 新界面点击JRE System Library  新界面勾选Executive Environment 在下拉到1.8<br/>
   			Tomcat8 配置  先 Window>preferences>server> Runtime  Environment >Add  看不懂自己百度<br/>
   			与上面类似 Add Library 新界面点击Server Runtime<br/>
   			</p>
   		<image src="../resource/image/builpath.png"/>
   	</div>
</body>
</html>