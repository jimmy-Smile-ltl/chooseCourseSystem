<%@page import="classes.Courses"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="readFromDB.GetCourse" %>
<%@ page import ="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<!-- 获取原数据 -->
<meta charset="UTF-8">
<title>修改课程信息</title>
	<%
		 request.setCharacterEncoding("UTF-8");
		 String message=String.valueOf((request.getSession().getAttribute("alter_course_message")));
		%>
		<script>
		var message='<%=message%>';
		if(message.length!=0&&message!="null"){
			alert(message);
		}
		</script>	
		<%//复原
			request.getSession().setAttribute("alter_course_message","");
		%>		

<% String CuoID=request.getParameter("CuoID"); 
   String action="http://jimmysmile.site:8080/my_term_project_xuanke/adminServlet?action=alter_course";
%>
</head>
<body>

 <% 
  String adminID=String.valueOf((request.getSession().getAttribute("ID")));
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
			<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/look_course.jsp">查看课程</a>
			<a href="http://jimmysmile.site:8080/my_term_project_xuanke/admin/add_course.jsp"  class="selected">添加课程</a>
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
  <form name="alterCourses" action="<%=action%>" method="post">
  <table border="1" align="center">
       <tr>
       	 <th></th>
         <th>课程编号</th>
         <th>课程名称</th>
         <th>授课教师</th>
         <th>先修课</th>
         <th>上课时间</th>
		 <th>上课地点</th>
		 <th>人数限制</th>
		 <th>已选人数</th>	
	  </tr>
	          <%
           GetCourse get=new GetCourse();
           List<Courses> list = get.getByTableName("course");
           for(Courses course:list){
           		if(CuoID.equals(course.getCuoId())){
           		request.getSession().setAttribute("Alter_course_ID", course.getCuoId());
           %>
         <tr> <th>课程信息</th>
              <td><%=course.getCuoId() %></td>
              <td><%=course.getCuoName() %></td>
              <td><%=course.getCuoTeacher()  %></td>
              <td><%=course.getCuoPro() %></td>
              <td><%=course.getCuoTime() %></td>
              <td><%=course.getCuoPosition()%></td>     
              <td><%=course.getCuoLimmit()%></td>
              <td><%=course.getCuoChoesd() %></td>
         </tr>
         <tr>
         	  <th>修改信息</th>
              <td><%=course.getCuoId() %>（不可修改）</td>
              <td><input name="CuoName" type="text" value="<%=course.getCuoName() %>"/></td>
              <td><input name="CuoTeacher" type="text" value="<%=course.getCuoTeacher() %>"/></td>
              <td><input name="CuoPro" type="text" value="<%=course.getCuoPro() %>"/></td>
              <td><input name="CuoTime" type="text" value="<%=course.getCuoTime() %>"/></td>
              <td><input name="CuoPosition" type="text" value="<%=course.getCuoPosition() %>"/></td>     
              <td><input name="CuoLimit" type="text" value="<%=course.getCuoLimmit()%>"/></td>
              <td><input name="CuoChosed" type="text" value="<%=course.getCuoChoesd()%>"/></td>
         </tr>
	  </table>
	  <%
	  			}
          } 
          %>
   <p align="center">
   		<input type="submit" value="提交" >     <input type="reset"	 value="重置">
   	  </p>
   	  </form>
</body>
</html>