<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="readFromDB.GetStudent" %>
<%@ page import ="java.util.List" %>
<%@ page import ="classes.Students" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查看个人信息</title>
	<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="../resource/css/list.css">
</head>
    <style type="text/css" >
    td{
    padding:5px 30px;
    width:max-content;
    border:1px solid #cccccc;
    }
    th{
    padding:5px 30px;
     border:1px solid #cccccc;
    }
    table{
    display:block;
	margin: 20px auto;
	border-collapse: collapse;
	width: max-content;
	}
	tr:nth-child(odd) {
	  background-color:#F5F5F5;
	  border:1px solid #cccccc;
	}
	tr:nth-child(even) {
	  background-color:#00ffff;
	  border:1px solid #00ffff;
	}
	    
    </style>
<body>
<%  String ID=String.valueOf( request.getSession().getAttribute("ID")); 
	if(ID.equals("null")){
		   response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/index.jsp");
	}
%>
<div class="list">
    <li class="now">当前位置：个人信息</li>
    <li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/choose_course.jsp">继续选课</a></li>
    <li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/showCourse.jsp">已选课程</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/schudule.jsp">查看课表</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/updatePW.jsp">修改密码</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/alter_phone.jsp">密保手机</a></li>
	<li class="exit"><a href="http://jimmysmile.site:8080/my_term_project_xuanke/studentServlet?action=exit">退出</a></li>
	<span class="welcome">欢迎学生：<%=ID%></span>
    </div>
		<table>
		       <tr>
		         <th>学号</th>
		         <th>姓名</th>
		         <th>年级</th>
		         <th>专业</th>
		         <th>学院</th>
				 <th>密码</th>
				 <th>手机号码</th>		
				 <th>已修课程</th>	 
		       </tr>
		        <%
		           GetStudent get=new GetStudent();
		           Students student= get.getBySno(ID);  
		        
		   %>
		         <tr>
		              <td><%=student.getStuId() %></td>
		              <td><%=student.getStuName() %></td>
		              <td><%=student.getStuGrage()  %></td>
		              <td><%=student.getStuProfess() %></td>
		              <td><%=student.getStuInstitute()  %></td>
		              <td><%=student.getStuPwd() %></td>     
		              <td><%=student.getStuPhhone() %></td>
		              <td><%=student.getStuCourselearned() %></td>
		           </tr>
		   </table>
		</body>
		
</html>