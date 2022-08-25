<%@page import="classes.Courses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="readFromDB.GetCourse" %>
<%@ page import ="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="../resource/css/list.css">
	<link rel="stylesheet" type="text/css" href="../resource/css/table-course.css">
<%	String StuID=String.valueOf((request.getSession().getAttribute("ID")));
if(StuID.equals("null")){
	   response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/index.jsp");
}
%>
<meta charset="UTF-8">
<title>查看课表</title>
		<%
		 request.setCharacterEncoding("UTF-8");
		 String message=String.valueOf((request.getSession().getAttribute("delete_course_message")));
	     message=message.replace("\n", " \\u000a");
	     String action ="http://jimmysmile.site:8080/my_term_project_xuanke/studentServlet?action=delete";
		%>

		<script type="text/javascript">
		var message='<%=message%>';
		if(message.length!=0&&message!="null"){
			alert(message);
		}
		
		</script>	
		<%//复原
			request.getSession().setAttribute("delete_course_message","");
		%>
</head>
 <body>
 	<div class="list">
    <li class="now">当前位置：已选课程</li>
    <li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/choose_course.jsp">继续选课</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/schudule.jsp">查看课表</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/myinfo.jsp">个人信息</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/updatePW.jsp">修改密码</a></li>
	<li><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/alter_phone.jsp">密保手机</a></li>
	<li class="exit"><a href="http://jimmysmile.site:8080/my_term_project_xuanke/studentServlet?action=exit">退出</a></li>
	<span class="welcome">欢迎学生：<%=StuID%></span>
    </div>
	<h2>本学期已选课程</h2>	
   <form name="chooseCourses" action="<%=action%>" method="post">
<table id="show">
       <tr>
         <th>课程编号</th>
         <th>课程名称</th>
         <th>授课教师</th>
         <th>先修课</th>
         <th>上课时间</th>
		 <th>上课地点</th>	
		 <th>删除</th>		 
       </tr>
        <%
           GetCourse get=new GetCourse();
           List<Courses> list = get.getByTableName(StuID+"_course");  
           for(Courses course:list)
           {%>
         <tr>
              <td><%=course.getCuoId() %></td>
              <td><%=course.getCuoName() %></td>
              <td><%=course.getCuoTeacher()  %></td>
              <td><%=course.getCuoPro() %></td>
              <td><%=course.getCuoTime() %></td>
              <td><%=course.getCuoPosition() %></td>  
              <td><input type="checkbox" name="delete_this" value="<%=course.getCuoId() %>"/></td>   
           </tr>
             <%}
        %>
     </table>  

	
    <div  id="submit">
      <button class="submit" type="submit">删除选中课程</button>     
      <button class="reset"><a href="http://jimmysmile.site:8080/my_term_project_xuanke/student/schudule.jsp" >查看课表</a></button>     
   </div>
 </form>
</body>
</html>