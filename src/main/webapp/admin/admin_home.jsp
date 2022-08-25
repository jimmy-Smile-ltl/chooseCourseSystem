<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="classes.*" %>
<%@ page import ="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resource/css/admin-list.css">
<title>管理员主页</title>
	<%	 //初始化
		 List<Students> flushList=null;
    	 request.getSession().setAttribute("select_students_result",flushList);
    	 List<Courses> flushLista=null;
         request.getSession().setAttribute("select_Courses_result",flushLista);
    	 
		 request.setCharacterEncoding("UTF-8");
		 String message=String.valueOf((request.getSession().getAttribute("admin_message")));
	%>
	<script>
		var message='<%=message%>';
		console.log(message)
		console.log(message.length)
		if(message.length!=0 && message!="null"){
			alert(message);
		}
		</script>	
		<%//复原
			request.getSession().setAttribute("admin_message","");
		%>		

</head>
<body>
<% String adminID=String.valueOf((request.getSession().getAttribute("ID")));%>
<h2 >欢迎管理员：<%=adminID%></h2>
<div>

<div class="list">
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_student.jsp">新增学生</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_student.jsp">删除学生</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_student.jsp">更改学生</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/select_student.jsp">查找学生</a>
		<a></a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_course.jsp">新增课程</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_course.jsp">删除课程</a>		
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_course.jsp">更改课程</a>
	    <a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/select_course.jsp">查找课程</a>
	<select>
	<img alt="头像" src="../resource/image/logo.png">
		<option><a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/updatePW.jsp">修改密码</a></option>
		<option><a href="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?action=exit">退出</a></option>
	</select>
	</img>
	
</div>
</body>
</html>