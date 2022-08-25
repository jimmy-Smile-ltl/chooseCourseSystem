<%@page import="classes.Courses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="readFromDB.GetCourse" %>
<%@ page import ="java.util.List" %>
<%@ page import ="classes.Courses" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resource/css/admin-list.css">
<link rel="shortcut icon" href="../resource/image/logo.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="../resource/css/table-course.css">
<meta charset="UTF-8">
<title>查看课程信息</title>
		<%
		 request.setCharacterEncoding("UTF-8");
		 String message=String.valueOf((request.getSession().getAttribute("look_course_message")));
	     message=message.replace("\n", " \\u000a");
		%>
		<script src="http://jimmysmile.site:8080/my_term_project_xuanke/resource/paging.js">
		var message='<%=message%>';
		if(message.length!=0&&message!="null"){
			alert(message);
		}
		</script>	
		<%//复原
			request.getSession().setAttribute("look_course_message","");
		%>		
<% 
	String adminID=String.valueOf((request.getSession().getAttribute("ID")));
	String action ="http://jimmysmile.site:8080/my_term_project_xuanke/courseServlet?action=alter&who=admin";
%>	



</head>

 <body>
 
 <% 
	if(adminID.equals("null")){
		   response.sendRedirect("http://jimmysmile.site:8080/my_term_project_xuanke/index.jsp");
	}

%>	
 <div id="list">
	  <div id="operate-stu" class="box">
	    <div class="item-span">操作学生信息</div>
	     <div class="item-box">
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_student.jsp">查看学生</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_student.jsp">新增学生</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/select_student.jsp">查找学生</a>
		</div>
		</div>
		<div id="operate-course"  class="box">
		  <div class="item-span">操作课程信息</div>
		    <div id="operate-stu" class="item-box">
			<div class="selected">查看课程</div>
			<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_course.jsp">添加课程</a>
			<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/select_course.jsp">查找课程</a>
		</div>
		</div>
		
		<div id="operate-admin" class="box">
		<div class="item-span">welcome administer  <%=adminID%></div>
		<div class="item-box">
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/updatePW.jsp">修改密码</a>
		<a href="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?action=exit">退出</a>
		</div>
		</div>
</div>
 
 
  <form  name="alterCourses" action="<%=action%>" method="post">
  <table id="show" border="1" align="center">
       <tr>
         <th>课程编号</th>
         <th>课程名称</th>
         <th>授课教师</th>
         <th>先修课</th>
         <th>上课时间</th>
		 <th>上课地点</th>
		 <th>人数限制</th>
		 <th>已选人数</th>		
		 <th>修改</th>
		 <th>删除</th> 		 
       </tr>
        <%
           GetCourse get=new GetCourse();
           List<Courses> list = get.getByTableName("course");  
           for(Courses course:list)
           {%>
         <tr>
              <td><%=course.getCuoId() %></td>
              <td><%=course.getCuoName() %></td>
              <td><%=course.getCuoTeacher()  %></td>
              <td><%=course.getCuoPro() %></td>
              <td><%=course.getCuoTime() %></td>
              <td><%=course.getCuoPosition() %></td>     
              <td><%=course.getCuoLimmit() %></td>
              <td><%=course.getCuoChoesd() %></td>
              <%
              String url="http://jimmysmile.site:8080/my_term_project_xuanke/admin/alter_course.jsp?CuoID=";
              String ID=course.getCuoId();
              String alterfo=url+ID;
              String alter=url+ID;
              String serveletUrl="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?";
              String delete=serveletUrl+"action=delete_course&Cno="+ID;
              %> 
              <td><a href="<%=alter%>"><input type="button"  value="修改"/></a></td>
              <td><a href="<%=delete%>"><input type="button"  value="删除"/></a></td>

           </tr>
             <%}
        %>
        
   </table>
   <div id="page-info"></div>
   </form>
</body>
</html>